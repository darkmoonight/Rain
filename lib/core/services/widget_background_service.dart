import 'dart:io';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/database/isar_schemas.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/repositories/weather_repository.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
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

/// Fetches stale main weather when online, then pushes widget data from disk.
Future<bool> runWidgetBackgroundRefresh(
  Future<bool> Function(Isar isar) updateWidgets,
) async {
  Isar? isar;
  try {
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));

    isar = await openRainIsar();
    await _refreshMainWeatherIfStale(isar);
    return updateWidgets(isar);
  } catch (_) {
    return false;
  } finally {
    await isar?.close();
  }
}

/// Refreshes the main forecast when the cache is older than the widget interval.
Future<void> _refreshMainWeatherIfStale(Isar isar) async {
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
}
