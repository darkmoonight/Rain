import 'dart:io';

import 'package:isar_community/isar.dart';
import 'package:rain/core/database/isar_schemas.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/domain/entities/entities.dart';

import 'fixtures.dart';
import 'test_helpers.dart';

/// Holds an Isar instance and its temp directory for cleanup.
class TestIsarContext {
  TestIsarContext({required this.isar, required this.directory});

  final Isar isar;
  final Directory directory;

  Future<void> close() async {
    if (isar.isOpen) {
      await isar.close(deleteFromDisk: true);
    }
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
    }
  }
}

TestIsarContext? _sharedContext;

/// Opens a shared Isar database for the current test isolate.
Future<TestIsarContext> openTestIsar() async {
  if (_sharedContext != null && _sharedContext!.isar.isOpen) {
    await resetTestIsar(_sharedContext!.isar);
    return _sharedContext!;
  }

  await initTestEnvironment();
  final directory = Directory.systemTemp.createTempSync('rain_test_isar_');
  final isar = await openRainIsar(directory: directory.path);
  _sharedContext = TestIsarContext(isar: isar, directory: directory);
  return _sharedContext!;
}

/// Clears all collections between tests without closing the database.
Future<void> resetTestIsar(Isar isar) async {
  await isar.writeTxn(() async {
    await isar.clear();
  });
}

/// Closes the shared Isar instance at the end of a test file isolate.
Future<void> closeSharedTestIsar() async {
  if (_sharedContext != null) {
    await _sharedContext!.close();
    _sharedContext = null;
  }
}

/// Persists [settings] and returns the same instance.
Future<Settings> seedSettings(Isar isar, Settings settings) async {
  await isar.writeTxn(() => isar.settings.put(settings));
  return settings;
}

/// Persists [place] and returns it with an assigned Isar id.
Future<SavedPlace> seedSavedPlace(Isar isar, SavedPlace place) async {
  final card = DomainMapper.cardToIsar(place);
  await isar.writeTxn(() => isar.weatherCards.put(card));
  return place.copyWith(id: card.id, index: card.index);
}

/// Alias for older call sites.
Future<SavedPlace> seedWeatherCard(Isar isar, SavedPlace place) =>
    seedSavedPlace(isar, place);

/// Persists main weather and location caches from domain entities.
Future<void> seedWeatherForecast(
  Isar isar, {
  WeatherForecast? weather,
  GeoPlace? location,
}) async {
  final w = DomainMapper.forecastToIsar(weather ?? sampleWeatherForecast());
  final l = DomainMapper.placeToIsar(location ?? sampleGeoPlace());
  await isar.writeTxn(() async {
    await isar.mainWeatherCaches.put(w);
    await isar.locationCaches.put(l);
  });
}

/// Alias for older call sites.
Future<void> seedMainWeatherCache(
  Isar isar, {
  WeatherForecast? weather,
  GeoPlace? location,
}) => seedWeatherForecast(isar, weather: weather, location: location);
