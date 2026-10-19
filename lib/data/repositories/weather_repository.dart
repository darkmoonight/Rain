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

  /// Searches cities via the geocoding API.
  Future<Iterable<CitySearchResult>> searchCities(
    String query,
    String? languageCode,
  ) => _remote.searchCities(query, languageCode);

  /// Reverse-geocodes coordinates to city/district labels.
  Future<({String city, String district})?> reverseGeocode(
    double lat,
    double lon, {
    String? languageCode,
  }) => _remote.reverseGeocode(lat, lon, languageCode: languageCode);

  /// Whether any primary location cache row exists.
  Future<bool> hasLocationCache() => _local.hasLocationCache();

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

  /// Returns true if a cache row exists and its timestamp is missing or before [expiry]; false if absent.
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
