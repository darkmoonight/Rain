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

  /// Last [AppSettings.notificationSound] used when slots were scheduled on this isolate.
  bool? _scheduledWithSound;

  /// Last slot count passed to [_scheduleSlots]; for tests only.
  @visibleForTesting
  int lastScheduledSlotCount = 0;

  /// Whether the last successful schedule used the sound channel; for tests only.
  @visibleForTesting
  bool? get scheduledWithSound => _scheduledWithSound;

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

  /// Forecast ids among [candidateIds] that should be cancelled.
  ///
  /// Never includes [persistentNotificationId]; keeps any id in [keepIds].
  @visibleForTesting
  static Set<int> forecastNotificationIdsToCancel({
    required Iterable<int> candidateIds,
    required Set<int> keepIds,
  }) {
    return {
      for (final id in candidateIds)
        if (id != persistentNotificationId && !keepIds.contains(id)) id,
    };
  }

  /// Active forecast ids to drop so at most the newest (max id) remains in the shade.
  ///
  /// Ids are derived from schedule epochs, so the maximum id is the latest hour.
  /// Never includes [persistentNotificationId].
  @visibleForTesting
  static Set<int> olderActiveForecastIdsToCancel(Iterable<int> activeIds) {
    final forecastIds = [
      for (final id in activeIds)
        if (id != persistentNotificationId) id,
    ]..sort();
    if (forecastIds.length <= 1) return {};
    return forecastIds.sublist(0, forecastIds.length - 1).toSet();
  }

  /// Whether [notification] is a delivered hourly forecast alert (not persistent).
  ///
  /// Matches forecast channels (including the pre-v2 sound id); if
  /// [ActiveNotification.channelId] is null (older Android), falls back to any
  /// id other than [persistentNotificationId].
  @visibleForTesting
  static bool isForecastActiveNotification(ActiveNotification notification) {
    final id = notification.id;
    if (id == null || id == persistentNotificationId) return false;
    final channel = notification.channelId;
    if (channel == null) return true;
    return channel == forecastChannelId ||
        channel == forecastSoundChannelId ||
        channel == legacyForecastSoundChannelId;
  }

  /// Ids of delivered forecast alerts from [active].
  @visibleForTesting
  static List<int> activeForecastIdsFrom(Iterable<ActiveNotification> active) {
    return [
      for (final notification in active)
        if (isForecastActiveNotification(notification)) notification.id!,
    ];
  }

  /// Active forecast ids to cancel: all of them, or all but the newest.
  @visibleForTesting
  static Set<int> activeForecastIdsToCancel({
    required Iterable<int> activeForecastIds,
    required bool clearAll,
  }) {
    if (clearAll) {
      return forecastNotificationIdsToCancel(
        candidateIds: activeForecastIds,
        keepIds: const {},
      );
    }
    return olderActiveForecastIdsToCancel(activeForecastIds);
  }

  static const forecastChannelId = 'RainForecastSilent';
  static const forecastChannelName = 'Rain Forecast';
  static const forecastChannelDescription =
      'Weather forecast alerts without sound';

  /// Pre-schema-v2 sound channel; deleted on migration (Android locks channel sound).
  static const legacyForecastSoundChannelId = 'RainForecastSound';

  static const forecastSoundChannelId = 'RainForecastSoundV2';
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

  /// Cancels pending and active forecast notifications whose ids are not in [keepIds].
  ///
  /// Does not await [_rescheduleInFlight] — safe to call from inside a reschedule.
  /// Never cancels [persistentNotificationId].
  Future<void> _cancelForecastNotificationsExcept(Set<int> keepIds) async {
    if (keepIds.isEmpty) {
      await cancelScheduled();
    } else {
      await _cancelPendingOutsidePlan(keepIds);
    }
    await _cancelActiveForecast(clearAll: keepIds.isEmpty, keepIds: keepIds);
  }

  Future<void> _cancelPendingOutsidePlan(Set<int> planIds) async {
    if (planIds.isEmpty) {
      await cancelScheduled();
      return;
    }
    final pending = await flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    final pendingToCancel = forecastNotificationIdsToCancel(
      candidateIds: _pendingForecastNotificationIds(pending),
      keepIds: planIds,
    );
    for (final id in pendingToCancel) {
      await flutterLocalNotificationsPlugin.cancel(id: id);
    }
  }

  Future<List<ActiveNotification>> _activeNotifications() async =>
      await _android?.getActiveNotifications() ?? [];

  Future<void> _cancelActiveNotifications(
    Iterable<ActiveNotification> notifications,
  ) async {
    for (final notification in notifications) {
      final id = notification.id;
      if (id == null || id == persistentNotificationId) continue;
      await flutterLocalNotificationsPlugin.cancel(
        id: id,
        tag: notification.tag,
      );
    }
  }

  /// Cancels delivered forecast alerts. When [clearAll] is false, keeps newest.
  Future<void> _cancelActiveForecast({
    required bool clearAll,
    Set<int> keepIds = const {},
  }) async {
    final active = await _activeNotifications();
    final forecastActive = [
      for (final notification in active)
        if (isForecastActiveNotification(notification)) notification,
    ];
    if (forecastActive.isEmpty) return;

    if (clearAll) {
      await _cancelActiveNotifications(forecastActive);
      return;
    }

    if (keepIds.isNotEmpty) {
      await _cancelActiveNotifications([
        for (final notification in forecastActive)
          if (!keepIds.contains(notification.id)) notification,
      ]);
      return;
    }

    final toCancel = olderActiveForecastIdsToCancel(
      activeForecastIdsFrom(forecastActive),
    );
    if (toCancel.isEmpty) return;
    await _cancelActiveNotifications([
      for (final notification in forecastActive)
        if (toCancel.contains(notification.id)) notification,
    ]);
  }

  /// Top-up missing forecast alarms; prune pending outside the plan and reconcile
  /// delivered forecast alerts in the shade.
  ///
  /// When [AppSettings.persistentNotification] is on, all delivered forecast
  /// alerts are cleared so the shade shows only the ongoing persistent card.
  /// Otherwise at most the newest delivered forecast remains.
  ///
  /// If pending alarms exist but were scheduled with a different sound setting,
  /// performs a full [rescheduleForWeather] so channel ids match (silent↔sound).
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

    final plan = buildForecastNotificationPlan(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );
    final hasValidCache = WeatherCacheValidator.hasNotificationSlotData(cache);
    // Stale/empty cache: keep existing pending alarms until fresh data arrives.
    if (plan.slots.isEmpty && !hasValidCache) return;

    // Silent↔sound must rebuild pending on the matching channel (top-up keeps ids).
    if (plan.slots.isNotEmpty &&
        _scheduledWithSound != null &&
        _scheduledWithSound != settings.notificationSound) {
      final existingPending = await flutterLocalNotificationsPlugin
          .pendingNotificationRequests();
      if (_pendingForecastNotificationIds(existingPending).isNotEmpty) {
        await rescheduleForWeather(
          cache: cache,
          settings: settings,
          appSettings: appSettings,
          cityLabel: cityLabel,
        );
        return;
      }
    }

    final planIds = {for (final slot in plan.slots) notificationIdFor(slot)};
    await _cancelPendingOutsidePlan(planIds);

    final clearAllActive =
        settings.persistentNotification || plan.slots.isEmpty;
    await _cancelActiveForecast(clearAll: clearAllActive);
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
    if (scheduledCount > 0) {
      _scheduledWithSound = settings.notificationSound;
    }
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

  /// When notifications are enabled, cancels pending/active ones and reschedules.
  ///
  /// If [plan.slots] is empty but the cache is valid, pending and shade alarms
  /// are still cancelled (settings now filter every slot). When the cache lacks
  /// hourly data, existing alarms are kept until fresh forecast data arrives.
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
        // Empty keep set: drop pending and shade forecast alerts (not persistent).
        await _cancelForecastNotificationsExcept(const {});
        _scheduledWithSound = null;
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
      // Clear pending + shade before scheduling the new plan.
      await _cancelForecastNotificationsExcept(const {});
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
      // Ongoing card replaces current weather; drop delivered hourly twins.
      await _cancelActiveForecast(clearAll: true);
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
  /// Waits for an in-flight [rescheduleForWeather] so a settings toggle-off does
  /// not race with a concurrent cancel+schedule.
  Future<void> cancelForecastNotifications() async {
    await _awaitRescheduleIdle();
    try {
      await _cancelForecastNotificationsExcept(const {});
      _scheduledWithSound = null;
    } catch (e, stackTrace) {
      debugLogError(
        'NotificationService.cancelForecastNotifications',
        e,
        stackTrace,
      );
    }
  }

  Future<void> cancelAll() => flutterLocalNotificationsPlugin.cancelAll();

  /// Android details for a forecast alert; sound uses [forecastSoundChannelId].
  @visibleForTesting
  static AndroidNotificationDetails forecastAndroidDetails(
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
        audioAttributesUsage: AudioAttributesUsage.notificationRingtone,
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
          android: forecastAndroidDetails(imagePath, playSound: playSound),
          iOS: DarwinNotificationDetails(
            presentSound: playSound,
            sound: playSound ? 'default' : null,
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
