import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/datasources/air_quality_remote_datasource.dart';

void main() {
  group('AirQualityRemoteDatasource', () {
    test('fetchAirQuality parses hourly AQI response', () async {
      final dio = Dio()
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) => handler.resolve(
              Response(
                requestOptions: options,
                data: {
                  'hourly': {
                    'time': ['2026-06-05T00:00', '2026-06-05T01:00'],
                    'european_aqi': [28, 32],
                    'us_aqi': [45, 50],
                    'pm2_5': [8.4, 9.1],
                    'pm10': [12.0, 13.0],
                    'ozone': [60.0, 61.0],
                    'carbon_monoxide': [200.0, 201.0],
                    'nitrogen_dioxide': [10.0, 11.0],
                    'sulphur_dioxide': [2.0, 2.1],
                  },
                },
              ),
            ),
          ),
        );

      final datasource = AirQualityRemoteDatasource(dio: dio);
      final result = await datasource.fetchAirQuality(55.75, 37.62);

      expect(result, isNotNull);
      expect(result!.hourly.europeanAqi, [28, 32]);
      expect(result.hourly.pm25, [8.4, 9.1]);
    });

    test('fetchAirQuality returns null on network failure', () async {
      final dio = Dio()
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) => handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionError,
              ),
            ),
          ),
        );

      final datasource = AirQualityRemoteDatasource(dio: dio);
      final result = await datasource.fetchAirQuality(55.75, 37.62);

      expect(result, isNull);
    });
  });
}
