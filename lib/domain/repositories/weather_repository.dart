import 'package:rain/domain/entities/city_search_result.dart';
import 'package:rain/domain/entities/geo_place.dart';
import 'package:rain/domain/entities/weather_forecast.dart';

/// Port for main-weather fetch and local cache persistence.
abstract class WeatherRepository {
  /// Fetches a fresh main weather forecast for the given coordinates.
  Future<WeatherForecast> fetchWeather(double lat, double lon);

  /// Searches cities via the geocoding API.
  Future<Iterable<CitySearchResult>> searchCities(
    String query,
    String? languageCode,
  );

  /// Reverse-geocodes coordinates to city/district labels.
  Future<({String city, String district})?> reverseGeocode(
    double lat,
    double lon, {
    String? languageCode,
  });

  /// Whether any primary location cache row exists.
  Future<bool> hasLocationCache();

  /// Reads the locally stored main weather and location caches.
  Future<({WeatherForecast? weather, GeoPlace? location})> readCache();

  /// Persists main weather and location.
  Future<void> writeCache(WeatherForecast weather, GeoPlace location);

  /// Returns true if a cache row exists and is expired before [expiry].
  Future<bool> isCacheExpired(DateTime expiry);

  /// Clears both the main weather and location caches.
  Future<void> clearMainAndLocation();

  /// Clears only the main weather cache, leaving location data intact.
  Future<void> clearMainOnly();
}
