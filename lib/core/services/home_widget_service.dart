import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:home_widget/home_widget.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/config/app_config.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeWidgetService {
  HomeWidgetService(this._assets);

  final AssetCacheService _assets;

  Future<bool> updateFromIsar(Isar isar) async {
    try {
      final cache = await isar.mainWeatherCaches.where().findFirst();
      if (cache == null ||
          cache.time == null ||
          cache.time!.isEmpty ||
          cache.timezone == null ||
          cache.weathercode == null ||
          cache.temperature2M == null ||
          cache.timeDaily == null ||
          cache.sunrise == null ||
          cache.sunset == null) {
        return false;
      }

      var hour = TimeIndexHelper.getTime(cache.time!, cache.timezone!);
      if (hour < 0) hour = 0;
      var day = TimeIndexHelper.getDay(cache.timeDaily!, cache.timezone!);
      if (day < 0) day = 0;
      hour = hour.clamp(0, cache.weathercode!.length - 1);
      day = day.clamp(0, cache.sunrise!.length - 1);

      final icon = StatusWeather().getImageNotification(
        cache.weathercode![hour],
        cache.time![hour],
        cache.sunrise![day],
        cache.sunset![day],
      );
      final imagePath = await _assets.getLocalImagePath(icon);
      final settings = await isar.settings.where().findFirst() ?? Settings();
      final temp = cache.temperature2M?[hour];
      final degree = temp == null
          ? '--°'
          : StatusData(settings: settings).getDegree(temp);

      final results = await Future.wait<bool?>([
        HomeWidget.saveWidgetData('weather_icon', imagePath),
        HomeWidget.saveWidgetData('weather_degree', degree),
        HomeWidget.saveWidgetData('timeformat', settings.timeformat),
        HomeWidget.updateWidget(androidName: androidWidgetName),
      ]);
      return !results.contains(false);
    } catch (_) {
      return false;
    }
  }

  static Future<bool> updateFromDisk() async {
    try {
      final timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));

      final isar = await Isar.open([
        SettingsSchema,
        MainWeatherCacheSchema,
        LocationCacheSchema,
        WeatherCardSchema,
      ], directory: (await getApplicationSupportDirectory()).path);

      return HomeWidgetService(AssetCacheService()).updateFromIsar(isar);
    } catch (_) {
      return false;
    }
  }
}
