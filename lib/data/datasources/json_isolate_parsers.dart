import 'package:rain/data/models/air_quality_api.dart';
import 'package:rain/data/models/weather_api.dart';

/// Top-level parsers for [Isolate.run] / [compute] (must not capture state).

WeatherDataApi parseWeatherDataApiJson(Map<String, dynamic> json) =>
    WeatherDataApi.fromJson(json);

AirQualityDataApi parseAirQualityDataApiJson(Map<String, dynamic> json) =>
    AirQualityDataApi.fromJson(json);

/// Normalizes Dio/JSON decode output to [Map<String, dynamic>].
Map<String, dynamic> asJsonMap(dynamic data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) return Map<String, dynamic>.from(data);
  throw const FormatException('Expected JSON object');
}
