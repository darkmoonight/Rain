import 'dart:io';

import 'package:rain/core/bootstrap/timezone_bootstrap.dart';
import 'package:rain/core/settings/clock_skew_persistence.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/database/isar_schemas.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/repositories/weather_repository.dart';
import 'package:workmanager/workmanager.dart';

/// Registers the Android periodic task that refreshes home screen widgets.
void registerWidgetBackgroundTask() {
  if (!Platform.isAndroid) return;
  Workmanager().registerPeriodicTask(
    'widgetUpdate',
    'widgetBackgroundUpdate',
    frequency: AppConstants.workManagerMinInterval,
    existingWorkPolicy: ExistingPeriodicWorkPolicy.update,
  );
}

/// Schedules a one-off widget refresh after device boot.
void registerWidgetBootUpdateTask() {
  if (!Platform.isAndroid) return;
  Workmanager().registerOneOffTask(
    'widgetBootUpdate',
    'widgetBackgroundUpdate',
    existingWorkPolicy: ExistingWorkPolicy.replace,
  );
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
  if (!await InternetConnection().hasInternetAccess) return;

  final repo = WeatherRepository(WeatherRemoteDatasource(), local);
  final weather = await repo.fetchWeather(location!.lat!, location.lon!);
  await repo.writeCache(weather, location);
  if (weather.clockSkewSeconds != null) {
    await persistClockSkewInIsar(isar, weather.clockSkewSeconds!);
  }
}

/// Fetches stale main weather when online, then pushes widget data from disk.
Future<bool> runWidgetBackgroundRefresh(
  Future<bool> Function(Isar isar) updateWidgets,
) async {
  Isar? isar;
  try {
    await initializeAppTimeZone();

    isar = await openRainIsar();
    await refreshMainWeatherIfStale(isar);
    final updated = await updateWidgets(isar);
    try {
      await updatePersistentNotificationFromIsar(isar);
    } catch (_) {}
    return updated;
  } catch (_) {
    return false;
  } finally {
    await isar?.close();
  }
}
