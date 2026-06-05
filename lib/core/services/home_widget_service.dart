import 'dart:convert';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:home_widget/home_widget.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/config/widget_registry.dart';
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
  final StatusWeather _statusWeather = StatusWeather();

  String _temperatureOnly(String? value) {
    final v = value?.trim();
    if (v == null || v.isEmpty) return '';
    if (v == '--°') return v;
    return v.replaceAll(RegExp(r'\s*[A-Za-z]+$'), '');
  }

  Future<bool> updateFromIsar(Isar isar) async {
    try {
      final settings = await isar.settings.where().findFirst() ?? Settings();
      final bundle = await _buildWidgetBundle(isar, settings);

      final backgroundColor = settings.widgetBackgroundColor;
      final textColor = settings.widgetTextColor;

      final saves = <Future<bool?>>[
        if (bundle != null)
          HomeWidget.saveWidgetData('widget_bundle', jsonEncode(bundle))
        else
          HomeWidget.saveWidgetData<String>('widget_bundle', null),
        HomeWidget.saveWidgetData('timeformat', settings.timeformat),
        if (backgroundColor != null && backgroundColor.isNotEmpty)
          HomeWidget.saveWidgetData('background_color', backgroundColor)
        else
          HomeWidget.saveWidgetData<String>('background_color', null),
        if (textColor != null && textColor.isNotEmpty)
          HomeWidget.saveWidgetData('text_color', textColor)
        else
          HomeWidget.saveWidgetData<String>('text_color', null),
        ...rainWidgetRegistry.map(
          (widget) => HomeWidget.updateWidget(
            qualifiedAndroidName: widget.qualifiedAndroidName,
          ),
        ),
      ];

      final results = await Future.wait(saves);
      return !results.contains(false);
    } catch (_) {
      return false;
    }
  }

  Future<Map<String, dynamic>?> _buildWidgetBundle(
    Isar isar,
    Settings settings,
  ) async {
    final cache = await isar.mainWeatherCaches.where().findFirst();
    if (cache == null ||
        cache.time == null ||
        cache.time!.isEmpty ||
        cache.timezone == null ||
        cache.weathercode == null ||
        cache.temperature2M == null) {
      return null;
    }

    var hour = TimeIndexHelper.getTime(cache.time!, cache.timezone!);
    if (hour < 0) hour = 0;
    hour = hour.clamp(0, cache.weathercode!.length - 1);

    var day = 0;
    if (cache.timeDaily != null && cache.timeDaily!.isNotEmpty) {
      day = TimeIndexHelper.getDay(cache.timeDaily!, cache.timezone!);
      if (day < 0) day = 0;
      day = day.clamp(0, cache.timeDaily!.length - 1);
    }

    final statusData = StatusData(settings: settings);
    final location = await isar.locationCaches.where().findFirst();
    final locationName = location?.city ?? location?.district ?? '';

    final sunrise = cache.sunrise != null && day < cache.sunrise!.length
        ? cache.sunrise![day]
        : null;
    final sunset = cache.sunset != null && day < cache.sunset!.length
        ? cache.sunset![day]
        : null;

    final currentIcon = await _assets.getLocalImagePath(
      _statusWeather.getImageNotification(
        cache.weathercode![hour],
        cache.time![hour],
        sunrise ?? '06:00',
        sunset ?? '18:00',
      ),
    );

    final temp = cache.temperature2M?[hour];

    return {
      'current': {
        'location': locationName,
        'temperature': temp == null
            ? '--°'
            : _temperatureOnly(statusData.getDegree(temp)),
        'icon': currentIcon,
      },
    };
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
      ], directory: (await getApplicationSupportDirectory()).path);

      return HomeWidgetService(AssetCacheService()).updateFromIsar(isar);
    } catch (_) {
      return false;
    }
  }
}
