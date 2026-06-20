import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/services/notification_weekdays.dart';
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

/// One scheduled forecast notification derived from cached hourly data.
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

/// Text and icon for the ongoing persistent weather notification.
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

typedef NotificationIsarPayload = ({
  Settings settings,
  MainWeatherCache? cache,
  String cityLabel,
});

typedef ForecastNotificationPlan = ({
  ForecastAlarmContext alarm,
  List<WeatherNotificationSlot> slots,
});

/// Shared [StatusWeather] / [StatusData] formatters for notification text.
({StatusWeather weather, StatusData data}) _notificationFormatters(
  Settings settings,
) => (
  weather: StatusWeather.forTheme(settings.weatherIconTheme),
  data: StatusData(settings: settings),
);

String _weatherNotificationTitle(
  String cityLabel,
  StatusData data,
  double? temperature,
) => '$cityLabel: ${data.getDegree(temperature)}';

String _weatherNotificationIcon({
  required StatusWeather weather,
  required MainWeatherCache cache,
  required int hourIndex,
  required int dayIndex,
}) => weather.getImageNotification(
  cache.weathercode![hourIndex],
  cache.time![hourIndex],
  cache.sunrise![dayIndex],
  cache.sunset![dayIndex],
);

WeatherNotificationSlot _buildNotificationSlot({
  required MainWeatherCache cache,
  required int hourIndex,
  required int dayIndex,
  required DateTime notificationTime,
  required DateTime wallNow,
  required int scheduleEpochMillis,
  required String cityLabel,
  required StatusWeather weather,
  required StatusData data,
}) {
  return WeatherNotificationSlot(
    title: _weatherNotificationTitle(
      cityLabel,
      data,
      cache.temperature2M![hourIndex],
    ),
    body:
        '${weather.getText(cache.weathercode![hourIndex])} · ${data.formatForecastSlotLabel(notificationTime, wallNow)}',
    time: notificationTime,
    icon: _weatherNotificationIcon(
      weather: weather,
      cache: cache,
      hourIndex: hourIndex,
      dayIndex: dayIndex,
    ),
    scheduleEpochMillis: scheduleEpochMillis,
  );
}

/// Builds notification slots from cached hourly forecast data.
///
/// Only forecast hours whose start is still in the future are included — enabling
/// notifications mid-hour does not fire a catch-up alert for that hour.
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
  final seenScheduleEpochs = <int>{};

  for (var i = 0; i < cache.time!.length; i += appSettings.timeRange) {
    final notificationTime = TimeIndexHelper.parseForecastDateTime(
      cache.time![i],
    );
    final scheduleEpochMillis = forecastAlarmEpoch(notificationTime, cache);
    // Same rule as [isForecastNotificationInFuture] — hour start must be ahead of location now.
    if (scheduleEpochMillis <= alarm.nowMillis) continue;
    if (!isHourInNotificationWindow(
      notificationTime.hour,
      startHour,
      endHour,
    )) {
      continue;
    }

    if (!isNotificationWeekdayEnabled(
      notificationTime.weekday,
      settings.notificationWeekdaysMask,
    )) {
      continue;
    }

    final dayIndex = TimeIndexHelper.indexOfCalendarDay(
      cache.timeDaily!,
      TimeIndexHelper.parseForecastDate(cache.time![i]),
    );
    if (dayIndex < 0) continue;
    if (!seenScheduleEpochs.add(scheduleEpochMillis)) continue;

    slots.add(
      _buildNotificationSlot(
        cache: cache,
        hourIndex: i,
        dayIndex: dayIndex,
        notificationTime: notificationTime,
        wallNow: alarm.wallNow,
        scheduleEpochMillis: scheduleEpochMillis,
        cityLabel: cityLabel,
        weather: formatters.weather,
        data: formatters.data,
      ),
    );
  }

  return slots;
}

