import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/services/notification_content_builder.dart';
import 'package:rain/core/services/notification_reschedule_guard.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:rain/domain/entities/entities.dart';

export 'package:rain/core/services/notification_content_builder.dart';

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

  static Set<int> _pendingForecastNotificationIds(
    List<PendingNotificationRequest> pending,
  ) {
    return {
      for (final notification in pending)
        if (notification.id != persistentNotificationId) notification.id,
    };
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

  /// Top-up missing forecast alarms without cancelling the full pending set.
  ///
  /// Skipped briefly after [rescheduleForWeather] ([notification_reschedule_guard])
  /// and waits for an in-flight reschedule on this isolate.
  Future<void> ensureForecastNotificationsScheduled({
    required WeatherForecast cache,
    required AppSettings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    if (!settings.notifications) return;

    await _awaitRescheduleIdle();
    if (await shouldSkipForecastReplenish()) return;

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
    final pendingIds = _pendingForecastNotificationIds(pending);

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
    required WeatherForecast cache,
    required AppSettings settings,
  }) async {
    final slots = plan.slots;
    if (slots.isEmpty) {
      lastScheduledSlotCount = 0;
      return;
    }

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
      lastScheduledSlotCount = 0;
      return;
    }

    var scheduledCount = 0;
    for (var i = 0; i < slots.length; i++) {
      final slot = slots[i];
      // Notifications may be disabled while async asset loading runs.
      if (!settings.notifications) break;
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
      scheduledCount++;
      // Yield so long replans do not block input on the main isolate.
      if (i.isOdd) {
        await Future<void>.delayed(Duration.zero);
      }
    }
    lastScheduledSlotCount = scheduledCount;
  }

  /// Cancels pending forecast alarms whose hour start is past the grace window.
  ///
  /// Prevents Doze-delayed alarms from firing hours late (e.g. a 23:00 alert at 01:00).
  Future<void> cancelExpiredPendingForecastNotifications({
    required WeatherForecast cache,
    required AppSettings settings,
    int? referenceNowMillis,
  }) async {
    if (!settings.notifications) return;

    final pending = await flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    if (pending.isEmpty) return;

    final pendingIds = _pendingForecastNotificationIds(pending);
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

  /// When notifications are enabled, cancels pending ones and reschedules from cache.
  ///
  /// If [plan.slots] is empty but the cache is valid, pending alarms are still
  /// cancelled (settings now filter every slot). When the cache lacks hourly
  /// data, existing alarms are kept until fresh forecast data arrives.
  Future<void> rescheduleForWeather({
    required WeatherForecast cache,
    required AppSettings settings,
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

    final hasValidCache = WeatherCacheValidator.hasNotificationSlotData(cache);
    if (plan.slots.isEmpty) {
      // Stale/empty cache: keep existing pending alarms until fresh data arrives.
      if (!hasValidCache) return;

      await _awaitRescheduleIdle();
      final done = Completer<void>();
      _rescheduleInFlight = done.future;
      try {
        await cancelScheduled();
      } finally {
        await markForecastRescheduleCompleted();
        done.complete();
        _rescheduleInFlight = null;
      }
      return;
    }

    await _awaitRescheduleIdle();
    final done = Completer<void>();
    _rescheduleInFlight = done.future;
    try {
      await cancelScheduled();
      if (!settings.notifications) return;
      await _scheduleSlots(plan: plan, cache: cache, settings: settings);
    } finally {
      await markForecastRescheduleCompleted();
      done.complete();
      _rescheduleInFlight = null;
    }
  }

  Future<void> updatePersistentNotification({
    required WeatherForecast cache,
    required AppSettings settings,
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

