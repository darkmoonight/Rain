import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';

void main() {
  late TestIsarContext ctx;
  late WeatherLocalDatasource datasource;

  setUp(() async {
    ctx = await openTestIsar();
    datasource = WeatherLocalDatasource(ctx.isar);
  });

  tearDown(() async {});

  group('WeatherLocalDatasource', () {
    test('getMainWeather returns null when empty', () async {
      expect(await datasource.getMainWeather(), isNull);
    });

    test('saveMainWeather persists weather and location', () async {
      final weather = sampleWeatherForecastIsar();
      final location = sampleGeoPlaceIsar();

      await datasource.saveMainWeather(weather, location);

      expect(await datasource.getMainWeather(), isNotNull);
      expect(await datasource.getLocation(), isNotNull);
      expect((await datasource.getLocation())!.city, 'Moscow');
    });

    test('isMainWeatherExpired returns false when cache is absent', () async {
      final expiry = DateTime(2026, 6, 5);
      expect(await datasource.isMainWeatherExpired(expiry), isFalse);
    });

    test('isMainWeatherExpired returns true for stale timestamp', () async {
      await datasource.saveMainWeather(
        sampleWeatherForecastIsar()..timestamp = DateTime(2026, 6, 4),
        sampleGeoPlaceIsar(),
      );

      expect(
        await datasource.isMainWeatherExpired(DateTime(2026, 6, 5)),
        isTrue,
      );
    });

    test('deleteMainWeather clears weather but keeps location', () async {
      await datasource.saveMainWeather(
        sampleWeatherForecastIsar(),
        sampleGeoPlaceIsar(),
      );

      await datasource.deleteMainWeather();

      expect(await datasource.isMainWeatherEmpty(), isTrue);
      expect(await datasource.getLocation(), isNotNull);
    });

    test('deleteLocation removes location cache', () async {
      await datasource.saveMainWeather(
        sampleWeatherForecastIsar(),
        sampleGeoPlaceIsar(),
      );

      await datasource.deleteLocation();

      expect(await datasource.getLocation(), isNull);
    });
  });
}