/// Builds the alarm context and notification slots for the current cache.
ForecastNotificationPlan buildForecastNotificationPlan({
  required MainWeatherCache cache,
  required Settings settings,
  required AppSettingsState appSettings,
  required String cityLabel,
}) {
  final alarm = forecastAlarmContext(cache, settings);
  final slots = buildWeatherNotificationSlots(
    cache: cache,
    settings: settings,
    appSettings: appSettings,
    cityLabel: cityLabel,
    alarmContext: alarm,
  );
  return (alarm: alarm, slots: slots);
}

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
    title: _weatherNotificationTitle(
      cityLabel,
      formatters.data,
      cache.temperature2M![hourIndex],
    ),
    body: formatters.weather.getText(cache.weathercode![hourIndex]),
    icon: _weatherNotificationIcon(
      weather: formatters.weather,
      cache: cache,
      hourIndex: hourIndex,
      dayIndex: day,
    ),
  );
}

/// Schedules, reschedules, and cancels local weather notifications.
class NotificationService {
  NotificationService(this._assets);

  final AssetCacheService _assets;
  static Future<void>? _rescheduleInFlight;

  /// Last slot count passed to [_scheduleSlots]; for tests only.
  @visibleForTesting
  int lastScheduledSlotCount = 0;

  static Future<void> _awaitRescheduleIdle() async {
    while (_rescheduleInFlight != null) {
      await _rescheduleInFlight;
    }
  }

  static const forecastChannelId = 'RainForecastSilent';
  static const forecastChannelName = 'Rain Forecast';
  static const forecastChannelDescription =
      'Weather forecast alerts without sound';
  static const forecastSoundChannelId = 'RainForecastSound';
  static const forecastSoundChannelName = 'Rain Forecast (sound)';
  static const forecastSoundChannelDescription =
      'Weather forecast alerts with sound';
  static const persistentChannelId = 'RainPersistent';
  static const persistentChannelName = 'Rain Current';
  static const persistentChannelDescription =
      'Current weather in the status bar';

  /// Android [Notification.FLAG_NO_CLEAR] — not removed by "Clear all".
  static final Int32List _persistentNotificationFlags = Int32List.fromList([
    32,
  ]);

  static const persistentNotificationId = 1;

  AndroidFlutterLocalNotificationsPlugin? get _android =>
      androidNotificationsPlugin;

