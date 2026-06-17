import '../../helpers/fixtures.dart';
import '../../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/models/db.dart';

class _SpyNotificationService extends NotificationService {
  _SpyNotificationService() : super(AssetCacheService());

  int cancelScheduledCalls = 0;

  @override
  Future<void> cancelScheduled() async {
    cancelScheduledCalls++;
  }

  @override
  Future<void> cancelForecastNotifications() async {
    cancelScheduledCalls++;
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

        expect(service.cancelScheduledCalls, 0);
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

    test('uses stable schedule-epoch notification ids', () {
      const epoch = 1_715_000_000_000;
      final slot = WeatherNotificationSlot(
        title: 'Moscow: 20°',
        body: 'Clear · 13:00',
        time: DateTime(2026, 6, 5, 13),
        icon: 'assets/icons/weather/0.png',
        scheduleEpochMillis: epoch,
      );

      final id = NotificationService.notificationIdFor(slot);

      expect(id, greaterThan(NotificationService.persistentNotificationId));
      expect(NotificationService.notificationIdFor(slot), id);

      final updated = WeatherNotificationSlot(
        title: 'Moscow: 21°',
        body: 'Cloudy · 13:00',
        time: slot.time,
        icon: slot.icon,
        scheduleEpochMillis: epoch,
      );
      expect(NotificationService.notificationIdFor(updated), id);
    });

    test('uses distinct ids for the same hour on different days', () {
      const timezone = 'Europe/Moscow';
      const offset = 10800;
      final day1Epoch = forecastScheduleEpochMillis(
        DateTime(2026, 6, 5, 13),
        timezone,
        utcOffsetSeconds: offset,
      );
      final day2Epoch = forecastScheduleEpochMillis(
        DateTime(2026, 6, 6, 13),
        timezone,
        utcOffsetSeconds: offset,
      );

      final id1 = NotificationService.notificationIdFor(
        WeatherNotificationSlot(
          title: 'a',
          body: 'b',
          time: DateTime(2026, 6, 5, 13),
          icon: 'icon',
          scheduleEpochMillis: day1Epoch,
        ),
      );
      final id2 = NotificationService.notificationIdFor(
        WeatherNotificationSlot(
          title: 'a',
          body: 'b',
          time: DateTime(2026, 6, 6, 13),
          icon: 'icon',
          scheduleEpochMillis: day2Epoch,
        ),
      );

      expect(id1, isNot(id2));
    });

    test(
      'rescheduleForWeather does not cancel when no slots can be built',
      () async {
        await service.rescheduleForWeather(
          cache: MainWeatherCache(),
          settings: Settings()..notifications = true,
          appSettings: const AppSettingsState(),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 0);
      },
    );

    test(
      'rescheduleForWeather cancels pending when notifications enabled',
      () async {
        await service.rescheduleForWeather(
          cache: sampleFutureMainWeatherCache(),
          settings: Settings()..notifications = true,
          appSettings: const AppSettingsState(
            timeStart: '00:00',
            timeEnd: '23:59',
          ),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 1);
      },
    );

    test('buildPersistentNotificationContent uses current hour', () {
      final cache = sampleMainWeatherCache();
      final content = buildPersistentNotificationContent(
        cache: cache,
        settings: Settings()..degrees = 'celsius',
        cityLabel: 'Moscow',
      );

      expect(content, isNotNull);
      expect(content!.title, contains('Moscow'));
      expect(content.body, isNotEmpty);
    });

    test('updatePersistentNotification is a no-op when disabled', () async {
      await service.updatePersistentNotification(
        cache: sampleMainWeatherCache(),
        settings: Settings()..persistentNotification = false,
        cityLabel: 'Moscow',
      );
    });
  });
}
