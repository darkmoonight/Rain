import 'package:dio/dio.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/data/datasources/air_quality_remote_datasource.dart';
import 'package:rain/data/mappers/air_quality_mapper.dart';
import 'package:rain/data/models/air_quality_api.dart';
import 'package:rain/data/models/city_api.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/models/weather_api.dart';
import 'package:rain/data/mappers/weather_mapper.dart';

/// Fetches forecast data from Open-Meteo and city suggestions from its geocoding API.
class WeatherRemoteDatasource {
  /// When [dioLocation] is omitted, geocoding reuses [dio] so tests can stub both APIs
  /// with a single fake client instead of hitting the network.
  WeatherRemoteDatasource({
    Dio? dio,
    Dio? dioLocation,
    AirQualityRemoteDatasource? airQuality,
  }) : _dio = dio ?? Dio()
           ..options.baseUrl = 'https://api.open-meteo.com/v1/forecast?',
       _dioLocation = dioLocation ?? dio ?? Dio(),
       _airQuality = airQuality ?? AirQualityRemoteDatasource(dio: dio);

  final Dio _dio;
  final Dio _dioLocation;
  final AirQualityRemoteDatasource _airQuality;

  static const String _weatherParams =
      'hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index,dewpoint_2m,precipitation_probability,shortwave_radiation'
      '&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant'
      '&forecast_days=12&timezone=auto';

  /// Builds the forecast query string for the given coordinates.
  String _buildWeatherUrl(double lat, double lon) =>
      'latitude=$lat&longitude=$lon&$_weatherParams';

  /// Fetches weather and air quality in parallel.
  Future<(WeatherDataApi, AirQualityDataApi?)> _fetchWeatherAndAq(
    double lat,
    double lon,
  ) async {
    final results = await Future.wait<dynamic>([
      _dio.get(_buildWeatherUrl(lat, lon)),
      _airQuality.fetchAirQuality(lat, lon),
    ]);
    return (
      WeatherDataApi.fromJson((results[0] as Response<dynamic>).data),
      results[1] as AirQualityDataApi?,
    );
  }

  /// Fetches a 12-day forecast and maps it to a main weather cache model.
  Future<MainWeatherCache> fetchWeather(double lat, double lon) async {
    try {
      final (weatherData, aqData) = await _fetchWeatherAndAq(lat, lon);
      final cache = WeatherMapper.toMainWeatherCache(weatherData);
      if (aqData != null) {
        AirQualityMapper.merge(cache, aqData);
      }
      return cache;
    } on DioException catch (e, stackTrace) {
      debugLogError('WeatherRemoteDatasource.fetchWeather', e, stackTrace);
      rethrow;
    }
  }

  /// Fetches a forecast and maps it to a city weather card with location metadata.
  Future<WeatherCard> fetchWeatherCard(
    double lat,
    double lon,
    String city,
    String district,
    String timezone,
  ) async {
    try {
      final (weatherData, aqData) = await _fetchWeatherAndAq(lat, lon);
      final card = WeatherMapper.toWeatherCard(
        weatherData,
        lat,
        lon,
        city,
        district,
        timezone,
      );
      if (aqData != null) {
        AirQualityMapper.merge(card, aqData);
      }
      return card;
    } on DioException catch (e, stackTrace) {
      debugLogError('WeatherRemoteDatasource.fetchWeatherCard', e, stackTrace);
      rethrow;
    }
  }

  /// Searches Open-Meteo geocoding for up to five matching cities.
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
    } on DioException catch (e, stackTrace) {
      debugLogError('WeatherRemoteDatasource.searchCities', e, stackTrace);
      rethrow;
    }
  }
}

/// A normalized city match returned from geocoding search.
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
