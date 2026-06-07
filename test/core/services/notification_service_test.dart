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
        await service.scheduleForWeather(
          cache: sampleMainWeatherCache(),
          settings: Settings()..notifications = true,
          appSettings: const AppSettingsState(
            timeStart: '00:00',
            timeEnd: '23:59',
          ),
          cityLabel: 'Moscow',
        );
      },
    );

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
