import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
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

/// Shared [StatusWeather] / [StatusData] formatters for notification text.
({StatusWeather weather, StatusData data}) _notificationFormatters(
  Settings settings,
) => (
  weather: StatusWeather.forTheme(settings.weatherIconTheme),
  data: StatusData(settings: settings),
);

/// Builds notification slots from cached hourly forecast data.
List<WeatherNotificationSlot> buildWeatherNotificationSlots({
  required MainWeatherCache cache,
  required Settings settings,
  required AppSettingsState appSettings,
  required String cityLabel,
  DateTime? now,
}) {
  if (!WeatherCacheValidator.hasNotificationSlotData(cache)) return [];

  final alarm = forecastAlarmContext(cache, settings, wallNow: now);
  final formatters = _notificationFormatters(settings);
  final startHour = TimeIndexHelper.parseTime(appSettings.timeStart).hour;
  final endHour = TimeIndexHelper.parseTime(appSettings.timeEnd).hour;
  final slots = <WeatherNotificationSlot>[];

  for (var i = 0; i < cache.time!.length; i += appSettings.timeRange) {
    final notificationTime = TimeIndexHelper.parseForecastDateTime(
      cache.time![i],
    );
    final scheduleMillis = forecastAlarmEpoch(notificationTime, cache);
    final isCurrentHour = isSameForecastClockHour(
      notificationTime,
      alarm.wallNow,
    );

    // Skip past hours; keep only the active hour (e.g. 16:xx → 16:00 slot).
    if (!isCurrentHour && scheduleMillis <= alarm.nowMillis) continue;
    if (!isHourInNotificationWindow(
      notificationTime.hour,
      startHour,
      endHour,
    )) {
      continue;
    }

    final dayIndex = TimeIndexHelper.indexOfCalendarDay(
      cache.timeDaily!,
      DateTime(
        notificationTime.year,
        notificationTime.month,
        notificationTime.day,
      ),
    );
    if (dayIndex < 0) continue;

    slots.add(
      WeatherNotificationSlot(
        title:
            '$cityLabel: ${formatters.data.getDegree(cache.temperature2M![i])}',
        body:
            '${formatters.weather.getText(cache.weathercode![i])} · ${formatters.data.getTimeFormat(cache.time![i])}',
        time: notificationTime,
        icon: formatters.weather.getImageNotification(
          cache.weathercode![i],
          cache.time![i],
          cache.sunrise![dayIndex],
          cache.sunset![dayIndex],
        ),
      ),
    );
  }

  return slots;
}

