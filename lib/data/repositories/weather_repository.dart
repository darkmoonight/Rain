import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';

/// Coordinates remote weather fetches with local main-weather cache persistence.
class WeatherRepository {
  WeatherRepository(this._remote, this._local);

  final WeatherRemoteDatasource _remote;
  final WeatherLocalDatasource _local;

  /// Fetches a fresh main weather forecast for the given coordinates.
  Future<MainWeatherCache> fetchWeather(double lat, double lon) =>
      _remote.fetchWeather(lat, lon);

  /// Reads the locally stored main weather and location caches.
  Future<({MainWeatherCache? weather, LocationCache? location})>
  readCache() async {
    final weather = await _local.getMainWeather();
    final location = await _local.getLocation();
    return (weather: weather, location: location);
  }

  /// Persists main weather and location caches together.
  Future<void> writeCache(MainWeatherCache weather, LocationCache location) =>
      _local.saveMainWeather(weather, location);

  /// Returns true when the main weather cache is missing or stale.
  Future<bool> isCacheExpired(DateTime expiry) =>
      _local.isMainWeatherExpired(expiry);

  /// Clears both the main weather and location caches.
  Future<void> clearMainAndLocation() async {
    await _local.deleteMainWeather();
    await _local.deleteLocation();
  }

  /// Clears only the main weather cache, leaving location data intact.
  Future<void> clearMainOnly() => _local.deleteMainWeather();
}
