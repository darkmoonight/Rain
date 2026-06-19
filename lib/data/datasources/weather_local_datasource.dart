import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

/// Persists and reads the primary weather and location cache in Isar.
class WeatherLocalDatasource {
  WeatherLocalDatasource(this._isar);

  final Isar _isar;

  /// Returns the stored main weather cache, or null if none exists.
  Future<MainWeatherCache?> getMainWeather() =>
      _isar.mainWeatherCaches.where().findFirst();

  /// Returns the stored location cache, or null if none exists.
  Future<LocationCache?> getLocation() =>
      _isar.locationCaches.where().findFirst();

  /// Upserts main weather and location caches in a single transaction.
  Future<void> saveMainWeather(
    MainWeatherCache weather,
    LocationCache location,
  ) async {
    await _isar.writeTxn(() async {
      final existingWeather = await _isar.mainWeatherCaches.where().findFirst();
      if (existingWeather != null) {
        weather.id = existingWeather.id;
      }
      final existingLocation = await _isar.locationCaches.where().findFirst();
      if (existingLocation != null) {
        location.id = existingLocation.id;
      }
      await _isar.mainWeatherCaches.put(weather);
      await _isar.locationCaches.put(location);
    });
  }

  /// Returns true if a cache row exists and its timestamp is missing or before [expiry]; false if absent.
  Future<bool> isMainWeatherExpired(DateTime expiry) async {
    final weather = await getMainWeather();
    if (weather == null) return false;
    final timestamp = weather.timestamp;
    return timestamp == null || timestamp.isBefore(expiry);
  }

  /// Returns true when no main weather cache row is stored.
  Future<bool> isMainWeatherEmpty() =>
      _isar.mainWeatherCaches.where().isEmpty();

  /// Deletes all rows from the main weather cache collection.
  Future<void> deleteMainWeather() async {
    await _isar.writeTxn(() => _isar.mainWeatherCaches.where().deleteAll());
  }

  /// Deletes all rows from the location cache collection.
  Future<void> deleteLocation() async {
    await _isar.writeTxn(() => _isar.locationCaches.where().deleteAll());
  }
}
