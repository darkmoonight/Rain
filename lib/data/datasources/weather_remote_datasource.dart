import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rain/data/models/city_api.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/models/weather_api.dart';
import 'package:rain/data/mappers/weather_mapper.dart';

class WeatherRemoteDatasource {
  WeatherRemoteDatasource({Dio? dio, Dio? dioLocation})
    : _dio = dio ?? Dio()
        ..options.baseUrl = 'https://api.open-meteo.com/v1/forecast?',
      _dioLocation = dioLocation ?? Dio();

  final Dio _dio;
  final Dio _dioLocation;

  static const String _weatherParams =
      'hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index,dewpoint_2m,precipitation_probability,shortwave_radiation'
      '&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant'
      '&forecast_days=12&timezone=auto';

  String _buildWeatherUrl(double lat, double lon) =>
      'latitude=$lat&longitude=$lon&$_weatherParams';

  Future<MainWeatherCache> fetchWeather(double lat, double lon) async {
    try {
      final response = await _dio.get(_buildWeatherUrl(lat, lon));
      final weatherData = WeatherDataApi.fromJson(response.data);
      return WeatherMapper.toMainWeatherCache(weatherData);
    } on DioException catch (e) {
      if (kDebugMode) print(e);
      rethrow;
    }
  }

  Future<WeatherCard> fetchWeatherCard(
    double lat,
    double lon,
    String city,
    String district,
    String timezone,
  ) async {
    try {
      final response = await _dio.get(_buildWeatherUrl(lat, lon));
      final weatherData = WeatherDataApi.fromJson(response.data);
      return WeatherMapper.toWeatherCard(
        weatherData,
        lat,
        lon,
        city,
        district,
        timezone,
      );
    } on DioException catch (e) {
      if (kDebugMode) print(e);
      rethrow;
    }
  }

  Future<Iterable<CitySearchResult>> searchCities(
    String query,
    String? languageCode,
  ) async {
    final url =
        'https://geocoding-api.open-meteo.com/v1/search?name=$query&count=5&language=$languageCode&format=json';
    try {
      final response = await _dioLocation.get(url);
      if (response.statusCode == 200) {
        final cityData = CityApi.fromJson(response.data);
        return cityData.results.map(
          (e) => CitySearchResult(
            admin1: e.admin1,
            name: e.name,
            latitude: e.latitude,
            longitude: e.longitude,
          ),
        );
      }
      throw Exception('Failed to load suggestions');
    } on DioException catch (e) {
      if (kDebugMode) print(e);
      rethrow;
    }
  }
}

class CitySearchResult {
  const CitySearchResult({
    required this.admin1,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  final String? admin1;
  final String? name;
  final double? latitude;
  final double? longitude;
}
