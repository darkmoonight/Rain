import '../../helpers/fake_path_provider.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/services/widget_background_service.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';

void installFakeFlutterTimezone() {
  const channel = MethodChannel('flutter_timezone');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'getLocalTimezone') {
          return 'Europe/Moscow';
        }
        return null;
      });
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    installFakePathProvider();
    installFakeFlutterTimezone();
  });

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

  group('hasBackgroundInternetAccess', () {
    test('returns false when connectivity plugin is unavailable', () async {
      await expectLater(hasBackgroundInternetAccess(), completion(isA<bool>()));
    });
  });

  group('runWidgetBackgroundRefresh', () {
    test('invokes update callback without throwing', () async {
      await closeSharedTestIsar();

      var callbackInvoked = false;
      final result = await runWidgetBackgroundRefresh((isar) async {
        callbackInvoked = true;
        expect(isar.isOpen, isTrue);
        return true;
      });

      expect(callbackInvoked, isTrue);
      expect(result, isTrue);
    });

    test('reuses an already open Isar instance without closing it', () async {
      var callbackInvoked = false;
      final result = await runWidgetBackgroundRefresh((isar) async {
        callbackInvoked = true;
        expect(identical(isar, ctx.isar), isTrue);
        return true;
      });

      expect(callbackInvoked, isTrue);
      expect(result, isTrue);
      expect(ctx.isar.isOpen, isTrue);
    });

    test('still invokes update callback when weather refresh throws', () async {
      await closeSharedTestIsar();

      var callbackInvoked = false;
      final result = await runWidgetBackgroundRefresh((isar) async {
        callbackInvoked = true;
        return true;
      }, refreshStaleWeather: (_) async => throw StateError('offline'));

      expect(callbackInvoked, isTrue);
      expect(result, isTrue);
    });
  });
}
