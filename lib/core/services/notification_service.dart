import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/core/bootstrap/app_initializer.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart' as tz;

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
    final now = DateTime.now();
    final startHour = TimeIndexHelper.parseTime(appSettings.timeStart).hour;
    final endHour = TimeIndexHelper.parseTime(appSettings.timeEnd).hour;
    final statusWeather = StatusWeather();
    final statusData = StatusData(settings: settings);

    for (var i = 0; i < cache.time!.length; i += appSettings.timeRange) {
      final notificationTime = DateTime.parse(cache.time![i]);
      if (notificationTime.isAfter(now) &&
          notificationTime.hour >= startHour &&
          notificationTime.hour <= endHour) {
        for (var j = 0; j < cache.timeDaily!.length; j++) {
          if (cache.timeDaily![j].day == notificationTime.day) {
            await _show(
              UniqueKey().hashCode,
              '$cityLabel: ${statusData.getDegree(cache.temperature2M![i])}',
              '${statusWeather.getText(cache.weathercode![i])} · ${statusData.getTimeFormat(cache.time![i])}',
              notificationTime,
              statusWeather.getImageNotification(
                cache.weathercode![i],
                cache.time![i],
                cache.sunrise![j],
                cache.sunset![j],
              ),
            );
          }
        }
      }
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
    } catch (e) {
      if (kDebugMode) print('Error showing notification: $e');
    }
  }
}
