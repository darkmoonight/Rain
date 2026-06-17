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
    required this.scheduleEpochMillis,
  });

  final String title;
  final String body;

  /// Forecast hour in location wall-clock (naive, same as Open-Meteo `time` strings).
  final DateTime time;
  final String icon;

  /// UTC epoch used with [flutter_local_notifications] for this hour.
  final int scheduleEpochMillis;
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

/// Settings, cache, and city label loaded from Isar for notification work.
typedef NotificationIsarPayload = ({
  Settings settings,
  MainWeatherCache? cache,
  String cityLabel,
});

/// Shared [StatusWeather] / [StatusData] formatters for notification text.
({StatusWeather weather, StatusData data}) _notificationFormatters(
  Settings settings,
) => (
  weather: StatusWeather.forTheme(settings.weatherIconTheme),
  data: StatusData(settings: settings),
);

/// Builds one forecast notification slot from a cached hourly row.
WeatherNotificationSlot _buildNotificationSlot({
  required MainWeatherCache cache,
  required int hourIndex,
  required int dayIndex,
  required DateTime notificationTime,
  required int scheduleEpochMillis,
  required String cityLabel,
  required StatusWeather weather,
  required StatusData data,
}) {
  return WeatherNotificationSlot(
    title: '$cityLabel: ${data.getDegree(cache.temperature2M![hourIndex])}',
    body:
        '${weather.getText(cache.weathercode![hourIndex])} · ${data.getTimeFormat(cache.time![hourIndex])}',
    time: notificationTime,
    icon: weather.getImageNotification(
      cache.weathercode![hourIndex],
      cache.time![hourIndex],
      cache.sunrise![dayIndex],
      cache.sunset![dayIndex],
    ),
    scheduleEpochMillis: scheduleEpochMillis,
  );
}

/// Builds notification slots from cached hourly forecast data.
///
/// Only hours strictly after [alarmContext.nowMillis] are included so the active
/// hour is never re-scheduled (that caused duplicate alerts on every reschedule).
List<WeatherNotificationSlot> buildWeatherNotificationSlots({
  required MainWeatherCache cache,
  required Settings settings,
  required AppSettingsState appSettings,
  required String cityLabel,
  ForecastAlarmContext? alarmContext,
  DateTime? now,
}) {
  if (!WeatherCacheValidator.hasNotificationSlotData(cache)) return [];

  final alarm =
      alarmContext ?? forecastAlarmContext(cache, settings, wallNow: now);
  final formatters = _notificationFormatters(settings);
  final startHour = TimeIndexHelper.parseTime(appSettings.timeStart).hour;
  final endHour = TimeIndexHelper.parseTime(appSettings.timeEnd).hour;
  final slots = <WeatherNotificationSlot>[];

  for (var i = 0; i < cache.time!.length; i += appSettings.timeRange) {
    final notificationTime = TimeIndexHelper.parseForecastDateTime(
      cache.time![i],
    );
    final scheduleEpochMillis = forecastAlarmEpoch(notificationTime, cache);
    if (scheduleEpochMillis <= alarm.nowMillis) continue;
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
      _buildNotificationSlot(
        cache: cache,
        hourIndex: i,
        dayIndex: dayIndex,
        notificationTime: notificationTime,
        scheduleEpochMillis: scheduleEpochMillis,
        cityLabel: cityLabel,
        weather: formatters.weather,
        data: formatters.data,
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

  final alarm = forecastAlarmContext(cache, settings);
  final indices = TimeIndexHelper.currentIndices(
    hourly: cache.time!,
    daily: cache.timeDaily!,
    clock: alarm.clock,
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

  AndroidFlutterLocalNotificationsPlugin? get _android =>
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

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
    final alarm = forecastAlarmContext(cache, settings);
    final slots = buildWeatherNotificationSlots(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
      alarmContext: alarm,
    );
    if (slots.isEmpty) return;

    final iconRoot = WeatherIconTheme.assetRoot(settings.weatherIconTheme);
    final scheduleMode = await _androidScheduleMode();

    for (final slot in slots) {
      final scheduleMillis = resolveAlarmEpochMillis(
        nowMillis: alarm.nowMillis,
        slotEpochMillis: slot.scheduleEpochMillis,
      );
      if (scheduleMillis == null) continue;

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
  ///
  /// Serialized per isolate via [_rescheduleInFlight] so overlapping UI/background
  /// calls do not interleave cancel + schedule steps.
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

      final active = await _android?.getActiveNotifications() ?? [];
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
          await _android?.canScheduleExactNotifications() ?? true;
      return canScheduleExact
          ? AndroidScheduleMode.exactAllowWhileIdle
          : AndroidScheduleMode.inexactAllowWhileIdle;
    } catch (_) {
      return AndroidScheduleMode.inexactAllowWhileIdle;
    }
  }
}

/// Loads settings, cache, and city label for notification work in background isolates.
Future<NotificationIsarPayload> _notificationPayloadFromIsar(Isar isar) async {
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
