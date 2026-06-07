import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/core/bootstrap/app_initializer.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart' as tz;

/// Payload for a single scheduled weather notification.
class WeatherNotificationSlot {
  const WeatherNotificationSlot({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
  });

  final String title;
  final String body;
  final DateTime time;
  final String icon;
}

/// Builds notification slots from cached hourly forecast data.
List<WeatherNotificationSlot> buildWeatherNotificationSlots({
  required MainWeatherCache cache,
  required Settings settings,
  required AppSettingsState appSettings,
  required String cityLabel,
  DateTime? now,
}) {
  final currentTime = now ?? DateTime.now();
  final startHour = TimeIndexHelper.parseTime(appSettings.timeStart).hour;
  final endHour = TimeIndexHelper.parseTime(appSettings.timeEnd).hour;
  final statusWeather = StatusWeather();
  final statusData = StatusData(settings: settings);
  final slots = <WeatherNotificationSlot>[];

  if (cache.time == null || cache.timeDaily == null) return slots;

  for (var i = 0; i < cache.time!.length; i += appSettings.timeRange) {
    final notificationTime = DateTime.parse(cache.time![i]);
    if (!notificationTime.isAfter(currentTime)) continue;
    if (notificationTime.hour < startHour || notificationTime.hour > endHour) {
      continue;
    }

    for (var j = 0; j < cache.timeDaily!.length; j++) {
      if (cache.timeDaily![j].day != notificationTime.day) continue;

      slots.add(
        WeatherNotificationSlot(
          title: '$cityLabel: ${statusData.getDegree(cache.temperature2M![i])}',
          body:
              '${statusWeather.getText(cache.weathercode![i])} · ${statusData.getTimeFormat(cache.time![i])}',
          time: notificationTime,
          icon: statusWeather.getImageNotification(
            cache.weathercode![i],
            cache.time![i],
            cache.sunrise![j],
            cache.sunset![j],
          ),
        ),
      );
    }
  }

  return slots;
}

/// Schedules local weather notifications from cached hourly forecast data.
class NotificationService {
  NotificationService(this._assets);

  final AssetCacheService _assets;
  static const _channelId = 'Rain';
  static const _channelName = 'DARK NIGHT';

  // --- Scheduling ---

  /// Schedules future notifications whose hour falls within the user's start/end hours.
  Future<void> scheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    final slots = buildWeatherNotificationSlots(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );

    for (final slot in slots) {
      await _show(
        UniqueKey().hashCode,
        slot.title,
        slot.body,
        slot.time,
        slot.icon,
      );
    }
  }

  /// When notifications are enabled, cancels pending ones and reschedules from the latest cache.
  Future<void> rescheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    if (!settings.notifications) return;
    await cancelAll();
    await scheduleForWeather(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );
  }

  /// Removes all pending and displayed notifications.
  Future<void> cancelAll() => flutterLocalNotificationsPlugin.cancelAll();

  // --- Platform ---

  /// Shows a single zoned notification with a cached weather icon.
  /// Slot planning is tested via [buildWeatherNotificationSlots]; failures here are logged, not swallowed.
  Future<void> _show(
    int id,
    String title,
    String body,
    DateTime date,
    String icon,
  ) async {
    try {
      final canScheduleExact =
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.canScheduleExactNotifications() ??
          true;
      final imagePath = await _assets.getLocalImagePath(icon);
      final details = NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          icon: 'ic_notification',
          priority: Priority.high,
          importance: Importance.max,
          playSound: false,
          enableVibration: false,
          largeIcon: FilePathAndroidBitmap(imagePath),
        ),
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tz.TZDateTime.from(date, tz.local),
        notificationDetails: details,
        androidScheduleMode: canScheduleExact
            ? AndroidScheduleMode.exactAllowWhileIdle
            : AndroidScheduleMode.inexactAllowWhileIdle,
        payload: imagePath,
      );
    } catch (e, stackTrace) {
      debugLogError('NotificationService._show', e, stackTrace);
      assert(false, 'NotificationService._show failed: $e');
    }
  }
}
