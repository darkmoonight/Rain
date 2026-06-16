import 'dart:io';

import 'package:rain/core/bootstrap/background_bootstrap.dart';
import 'package:rain/core/settings/clock_skew_persistence.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/database/isar_schemas.dart';
import 'package:rain/core/services/background_refresh_log.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/repositories/weather_repository.dart';
import 'package:workmanager/workmanager.dart';

const _widgetUpdateTaskName = 'widgetUpdate';

/// Registers the Android periodic task that refreshes home screen widgets.
Future<void> registerWidgetBackgroundTask() async {
  if (!Platform.isAndroid) return;
  await Workmanager().registerPeriodicTask(
    _widgetUpdateTaskName,
    'widgetBackgroundUpdate',
    frequency: AppConstants.workManagerMinInterval,
    initialDelay: const Duration(minutes: 1),
    existingWorkPolicy: ExistingPeriodicWorkPolicy.update,
  );
}

/// Ensures the periodic widget task is scheduled after app updates or OEM clears.
Future<void> ensureWidgetBackgroundTaskScheduled() async {
  if (!Platform.isAndroid) return;
  final scheduled = await Workmanager().isScheduledByUniqueName(
    _widgetUpdateTaskName,
  );
  if (!scheduled) {
    await registerWidgetBackgroundTask();
  }
}

/// Schedules a one-off widget refresh on the next app launch.
void registerWidgetBootUpdateTask() {
  if (!Platform.isAndroid) return;
  Workmanager().registerOneOffTask(
    'widgetBootUpdate',
    'widgetBackgroundUpdate',
    existingWorkPolicy: ExistingWorkPolicy.replace,
  );
}

/// Returns true when the device appears to have internet access.
Future<bool> hasBackgroundInternetAccess() async {
  try {
    return await InternetConnection().hasInternetAccess;
  } catch (e, st) {
    logBackgroundError('hasBackgroundInternetAccess', e, st);
    return false;
  }
}

/// Refreshes the main forecast when the cache is older than the widget interval.
///
/// Exported for unit tests; used by [runWidgetBackgroundRefresh].
Future<void> refreshMainWeatherIfStale(Isar isar) async {
  final local = WeatherLocalDatasource(isar);
  final location = await local.getLocation();
  if (location?.lat == null || location?.lon == null) return;

  final staleAfter = DateTime.now().subtract(
    AppConstants.workManagerMinInterval,
  );
  if (!await local.isMainWeatherExpired(staleAfter)) return;
  if (!await hasBackgroundInternetAccess()) return;

  final repo = WeatherRepository(WeatherRemoteDatasource(), local);
  final weather = await repo.fetchWeather(location!.lat!, location.lon!);
  await repo.writeCache(weather, location);
  if (weather.clockSkewSeconds != null) {
    await persistClockSkewInIsar(isar, weather.clockSkewSeconds!);
  }
}

Future<void> _applyBackgroundLocale(Isar isar) async {
  try {
    final settings = await isar.settings.where().findFirst();
    if (settings?.language != null) {
      await LocaleSettings.setLocale(
        appLocaleFromLanguageCode(settings!.language),
      );
    }
  } catch (e, st) {
    logBackgroundError('applyBackgroundLocale', e, st);
  }
}

/// Fetches stale main weather when online, then pushes widget data from disk.
Future<bool> runWidgetBackgroundRefresh(
  Future<bool> Function(Isar isar) updateWidgets, {
  Future<void> Function(Isar isar)? refreshStaleWeather,
}) async {
  Isar? isar;
  var ownsIsar = false;
  var widgetUpdated = false;
  var notificationUpdated = false;
  String? failureError;

  try {
    await prepareBackgroundIsolate();

    isar = Isar.getInstance();
    if (isar == null || !isar.isOpen) {
      isar = await openRainIsar();
      ownsIsar = true;
    }

    await _applyBackgroundLocale(isar);

    try {
      await (refreshStaleWeather ?? refreshMainWeatherIfStale)(isar);
    } catch (e, st) {
      logBackgroundError('refreshMainWeatherIfStale', e, st);
      failureError ??= e.toString();
    }

    try {
      widgetUpdated = await updateWidgets(isar);
    } catch (e, st) {
      logBackgroundError('updateWidgets', e, st);
      failureError ??= e.toString();
    }

    try {
      await updatePersistentNotificationFromIsar(isar);
      notificationUpdated = true;
    } catch (e, st) {
      logBackgroundError('updatePersistentNotificationFromIsar', e, st);
      failureError ??= e.toString();
    }

    try {
      await rescheduleNotificationsFromIsar(isar);
      notificationUpdated = true;
    } catch (e, st) {
      logBackgroundError('rescheduleNotificationsFromIsar', e, st);
      failureError ??= e.toString();
    }

    final success = widgetUpdated || notificationUpdated;
    await recordBackgroundRefreshResult(
      success: success,
      error: success ? null : failureError,
    );
    return success;
  } catch (e, st) {
    logBackgroundError('runWidgetBackgroundRefresh', e, st);
    await recordBackgroundRefreshResult(success: false, error: e.toString());
    return false;
  } finally {
    if (ownsIsar) {
      await isar?.close();
    }
  }
}
