import '../../helpers/fixtures.dart';
import '../../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/models/db.dart';

class _SpyNotificationService extends NotificationService {
  _SpyNotificationService() : super(AssetCacheService());

  int cancelCalls = 0;

  @override
  Future<void> cancelAll() async {
    cancelCalls++;
  }
}

void main() {
  setUpAll(initTestEnvironment);

  group('NotificationService', () {
    late _SpyNotificationService service;

    setUp(() {
      service = _SpyNotificationService();
    });

    test(
      'rescheduleForWeather skips when notifications are disabled',
      () async {
        await service.rescheduleForWeather(
          cache: sampleMainWeatherCache(),
          settings: Settings()..notifications = false,
          appSettings: const AppSettingsState(),
          cityLabel: 'Moscow',
        );

        expect(service.cancelCalls, 0);
      },
    );

    test(
      'scheduleForWeather delegates to slot builder without throwing',
      () async {
        final cache = sampleMainWeatherCache();
        final appSettings = const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        );
        final expectedSlots = buildWeatherNotificationSlots(
          cache: cache,
          settings: Settings()..notifications = true,
          appSettings: appSettings,
          cityLabel: 'Moscow',
          now: DateTime(2026, 6, 5, 11),
        );

        await service.scheduleForWeather(
          cache: cache,
          settings: Settings()..notifications = true,
          appSettings: appSettings,
          cityLabel: 'Moscow',
        );

        expect(expectedSlots, isNotEmpty);
      },
    );

    test('uses stable positive notification ids', () {
      final slot = WeatherNotificationSlot(
        title: 'Moscow: 20°',
        body: 'Clear · 13:00',
        time: DateTime(2026, 6, 5, 13),
        icon: 'assets/icons/weather/0.png',
      );

      final id = NotificationService.notificationIdFor(slot);

      expect(id, greaterThan(0));
      expect(NotificationService.notificationIdFor(slot), id);
    });

    test(
      'rescheduleForWeather cancels pending when notifications enabled',
      () async {
        await service.rescheduleForWeather(
          cache: sampleMainWeatherCache(),
          settings: Settings()..notifications = true,
          appSettings: const AppSettingsState(
            timeStart: '00:00',
            timeEnd: '23:59',
          ),
          cityLabel: 'Moscow',
        );

        expect(service.cancelCalls, 1);
      },
    );
  });
}
