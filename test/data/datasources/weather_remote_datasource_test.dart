import '../../helpers/fixtures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/datasources/air_quality_remote_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';

void main() {
  group('WeatherRemoteDatasource', () {
    late WeatherRemoteDatasource datasource;

    setUp(() {
      final dio = createFakeWeatherDio();
      datasource = WeatherRemoteDatasource(dio: dio, dioLocation: dio);
    });

    test('fetchWeather maps API response to MainWeatherCache', () async {
      final cache = await datasource.fetchWeather(55.75, 37.62);
      expect(cache.timezone, 'Europe/Moscow');
      expect(cache.temperature2M, [20.0, 21.0]);
      expect(cache.europeanAqi, [28.0, 32.0]);
      expect(cache.pm25, [8.4, 9.1]);
    });

    test('fetchWeather succeeds when air quality API fails', () async {
      final dio = createFakeWeatherDio();
      final failingAq = AirQualityRemoteDatasource(
        dio: Dio()
          ..interceptors.add(
            InterceptorsWrapper(
              onRequest: (options, handler) => handler.reject(
                DioException(
                  requestOptions: options,
                  type: DioExceptionType.connectionError,
                ),
              ),
            ),
          ),
      );
      final resilientDatasource = WeatherRemoteDatasource(
        dio: dio,
        dioLocation: dio,
        airQuality: failingAq,
      );

      final cache = await resilientDatasource.fetchWeather(55.75, 37.62);

      expect(cache.temperature2M, [20.0, 21.0]);
      expect(cache.europeanAqi, isNull);
    });

    test('fetchWeatherCard includes location metadata', () async {
      final card = await datasource.fetchWeatherCard(
        55.75,
        37.62,
        'Moscow',
        'Moscow Oblast',
      );

      expect(card.city, 'Moscow');
      expect(card.district, 'Moscow Oblast');
      expect(card.lat, 55.75);
      expect(card.timezone, 'Europe/Moscow');
    });

    test('searchCities returns normalized results', () async {
      final results = await datasource.searchCities('Moscow', 'en');
      expect(results, hasLength(1));
      expect(results.first.name, 'Moscow');
    });

    test('searchCities returns empty when API has no matches', () async {
      final emptyDio = createFakeWeatherDio(cityJson: {'results': []});
      final emptyDatasource = WeatherRemoteDatasource(
        dio: emptyDio,
        dioLocation: emptyDio,
      );

      final results = await emptyDatasource.searchCities('Nowhere', 'en');

      expect(results, isEmpty);
    });
  });
}
