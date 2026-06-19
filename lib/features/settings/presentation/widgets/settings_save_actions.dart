import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/data/models/db.dart';

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

  Future<void> saveSettings({
    Future<void> Function()? afterSave,
    bool backgroundAfterSave = false,
  }) async {
    await ref.read(settingsRepositoryProvider).save(settings);
    if (afterSave != null) {
      if (backgroundAfterSave) {
        unawaited(afterSave());
      } else {
        await afterSave();
      }
    }
    _setState(() {});
  }

  Future<void> saveWithForecastReschedule() => saveSettings(
    afterSave: forecastRescheduleAfterSave(),
    backgroundAfterSave: true,
  );

  void runInBackground(Future<void> Function()? action) {
    if (action != null) unawaited(action());
  }
}
