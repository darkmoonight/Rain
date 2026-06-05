import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

class WeatherLocalDatasource {
  WeatherLocalDatasource(this._isar);

  final Isar _isar;

  Future<MainWeatherCache?> getMainWeather() =>
      _isar.mainWeatherCaches.where().findFirst();

  Future<LocationCache?> getLocation() =>
      _isar.locationCaches.where().findFirst();

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

  Future<bool> isMainWeatherExpired(DateTime expiry) async {
    final weather = await getMainWeather();
    if (weather == null) return false;
    final timestamp = weather.timestamp;
    return timestamp == null || timestamp.isBefore(expiry);
  }

  Future<void> deleteMainWeather() async {
    await _isar.writeTxn(() => _isar.mainWeatherCaches.where().deleteAll());
  }

  Future<void> deleteLocation() async {
    await _isar.writeTxn(() => _isar.locationCaches.where().deleteAll());
  }

  Future<bool> isMainWeatherEmpty() =>
      _isar.mainWeatherCaches.where().isEmpty();
}
