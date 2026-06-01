import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';

class WeatherRepository {
  WeatherRepository(this._remote, this._local);

  final WeatherRemoteDatasource _remote;
  final WeatherLocalDatasource _local;

  Future<MainWeatherCache> fetchWeather(double lat, double lon) =>
      _remote.fetchWeather(lat, lon);

  Future<({MainWeatherCache? weather, LocationCache? location})>
  readCache() async {
    final weather = await _local.getMainWeather();
    final location = await _local.getLocation();
    return (weather: weather, location: location);
  }

  Future<void> writeCache(MainWeatherCache weather, LocationCache location) =>
      _local.saveMainWeather(weather, location);

  Future<void> deleteExpiredCache(DateTime expiry) =>
      _local.deleteExpiredMainWeather(expiry);

  Future<bool> hasCachedWeather() => _local.hasMainWeather();

  Future<void> clearMainAndLocation() async {
    await _local.deleteMainWeather();
    await _local.deleteLocation();
  }

  Future<void> clearMainOnly() => _local.deleteMainWeather();
}
