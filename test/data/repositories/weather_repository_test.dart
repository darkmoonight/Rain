import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/repositories/weather_repository.dart';

void main() {
  late TestIsarContext ctx;
  late WeatherRepository repository;

  setUp(() async {
    ctx = await openTestIsar();
    final remote = createFakeWeatherRemoteDatasource();
    final local = WeatherLocalDatasource(ctx.isar);
    repository = WeatherRepository(remote, local);
  });

  tearDown(() async {});

  group('WeatherRepository', () {
    test('fetchWeather returns mapped cache from remote', () async {
      final weather = await repository.fetchWeather(55.75, 37.62);
      expect(weather.timezone, 'Europe/Moscow');
      expect(weather.temperature2M, isNotEmpty);
    });

    test('writeCache and readCache round-trip', () async {
      final weather = sampleMainWeatherCache();
      final location = sampleLocationCache();

      await repository.writeCache(weather, location);
      final cached = await repository.readCache();

      expect(cached.weather, isNotNull);
      expect(cached.location?.city, 'Moscow');
    });

    test('isCacheExpired reflects local datasource state', () async {
      await repository.writeCache(
        sampleMainWeatherCache()..timestamp = DateTime(2026, 6, 4),
        sampleLocationCache(),
      );

      expect(await repository.isCacheExpired(DateTime(2026, 6, 5)), isTrue);
    });

    test('clearMainAndLocation removes both caches', () async {
      await repository.writeCache(
        sampleMainWeatherCache(),
        sampleLocationCache(),
      );

      await repository.clearMainAndLocation();
      final cached = await repository.readCache();

      expect(cached.weather, isNull);
      expect(cached.location, isNull);
    });

    test('clearMainOnly keeps location', () async {
      await repository.writeCache(
        sampleMainWeatherCache(),
        sampleLocationCache(),
      );

      await repository.clearMainOnly();
      final cached = await repository.readCache();

      expect(cached.weather, isNull);
      expect(cached.location, isNotNull);
    });
  });
}
