import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/domain/entities/city_search_result.dart';
import 'package:rain/domain/entities/geo_place.dart';
import 'package:rain/domain/entities/weather_forecast.dart';
import 'package:rain/domain/repositories/weather_repository.dart';

/// Isar + remote implementation of [WeatherRepository].
class IsarWeatherRepository implements WeatherRepository {
  IsarWeatherRepository(this._remote, this._local);

  final WeatherRemoteDatasource _remote;
  final WeatherLocalDatasource _local;

  @override
  Future<WeatherForecast> fetchWeather(double lat, double lon) async {
    final cache = await _remote.fetchWeather(lat, lon);
    return DomainMapper.forecastToDomain(cache);
  }

  @override
  Future<Iterable<CitySearchResult>> searchCities(
    String query,
    String? languageCode,
  ) => _remote.searchCities(query, languageCode);

  @override
  Future<({String city, String district})?> reverseGeocode(
    double lat,
    double lon, {
    String? languageCode,
  }) => _remote.reverseGeocode(lat, lon, languageCode: languageCode);

  @override
  Future<bool> hasLocationCache() => _local.hasLocationCache();

  @override
  Future<({WeatherForecast? weather, GeoPlace? location})> readCache() async {
    final weather = await _local.getMainWeather();
    final location = await _local.getLocation();
    return (
      weather: weather == null ? null : DomainMapper.forecastToDomain(weather),
      location: location == null ? null : DomainMapper.placeToDomain(location),
    );
  }

  @override
  Future<void> writeCache(WeatherForecast weather, GeoPlace location) =>
      _local.saveMainWeather(
        DomainMapper.forecastToIsar(weather),
        DomainMapper.placeToIsar(location),
      );

  @override
  Future<bool> isCacheExpired(DateTime expiry) =>
      _local.isMainWeatherExpired(expiry);

  @override
  Future<void> clearMainAndLocation() async {
    await _local.deleteMainWeather();
    await _local.deleteLocation();
  }

  @override
  Future<void> clearMainOnly() => _local.deleteMainWeather();
}
