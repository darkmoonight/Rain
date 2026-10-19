import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/config/setting_enum_pickers.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/settings/settings_persistence.dart';
import 'package:rain/data/models/db.dart';
import 'package:restart_app/restart_app.dart';

/// Shared save and notification side-effect helpers for settings sections.
class SettingsSaveActions {
  SettingsSaveActions(this.ref, this._setState);

  final WidgetRef ref;
  final void Function(void Function()) _setState;

  Settings get settings => ref.read(settingsProvider);

  MainWeatherNotifier get weather =>
      ref.read(mainWeatherNotifierProvider.notifier);

  Future<void> Function()? forecastRescheduleAfterSave() =>
      settings.notifications ? weather.rescheduleNotificationsIfEnabled : null;

  /// Persists after [mutate] (or current in-memory fields when [mutate] is null).
  Future<void> saveSettings({
    void Function(Settings settings)? mutate,
    Future<void> Function()? afterSave,
    bool backgroundAfterSave = false,
  }) async {
    if (mutate != null) {
      await ref.persistSettings(mutate);
    } else {
      await ref.read(settingsRepositoryProvider).save(settings);
    }
    if (afterSave != null) {
      if (backgroundAfterSave) {
        unawaited(afterSave());
      } else {
        await afterSave();
      }
    }
    _setState(() {});
  }

  Future<void> saveWithForecastReschedule({
    void Function(Settings settings)? mutate,
  }) => saveSettings(
    mutate: mutate,
    afterSave: forecastRescheduleAfterSave(),
    backgroundAfterSave: true,
  );

  void runInBackground(Future<void> Function()? action) {
    if (action != null) unawaited(action());
  }

  /// Persists [settings.location] and optionally refreshes GPS weather.
  ///
  /// Returns false when enabling location but the OS location service is off.
  Future<bool> saveLocationToggle({
    required bool enabled,
    required Future<void> Function() refreshGps,
  }) async {
    if (enabled) {
      final serviceEnabled = await ref
          .read(locationServiceProvider)
          .isServiceEnabled();
      if (!serviceEnabled) return false;
    }
    await ref.persistSettings((s) => s.location = enabled);
    if (enabled) await refreshGps();
    _setState(() {});
    return true;
  }

  /// Persists notification toggle and schedules or cancels alarms in background.
  Future<void> saveNotificationsToggle({
    required bool enabled,
    required Future<bool> Function() requestPermissions,
  }) async {
    if (enabled && !await requestPermissions()) return;

    await ref.persistSettings((s) => s.notifications = enabled);
    _setState(() {});

    runInBackground(
      enabled
          ? weather.rescheduleNotificationsIfEnabled
          : ref.read(notificationServiceProvider).cancelForecastNotifications,
    );
  }

  /// Persists persistent notification toggle and updates the ongoing notification.
  Future<void> savePersistentNotificationToggle({
    required bool enabled,
    required Future<bool> Function() requestPermission,
  }) async {
    if (enabled && !await requestPermission()) return;

    await ref.persistSettings((s) => s.persistentNotification = enabled);
    if (enabled) {
      unawaited(weather.refreshPersistentNotification(force: true));
    } else {
      unawaited(
        ref.read(notificationServiceProvider).cancelPersistentNotification(),
      );
    }
    _setState(() {});
  }

  /// Persists hide-map and restarts the app after a short delay.
  Future<void> saveHideMapToggle(bool enabled) async {
    await ref.persistSettings((s) => s.hideMap = enabled);
    _setState(() {});
    if (Platform.isAndroid || Platform.isIOS) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => Restart.restartApp(),
      );
    }
  }

  /// Refreshes Android home-screen widgets when supported.
  Future<void> refreshWidgets() async {
    if (!Platform.isAndroid) return;
    await ref.read(widgetSettingsServiceProvider).refreshWidgets();
  }

  /// Refreshes widgets and rebuilds notification text from cached forecast.
  Future<void> syncWidgetsAndNotificationContent() async {
    await refreshWidgets();
    await weather.rebuildNotificationContentFromCache();
  }

  /// Resolves the post-save callback for a data-section enum picker.
  Future<void> Function()? afterSaveForEnumPicker(
    SettingEnumPickerDefinition def,
  ) {
    if (def.syncNotificationContent && def.refreshWidgets) {
      return syncWidgetsAndNotificationContent;
    }
    if (def.syncNotificationContent) {
      return weather.rebuildNotificationContentFromCache;
    }
    if (def.refreshWidgets) {
      return refreshWidgets;
    }
    return null;
  }

  /// Whether enum picker side-effects should run in the background.
  bool backgroundAfterSaveForEnumPicker(SettingEnumPickerDefinition def) =>
      def.syncNotificationContent;
}
