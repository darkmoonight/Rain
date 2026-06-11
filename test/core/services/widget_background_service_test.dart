import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/services/widget_background_service.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';

void main() {
  late TestIsarContext ctx;

  setUp(() async {
    ctx = await openTestIsar();
  });

  group('refreshMainWeatherIfStale', () {
    test('returns early when location is missing', () async {
      await refreshMainWeatherIfStale(ctx.isar);

      expect(await WeatherLocalDatasource(ctx.isar).getMainWeather(), isNull);
    });

    test('returns early when cache is still fresh', () async {
      final local = WeatherLocalDatasource(ctx.isar);
      await local.saveMainWeather(
        sampleMainWeatherCache()..timestamp = DateTime.now(),
        sampleLocationCache(),
      );

      await refreshMainWeatherIfStale(ctx.isar);

      expect((await local.getMainWeather())!.timestamp, isNotNull);
    });

    test('does not throw when cache is stale but offline', () async {
      final local = WeatherLocalDatasource(ctx.isar);
      await local.saveMainWeather(
        sampleMainWeatherCache()
          ..timestamp = DateTime.now().subtract(
            AppConstants.workManagerMinInterval + const Duration(minutes: 1),
          ),
        sampleLocationCache(),
      );

      await expectLater(refreshMainWeatherIfStale(ctx.isar), completes);
    });
  });
}
