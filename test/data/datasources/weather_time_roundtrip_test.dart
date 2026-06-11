import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';

void main() {
  late TestIsarContext ctx;
  late WeatherLocalDatasource datasource;

  setUp(() async {
    ctx = await openTestIsar();
    datasource = WeatherLocalDatasource(ctx.isar);
  });

  test('MainWeatherCache.time survives Isar round-trip', () async {
    final weather = sampleMainWeatherCache();
    await datasource.saveMainWeather(weather, sampleLocationCache());

    final loaded = await datasource.getMainWeather();
    expect(loaded?.time, ['2026-06-05T12:00', '2026-06-05T13:00']);
  });

  test('fetched weather time survives Isar round-trip', () async {
    final remote = WeatherRemoteDatasource(dio: createFakeWeatherDio());
    final cache = await remote.fetchWeather(55.75, 37.62);

    expect(cache.time, isNotEmpty);

    await datasource.saveMainWeather(cache, sampleLocationCache());
    final loaded = await datasource.getMainWeather();

    expect(loaded?.time, isNotEmpty);
    expect(loaded?.time?.first, contains('T'));
  });
}
