import 'dart:convert';

import 'package:home_widget/home_widget.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/config/widget_registry.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/widget_background_service.dart';
import 'package:rain/core/weather/unit_converter.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';

/// Pushes current weather and styling into native home screen widgets.
class HomeWidgetService {
  HomeWidgetService(this._assets);

  final AssetCacheService _assets;
  final StatusWeather _statusWeather = StatusWeather();

  /// Formats [temp] for widget display using user unit preferences.
  String _widgetTemperature(double temp, Settings settings) {
    final converted = UnitConverter.convertTemperature(temp, settings);
    if (converted == null) return '--°';
    return '$converted${UnitConverter.temperatureSuffix(settings)}';
  }

  // --- Widget update ---

  /// Reads Isar and writes widget data for all registered widget providers.
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

  /// Builds the JSON payload for the current hour from main weather cache.
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

    final hour = TimeIndexHelper.resolveTimeIndex(
      cache.time!,
      cache.timezone!,
    ).clamp(0, cache.weathercode!.length - 1);

    final day = cache.timeDaily == null || cache.timeDaily!.isEmpty
        ? 0
        : TimeIndexHelper.resolveDayIndex(
            cache.timeDaily!,
            cache.timezone!,
          ).clamp(0, cache.timeDaily!.length - 1);

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
            : _widgetTemperature(temp, settings),
        'icon': currentIcon,
      },
    };
  }

  /// Background entry point: refreshes stale cache and updates widgets from disk.
  static Future<bool> updateFromDisk() => runWidgetBackgroundRefresh(
    (isar) => HomeWidgetService(AssetCacheService()).updateFromIsar(isar),
  );
}