/// Builds title/body/icon for the ongoing current-weather notification.
PersistentNotificationContent? buildPersistentNotificationContent({
  required MainWeatherCache cache,
  required Settings settings,
  required String cityLabel,
}) {
  if (!WeatherCacheValidator.hasPersistentNotificationData(cache)) return null;

  final clock = LocationClock.fromMainWeather(
    cache,
    settingsClockSkewSeconds: settings.clockSkewSeconds,
  );
  final indices = TimeIndexHelper.currentIndices(
    hourly: cache.time!,
    daily: cache.timeDaily!,
    clock: clock,
  );
  final hourIndex = indices.hour.clamp(0, cache.time!.length - 1);
  final day = indices.day.clamp(0, cache.timeDaily!.length - 1);
  final formatters = _notificationFormatters(settings);

  return PersistentNotificationContent(
    title:
        '$cityLabel: ${formatters.data.getDegree(cache.temperature2M![hourIndex])}',
    body: formatters.weather.getText(cache.weathercode![hourIndex]),
    icon: formatters.weather.getImageNotification(
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
  static Future<void>? _rescheduleInFlight;

  static const forecastChannelId = 'Rain';
  static const forecastChannelName = 'DARK NIGHT';
  static const persistentChannelId = 'RainPersistent';
  static const persistentChannelName = 'Rain Current';

  /// Android [Notification.FLAG_NO_CLEAR] — not removed by "Clear all".
  static final Int32List _persistentNotificationFlags = Int32List.fromList([
    32,
  ]);

  /// Fixed id for the ongoing current-weather notification.
  static const persistentNotificationId = 1;

  // --- Scheduling ---

  /// Schedules future notifications whose hour falls within the user's start/end hours.
  ///
  /// Prefer [rescheduleForWeather] so stale alarms are cleared before replanning.
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
    if (slots.isEmpty) return;

    final alarm = forecastAlarmContext(cache, settings);
    final iconRoot = WeatherIconTheme.assetRoot(settings.weatherIconTheme);
    final scheduleMode = await _androidScheduleMode();
    final realNowMillis = DateTime.now().toUtc().millisecondsSinceEpoch;
    var scheduledCurrentHour = false;

    for (final slot in slots) {
      final slotEpochMillis = forecastAlarmEpoch(slot.time, cache);
      final scheduleMillis = resolveAlarmEpochMillis(
        slotTime: slot.time,
        wallNow: alarm.wallNow,
        nowMillis: alarm.nowMillis,
        realNowMillis: realNowMillis,
        slotEpochMillis: slotEpochMillis,
        currentHourAlreadyScheduled: scheduledCurrentHour,
      );
      if (scheduleMillis == null) continue;
      if (slotEpochMillis <= alarm.nowMillis &&
          isSameForecastClockHour(slot.time, alarm.wallNow)) {
        scheduledCurrentHour = true;
      }

      await _showScheduled(
        notificationIdFor(slot),
        slot.title,
        slot.body,
        slot.icon,
        assetRoot: iconRoot,
        scheduleEpochMillis: scheduleMillis,
        scheduleMode: scheduleMode,
      );
    }
  }

  /// Stable positive notification id for [slot] (time-based, avoids hash collisions).
  ///
  /// Stays above [persistentNotificationId] so the ongoing notification keeps its slot.
  @visibleForTesting
  static int notificationIdFor(WeatherNotificationSlot slot) {
    var id = slot.time.millisecondsSinceEpoch & 0x7fffffff;
    if (id <= persistentNotificationId) id += persistentNotificationId + 1;
    return id;
  }

  /// When notifications are enabled, cancels pending ones and reschedules from the latest cache.
  Future<void> rescheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    if (!settings.notifications) return;

    while (_rescheduleInFlight != null) {
      await _rescheduleInFlight;
    }
    final done = Completer<void>();
    _rescheduleInFlight = done.future;
    try {
      await cancelForecastNotifications();
      await scheduleForWeather(
        cache: cache,
        settings: settings,
        appSettings: appSettings,
        cityLabel: cityLabel,
      );
    } finally {
      done.complete();
      _rescheduleInFlight = null;
    }
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
      final imagePath = await _assets.getLocalImagePath(
        content.icon,
        assetRoot: WeatherIconTheme.assetRoot(settings.weatherIconTheme),
      );
      await flutterLocalNotificationsPlugin.show(
        id: persistentNotificationId,
        title: content.title,
        body: content.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            persistentChannelId,
            persistentChannelName,
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

  /// Clears pending and visible hourly forecast notifications (not the persistent one).
  Future<void> cancelForecastNotifications() async {
    try {
      await cancelScheduled();

      final android = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      final active = await android?.getActiveNotifications() ?? [];
      for (final notification in active) {
        final id = notification.id;
        if (id == null || id == persistentNotificationId) continue;
        await flutterLocalNotificationsPlugin.cancel(id: id);
      }
    } catch (e, stackTrace) {
      debugLogError(
        'NotificationService.cancelForecastNotifications',
        e,
        stackTrace,
      );
    }
  }

  /// Removes all pending and displayed notifications.
  Future<void> cancelAll() => flutterLocalNotificationsPlugin.cancelAll();

  // --- Platform ---

  /// Shows a single zoned notification with a cached weather icon.
  Future<void> _showScheduled(
    int id,
    String title,
    String body,
    String icon, {
    required String assetRoot,
    required int scheduleEpochMillis,
    required AndroidScheduleMode scheduleMode,
  }) async {
    if (!isAlarmEpochInFuture(scheduleEpochMillis)) return;

    try {
      final imagePath = await _assets.getLocalImagePath(
        icon,
        assetRoot: assetRoot,
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tz.TZDateTime.fromMillisecondsSinceEpoch(
          tz.local,
          scheduleEpochMillis,
        ),
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            forecastChannelId,
            forecastChannelName,
            icon: 'ic_notification',
            priority: Priority.high,
            importance: Importance.max,
            playSound: false,
            enableVibration: false,
            largeIcon: FilePathAndroidBitmap(imagePath),
          ),
        ),
        androidScheduleMode: scheduleMode,
        payload: imagePath,
      );
    } catch (e, stackTrace) {
      debugLogError('NotificationService._showScheduled', e, stackTrace);
    }
  }

  Future<AndroidScheduleMode> _androidScheduleMode() async {
    try {
      final canScheduleExact =
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.canScheduleExactNotifications() ??
          true;
      return canScheduleExact
          ? AndroidScheduleMode.exactAllowWhileIdle
          : AndroidScheduleMode.inexactAllowWhileIdle;
    } catch (_) {
      return AndroidScheduleMode.inexactAllowWhileIdle;
    }
  }
}

/// Loads settings, cache, and city label for notification work in background isolates.
Future<({Settings settings, MainWeatherCache? cache, String cityLabel})>
_notificationPayloadFromIsar(Isar isar) async {
  final settings = await isar.settings.where().findFirst() ?? Settings();
  final cache = await isar.mainWeatherCaches.where().findFirst();
  final location = await isar.locationCaches.where().findFirst();
  return (
    settings: settings,
    cache: cache,
    cityLabel: location?.displayLabel ?? '',
  );
}

/// Reschedules forecast notifications from Isar (background isolate safe).
Future<void> rescheduleNotificationsFromIsar(Isar isar) async {
  final payload = await _notificationPayloadFromIsar(isar);
  if (!payload.settings.notifications || payload.cache == null) return;

  await NotificationService(AssetCacheService()).rescheduleForWeather(
    cache: payload.cache!,
    settings: payload.settings,
    appSettings: AppSettingsState.fromSettings(payload.settings),
    cityLabel: payload.cityLabel,
  );
}

/// Updates the persistent notification from an Isar instance (background isolate safe).
Future<void> updatePersistentNotificationFromIsar(Isar isar) async {
  final payload = await _notificationPayloadFromIsar(isar);
  if (!payload.settings.persistentNotification || payload.cache == null) return;

  await NotificationService(AssetCacheService()).updatePersistentNotification(
    cache: payload.cache!,
    settings: payload.settings,
    cityLabel: payload.cityLabel,
  );
}
