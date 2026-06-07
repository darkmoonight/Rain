import '../../../helpers/fake_services.dart';
import '../../../helpers/fixtures.dart';
import '../../../helpers/isar_test_helper.dart';
import '../../../helpers/test_bootstrap.dart';
import '../../../helpers/widget_test_harness.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/application/main_weather_notifier.dart';

void main() {
  group('MainWeatherNotifier', () {
    late TestBootstrapContext ctx;

    setUp(() async {
      ctx = await createTestBootstrap(
        settings: onboardedSettings()..notifications = false,
      );
      setTestConnectivity(true);
      await seedMainWeatherCache(ctx.isarContext.isar);
    });

    tearDown(() async {
      await ctx.dispose();
    });

    ProviderContainer createContainer() {
      final container = createTestContainer(
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            _TestMainWeatherNotifier.new,
          ),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
          notificationServiceProvider.overrideWithValue(
            FakeNotificationService(),
          ),
          homeWidgetServiceProvider.overrideWithValue(FakeHomeWidgetService()),
          locationServiceProvider.overrideWithValue(FakeLocationService()),
        ],
      );
      addTearDown(container.dispose);
      return container;
    }

    test('readCache loads persisted forecast into state', () async {
      final container = createContainer();
      final notifier = container.read(mainWeatherNotifierProvider.notifier);

      await notifier.readCache();

      final state = container.read(mainWeatherNotifierProvider);
      expect(state.isLoading, isFalse);
      expect(state.mainWeather.timezone, 'Europe/Moscow');
      expect(state.city, 'Moscow');
    });

    test('setHourAndDay updates selected indices', () {
      final container = createContainer();
      final notifier = container.read(mainWeatherNotifierProvider.notifier);

      notifier.setHourAndDay(3, 1);

      final state = container.read(mainWeatherNotifierProvider);
      expect(state.hourOfDay, 3);
      expect(state.dayOfNow, 1);
    });

    test('getLocation uses cache when offline', () async {
      setTestConnectivity(false);
      final container = createContainer();
      final notifier = container.read(mainWeatherNotifierProvider.notifier);

      await notifier.getLocation(55.75, 37.62, 'Moscow Oblast', 'Moscow');

      final state = container.read(mainWeatherNotifierProvider);
      expect(state.isLoading, isFalse);
      expect(state.mainWeather.timezone, 'Europe/Moscow');
    });

    test('refresh loads forecast when online', () async {
      final container = createContainer();
      final notifier = container.read(mainWeatherNotifierProvider.notifier);

      await notifier.refresh();

      final state = container.read(mainWeatherNotifierProvider);
      expect(state.isLoading, isFalse);
      expect(state.mainWeather.timezone, 'Europe/Moscow');
    });

    test('getCurrentLocation fetches GPS place when online', () async {
      final container = createContainer();
      final notifier = container.read(mainWeatherNotifierProvider.notifier);
      ctx.bootstrap.settings.location = true;

      await notifier.getCurrentLocation();

      final state = container.read(mainWeatherNotifierProvider);
      expect(state.isLoading, isFalse);
      expect(state.city, 'Moscow');
    });

    test('readCache refetches legacy Fahrenheit cache when online', () async {
      final fahrenheitCache = sampleMainWeatherCache()
        ..temperature2M = [82.0, 83.0]
        ..apparentTemperature = [80.0, 81.0];
      await seedMainWeatherCache(
        ctx.isarContext.isar,
        weather: fahrenheitCache,
      );

      final container = createContainer();
      final notifier = container.read(mainWeatherNotifierProvider.notifier);

      await notifier.readCache();

      final state = container.read(mainWeatherNotifierProvider);
      expect(state.isLoading, isFalse);
      expect(state.mainWeather.temperature2M!.first, lessThan(60));
    });

    test('deleteAll clears cache when changing city online', () async {
      final container = createContainer();
      final notifier = container.read(mainWeatherNotifierProvider.notifier);

      await notifier.deleteAll(true);

      final cache = await container.read(weatherRepositoryProvider).readCache();
      expect(cache.weather, isNull);
      expect(cache.location, isNull);
    });

    test('readCache reschedules notifications when enabled', () async {
      ctx.bootstrap.settings.notifications = true;
      final fakeNotifications = FakeNotificationService();

      final container = createTestContainer(
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            _TestMainWeatherNotifier.new,
          ),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
          notificationServiceProvider.overrideWithValue(fakeNotifications),
          homeWidgetServiceProvider.overrideWithValue(FakeHomeWidgetService()),
          locationServiceProvider.overrideWithValue(FakeLocationService()),
        ],
      );
      addTearDown(container.dispose);

      await container.read(mainWeatherNotifierProvider.notifier).readCache();

      expect(fakeNotifications.rescheduleCalls, 1);
    });
  });

  group('MainWeatherNotifier init', () {
    late TestBootstrapContext ctx;

    tearDown(() async {
      await ctx.dispose();
    });

    Future<FakeNotificationService> pumpInit({
      required bool notificationsEnabled,
    }) async {
      ctx = await createTestBootstrap(
        settings: onboardedSettings()..notifications = notificationsEnabled,
      );
      setTestConnectivity(true);
      final fakeNotifications = FakeNotificationService();

      final container = createTestContainer(
        bootstrap: ctx.bootstrap,
        overrides: [
          notificationServiceProvider.overrideWithValue(fakeNotifications),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
          locationServiceProvider.overrideWithValue(FakeLocationService()),
          homeWidgetServiceProvider.overrideWithValue(FakeHomeWidgetService()),
        ],
      );
      addTearDown(container.dispose);

      container.read(mainWeatherNotifierProvider);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(const Duration(milliseconds: 100));

      return fakeNotifications;
    }

    test('does not cancel notifications when cache is empty but enabled', () async {
      final fakeNotifications = await pumpInit(notificationsEnabled: true);

      expect(fakeNotifications.cancelAllCalls, 0);
    });

    test('cancels notifications when cache is empty and disabled', () async {
      final fakeNotifications = await pumpInit(notificationsEnabled: false);

      expect(fakeNotifications.cancelAllCalls, 1);
    });
  });
}

class _TestMainWeatherNotifier extends MainWeatherNotifier {
  @override
  MainWeatherState build() => MainWeatherState(
    isLoading: true,
    mainWeather: MainWeatherCache(),
    location: LocationCache(),
  );
}
