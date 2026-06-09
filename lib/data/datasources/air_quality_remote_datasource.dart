import 'package:dio/dio.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/data/models/air_quality_api.dart';

/// Fetches air quality forecast data from the Open-Meteo Air Quality API.
class AirQualityRemoteDatasource {
  AirQualityRemoteDatasource({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  static const _baseUrl =
      'https://air-quality-api.open-meteo.com/v1/air-quality'
      '?hourly=european_aqi,us_aqi,pm2_5,pm10,ozone,carbon_monoxide,nitrogen_dioxide,sulphur_dioxide'
      '&forecast_days=7&timezone=auto';

  /// Returns a 7-day hourly forecast for [lat]/[lon], or null on network failure.
  Future<AirQualityDataApi?> fetchAirQuality(double lat, double lon) async {
    try {
      final response = await _dio.get('$_baseUrl&latitude=$lat&longitude=$lon');
      return AirQualityDataApi.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      debugLogError('AirQualityRemoteDatasource.fetchAirQuality', e, stackTrace);
      return null;
    }
  }
}
