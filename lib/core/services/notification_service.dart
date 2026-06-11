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
import 'package:isar_community/isar.dart';
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

/// Content for the ongoing current-weather notification.
class PersistentNotificationContent {
  const PersistentNotificationContent({
    required this.title,
    required this.body,
    required this.icon,
  });

  final String title;
  final String body;
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

  if (cache.time == null ||
      cache.timeDaily == null ||
      cache.temperature2M == null ||
      cache.weathercode == null ||
      cache.sunrise == null ||
      cache.sunset == null) {
    return slots;
  }

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
      break;
    }
  }

  return slots;
}

/// Builds title/body/icon for the ongoing current-weather notification.
PersistentNotificationContent? buildPersistentNotificationContent({
  required MainWeatherCache cache,
  required Settings settings,
  required String cityLabel,
}) {
  if (cache.time == null ||
      cache.timeDaily == null ||
      cache.temperature2M == null ||
      cache.weathercode == null ||
      cache.sunrise == null ||
      cache.sunset == null ||
      cache.timezone == null) {
    return null;
  }

  final clock = LocationClock.fromMainWeather(
    cache,
    settingsClockSkewSeconds: settings.clockSkewSeconds,
  );
  final hour = TimeIndexHelper.getTime(cache.time!, clock);
  final day = TimeIndexHelper.getDay(
    cache.timeDaily!,
    clock,
  ).clamp(0, cache.timeDaily!.length - 1);
  final hourIndex = hour.clamp(0, cache.time!.length - 1);
  final statusWeather = StatusWeather();
  final statusData = StatusData(settings: settings);

  return PersistentNotificationContent(
    title:
        '$cityLabel: ${statusData.getDegree(cache.temperature2M![hourIndex])}',
    body: statusWeather.getText(cache.weathercode![hourIndex]),
    icon: statusWeather.getImageNotification(
      cache.weathercode![hourIndex],
      cache.time![hourIndex],
      cache.sunrise![day],
      cache.sunset![day],
    ),
  );
}

/// Schedules local weather notifications from cached hourly forecast data.
class NotificationService {
  NotificationService(this._assets);

  final AssetCacheService _assets;
  static const _channelId = 'Rain';
  static const _channelName = 'DARK NIGHT';
  static const _persistentChannelId = 'RainPersistent';
  static const _persistentChannelName = 'Rain Current';

  /// Android [Notification.FLAG_NO_CLEAR] — not removed by "Clear all".
  static final Int32List _persistentNotificationFlags = Int32List.fromList([
    32,
  ]);

  /// Fixed id for the ongoing current-weather notification.
  static const persistentNotificationId = 1;

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
      await _showScheduled(
        notificationIdFor(slot),
        slot.title,
        slot.body,
        slot.time,
        slot.icon,
      );
    }
  }

  /// Stable positive notification id for [slot].
  @visibleForTesting
  static int notificationIdFor(WeatherNotificationSlot slot) {
    return Object.hash(
          slot.title,
          slot.body,
          slot.time.millisecondsSinceEpoch,
        ) &
        0x7fffffff;
  }

  /// When notifications are enabled, cancels pending ones and reschedules from the latest cache.
  Future<void> rescheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    if (!settings.notifications) return;
    await cancelScheduled();
    await scheduleForWeather(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );
  }

  /// Shows or updates the ongoing current-weather notification when enabled.
  Future<void> updatePersistentNotification({
    required MainWeatherCache cache,
    required Settings settings,
    required String cityLabel,
  }) async {
    if (!settings.persistentNotification) return;

    final content = buildPersistentNotificationContent(
      cache: cache,
      settings: settings,
      cityLabel: cityLabel,
    );
    if (content == null) return;

    try {
      final imagePath = await _assets.getLocalImagePath(content.icon);
      await flutterLocalNotificationsPlugin.show(
        id: persistentNotificationId,
        title: content.title,
        body: content.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _persistentChannelId,
            _persistentChannelName,
            channelDescription: 'Current weather in the status bar',
            icon: 'ic_notification',
            priority: Priority.low,
            importance: Importance.low,
            category: AndroidNotificationCategory.service,
            ongoing: true,
            autoCancel: false,
            onlyAlertOnce: true,
            playSound: false,
            enableVibration: false,
            additionalFlags: _persistentNotificationFlags,
            largeIcon: FilePathAndroidBitmap(imagePath),
          ),
        ),
        payload: imagePath,
      );
    } catch (e, stackTrace) {
      debugLogError(
        'NotificationService.updatePersistentNotification',
        e,
        stackTrace,
      );
    }
  }

  /// Removes the ongoing current-weather notification.
  Future<void> cancelPersistentNotification() =>
      flutterLocalNotificationsPlugin.cancel(id: persistentNotificationId);

  /// Cancels scheduled forecast notifications, keeping the persistent one.
  Future<void> cancelScheduled() async {
    final pending = await flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    for (final notification in pending) {
      if (notification.id == persistentNotificationId) continue;
      await flutterLocalNotificationsPlugin.cancel(id: notification.id);
    }
  }

  /// Removes all pending and displayed notifications.
  Future<void> cancelAll() => flutterLocalNotificationsPlugin.cancelAll();

  // --- Platform ---

  /// Shows a single zoned notification with a cached weather icon.
  /// Slot planning is tested via [buildWeatherNotificationSlots]; failures here are logged, not swallowed.
  Future<void> _showScheduled(
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
      debugLogError('NotificationService._showScheduled', e, stackTrace);
    }
  }
}

/// Updates the persistent notification from an Isar instance (background isolate safe).
Future<void> updatePersistentNotificationFromIsar(Isar isar) async {
  final settings = await isar.settings.where().findFirst() ?? Settings();
  if (!settings.persistentNotification) return;

  final cache = await isar.mainWeatherCaches.where().findFirst();
  if (cache == null) return;

  final location = await isar.locationCaches.where().findFirst();
  final cityLabel = location?.city ?? location?.district ?? '';

  await NotificationService(AssetCacheService()).updatePersistentNotification(
    cache: cache,
    settings: settings,
    cityLabel: cityLabel,
  );
}