  Future<void> scheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    await _scheduleSlots(
      plan: buildForecastNotificationPlan(
        cache: cache,
        settings: settings,
        appSettings: appSettings,
        cityLabel: cityLabel,
      ),
      cache: cache,
      settings: settings,
    );
  }

  Future<void> ensureForecastNotificationsScheduled({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    if (!settings.notifications) return;

    await cancelExpiredPendingForecastNotifications(
      cache: cache,
      settings: settings,
    );

    final plan = buildForecastNotificationPlan(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );
    if (plan.slots.isEmpty) return;

    final pending = await flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    final pendingIds = {
      for (final notification in pending)
        if (notification.id != persistentNotificationId) notification.id,
    };

    final missingSlots = plan.slots
        .where((slot) => !pendingIds.contains(notificationIdFor(slot)))
        .toList();
    if (missingSlots.isEmpty) return;

    await _scheduleSlots(
      plan: (alarm: plan.alarm, slots: missingSlots),
      cache: cache,
      settings: settings,
    );
  }

  Future<void> _scheduleSlots({
    required ForecastNotificationPlan plan,
    required MainWeatherCache cache,
    required Settings settings,
  }) async {
    final slots = plan.slots;
    lastScheduledSlotCount = slots.length;
    if (slots.isEmpty) return;

    final iconRoot = WeatherIconTheme.assetRoot(settings.weatherIconTheme);
    final scheduleMode = await _androidScheduleMode();
    final deviceNowMillis = deviceUtcNowMillis();
    final tzLocation = notificationTzLocation(cache.timezone);
    final alarm = plan.alarm;

    final iconPaths = <String, String>{};
    try {
      for (final icon in {for (final slot in slots) slot.icon}) {
        iconPaths[icon] = await _assets.getLocalImagePath(
          icon,
          assetRoot: iconRoot,
        );
      }
    } catch (e, stackTrace) {
      debugLogError('NotificationService._scheduleSlots', e, stackTrace);
      return;
    }

    for (var i = 0; i < slots.length; i++) {
      final slot = slots[i];
      // Notifications may be disabled while async asset loading runs.
      if (!settings.notifications) return;
      final scheduleMillis = resolveAlarmEpochMillis(
        nowMillis: alarm.nowMillis,
        deviceNowMillis: deviceNowMillis,
        slotEpochMillis: slot.scheduleEpochMillis,
      );
      if (scheduleMillis == null) continue;

      await _showScheduled(
        notificationIdFor(slot),
        slot.title,
        slot.body,
        imagePath: iconPaths[slot.icon]!,
        scheduleEpochMillis: scheduleMillis,
        scheduleMode: scheduleMode,
        tzLocation: tzLocation,
        deviceNowMillis: deviceNowMillis,
        playSound: settings.notificationSound,
      );
      // Yield so long replans do not block input on the main isolate.
      if (i.isOdd) {
        await Future<void>.delayed(Duration.zero);
      }
    }
  }

  /// Cancels pending forecast alarms whose hour start is past the grace window.
  ///
  /// Prevents Doze-delayed alarms from firing hours late (e.g. a 23:00 alert at 01:00).
  Future<void> cancelExpiredPendingForecastNotifications({
    required MainWeatherCache cache,
    required Settings settings,
    int? referenceNowMillis,
  }) async {
    if (!settings.notifications) return;

    final pending = await flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    if (pending.isEmpty) return;

    final pendingIds = {
      for (final notification in pending)
        if (notification.id != persistentNotificationId) notification.id,
    };
    if (pendingIds.isEmpty) return;

    final expiredIds = expiredForecastNotificationIds(
      cache: cache,
      settings: settings,
      notificationIdForEpoch: notificationIdForEpoch,
      referenceNowMillis: referenceNowMillis,
    ).where(pendingIds.contains).toSet();

    for (final id in expiredIds) {
      await flutterLocalNotificationsPlugin.cancel(id: id);
    }
  }

  /// Stable positive notification id for a forecast hour epoch.
  @visibleForTesting
  static int notificationIdForEpoch(int scheduleEpochMillis) {
    var id = scheduleEpochMillis & 0x7fffffff;
    if (id <= persistentNotificationId) id += persistentNotificationId + 1;
    return id;
  }

  /// Stable positive notification id for [slot] (UTC epoch of the forecast hour).
  ///
  /// Uses [scheduleEpochMillis] so the same wall-clock hour on different calendar
  /// days keeps distinct ids. Stays above [persistentNotificationId].
  @visibleForTesting
  static int notificationIdFor(WeatherNotificationSlot slot) {
    return notificationIdForEpoch(slot.scheduleEpochMillis);
  }

  /// When notifications are enabled, cancels pending ones and reschedules from the latest cache.
  ///
  /// Only [cancelScheduled] runs before replanning — delivered alerts stay in the
  /// shade until the user dismisses them. [cancelForecastNotifications] also clears
  /// active notifications and is reserved for explicit off/disable flows.
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

    final plan = buildForecastNotificationPlan(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );
    // Never wipe pending alarms when nothing new can be scheduled (stale cache,
    // empty window, etc.) — that left users with zero notifications after resume.
    if (plan.slots.isEmpty) return;

    await _awaitRescheduleIdle();
    final done = Completer<void>();
    _rescheduleInFlight = done.future;
    try {
      await cancelScheduled();
      if (!settings.notifications) return;
      await _scheduleSlots(plan: plan, cache: cache, settings: settings);
    } finally {
      done.complete();
      _rescheduleInFlight = null;
    }
  }

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
            channelDescription: persistentChannelDescription,
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

  Future<void> cancelPersistentNotification() =>
      flutterLocalNotificationsPlugin.cancel(id: persistentNotificationId);

  Future<void> cancelScheduled() async {
    final pending = await flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    for (final notification in pending) {
      if (notification.id == persistentNotificationId) continue;
      await flutterLocalNotificationsPlugin.cancel(id: notification.id);
    }
  }

  /// Clears pending and visible hourly forecast notifications (not the persistent one).
  ///
  /// Does not run during [rescheduleForWeather] — background/widget refresh would
  /// otherwise remove alerts the user has not dismissed yet (more visible on Android 14+).
  Future<void> cancelForecastNotifications() async {
    await _awaitRescheduleIdle();
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

  Future<void> cancelAll() => flutterLocalNotificationsPlugin.cancelAll();

  AndroidNotificationDetails _forecastAndroidDetails(
    String imagePath, {
    required bool playSound,
  }) {
    if (playSound) {
      return AndroidNotificationDetails(
        forecastSoundChannelId,
        forecastSoundChannelName,
        channelDescription: forecastSoundChannelDescription,
        icon: 'ic_notification',
        priority: Priority.high,
        importance: Importance.max,
        playSound: true,
        enableVibration: true,
        largeIcon: FilePathAndroidBitmap(imagePath),
      );
    }

    return AndroidNotificationDetails(
      forecastChannelId,
      forecastChannelName,
      channelDescription: forecastChannelDescription,
      icon: 'ic_notification',
      priority: Priority.high,
      importance: Importance.high,
      playSound: false,
      enableVibration: false,
      silent: true,
      largeIcon: FilePathAndroidBitmap(imagePath),
    );
  }

  Future<void> _showScheduled(
    int id,
    String title,
    String body, {
    required String imagePath,
    required int scheduleEpochMillis,
    required AndroidScheduleMode scheduleMode,
    required tz.Location tzLocation,
    required int deviceNowMillis,
    required bool playSound,
  }) async {
    final aligned = alignScheduleEpochForPlugin(
      scheduleEpochMillis: scheduleEpochMillis,
      deviceNowMillis: deviceNowMillis,
    );
    if (aligned == null) return;

    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tz.TZDateTime.fromMillisecondsSinceEpoch(
          tzLocation,
          aligned,
        ),
        notificationDetails: NotificationDetails(
          android: _forecastAndroidDetails(imagePath, playSound: playSound),
          iOS: DarwinNotificationDetails(presentSound: playSound),
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
          await _android?.canScheduleExactNotifications() ?? false;
      if (canScheduleExact) {
        // Wakes the device on time; less affected by Doze than inexact alarms.
        return AndroidScheduleMode.alarmClock;
      }
      return AndroidScheduleMode.inexactAllowWhileIdle;
    } catch (_) {
      return AndroidScheduleMode.inexactAllowWhileIdle;
    }
  }
}

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

NotificationService _backgroundNotificationService() =>
    NotificationService(AssetCacheService());

Future<void> updatePersistentNotificationFromIsar(Isar isar) async {
  final payload = await _notificationPayloadFromIsar(isar);
  if (!payload.settings.persistentNotification || payload.cache == null) {
    return;
  }

  await _backgroundNotificationService().updatePersistentNotification(
    cache: payload.cache!,
    settings: payload.settings,
    cityLabel: payload.cityLabel,
  );
}

/// Top-up forecast alarms and drop stale pending ones while the app is backgrounded.
Future<void> replenishForecastNotificationsFromIsar(Isar isar) async {
  final payload = await _notificationPayloadFromIsar(isar);
  if (!payload.settings.notifications || payload.cache == null) return;

  final service = _backgroundNotificationService();
  final appSettings = AppSettingsState.fromSettings(payload.settings);

  await service.cancelExpiredPendingForecastNotifications(
    cache: payload.cache!,
    settings: payload.settings,
  );
  await service.ensureForecastNotificationsScheduled(
    cache: payload.cache!,
    settings: payload.settings,
    appSettings: appSettings,
    cityLabel: payload.cityLabel,
  );
}
