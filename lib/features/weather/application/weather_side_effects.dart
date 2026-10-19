import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/data/models/db.dart';

/// Android widget and notification side effects for the main weather session.
///
/// Keeps [MainWeatherNotifier] focused on cache/location/refresh orchestration.
class WeatherSideEffects {
  WeatherSideEffects(this._ref);

  final Ref _ref;

  /// Pushes home-widget payload from the open Isar instance.
  Future<void> updateHomeWidgets() async {
    if (!Platform.isAndroid || !_ref.mounted) return;
    try {
      await _ref
          .read(homeWidgetServiceProvider)
          .updateFromIsar(_ref.read(isarProvider));
    } catch (e, st) {
      debugLogError('WeatherSideEffects.updateHomeWidgets', e, st);
    }
  }

  /// Schedules or tops up forecast alarms from [cache].
  Future<void> syncForecastNotifications({
    MainWeatherCache? cache,
    String? cityLabel,
    required bool notificationsEnabled,
    bool reschedulePending = false,
  }) async {
    if (!notificationsEnabled || !_ref.mounted) return;

    final resolvedCache = cache;
    if (resolvedCache == null ||
        resolvedCache.time == null ||
        resolvedCache.time!.isEmpty) {
      return;
    }

    final settings = _ref.read(settingsProvider);
    final appSettings = _ref.read(appSettingsProvider);
    final service = _ref.read(notificationServiceProvider);
    final label = cityLabel ?? '';

    try {
      if (reschedulePending) {
        await service.rescheduleForWeather(
          cache: resolvedCache,
          settings: settings,
          appSettings: appSettings,
          cityLabel: label,
        );
      } else {
        await service.ensureForecastNotificationsScheduled(
          cache: resolvedCache,
          settings: settings,
          appSettings: appSettings,
          cityLabel: label,
        );
      }
    } catch (e, st) {
      debugLogError('WeatherSideEffects.syncForecastNotifications', e, st);
    }
  }

  /// Updates the ongoing notification when enabled.
  Future<void> updatePersistentNotification({
    required MainWeatherCache cache,
    required String cityLabel,
    required bool enabled,
  }) async {
    if (!Platform.isAndroid || !enabled || !_ref.mounted) return;
    try {
      await _ref
          .read(notificationServiceProvider)
          .updatePersistentNotification(
            cache: cache,
            settings: _ref.read(settingsProvider),
            cityLabel: cityLabel,
          );
    } catch (e, st) {
      debugLogError('WeatherSideEffects.updatePersistentNotification', e, st);
    }
  }
}
