import 'dart:io';

import '../../helpers/fixtures.dart';
import '../../helpers/test_helpers.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/services/notification_reschedule_guard.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/domain/entities/entities.dart';

/// Tracks [cancelScheduled] while exercising real reschedule/ensure logic.
class _CancelTrackingNotificationService extends NotificationService {
  _CancelTrackingNotificationService() : super(AssetCacheService());

  int cancelScheduledCalls = 0;

  @override
  Future<void> cancelScheduled() async {
    cancelScheduledCalls++;
  }
}

AppSettings _notificationsEnabled({int? weekdaysMask}) =>
    DomainMapper.settingsToDomain(
      Settings()
        ..notifications = true
        ..notificationWeekdaysMask = weekdaysMask,
    );

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await initTestEnvironment();
  });

  group('NotificationService', () {
    late _CancelTrackingNotificationService service;
    late Directory tempDir;
    late File guardFile;

    setUp(() async {
      service = _CancelTrackingNotificationService();
      tempDir = await Directory.systemTemp.createTemp('rain_notif_test');
      guardFile = File('${tempDir.path}/forecast_reschedule_guard.txt');
      // Isolate replenish cooldown so ensure tests are not skipped after reschedule.
      setForecastRescheduleGuardTestDependencies(
        guardFileFactory: () async => guardFile,
      );
    });

    tearDown(() async {
      resetForecastRescheduleGuardTestDependencies();
      if (await tempDir.exists()) {
        await tempDir.delete(recursive: true);
      }
    });

    test(
      'rescheduleForWeather skips when notifications are disabled',
      () async {
        await service.rescheduleForWeather(
          cache: sampleWeatherForecast(),
          settings: DomainMapper.settingsToDomain(
            Settings()..notifications = false,
          ),
          appSettings: const AppSettingsState(),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 0);
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
      'forecastNotificationIdsToCancel keeps plan ids and skips persistent',
      () {
        const persistent = NotificationService.persistentNotificationId;
        final toCancel = NotificationService.forecastNotificationIdsToCancel(
          candidateIds: [persistent, 10, 20, 30],
          keepIds: {20},
        );

        expect(toCancel, {10, 30});
        expect(toCancel.contains(persistent), isFalse);
        expect(toCancel.contains(20), isFalse);
      },
    );

    test(
      'rescheduleForWeather does not cancel when cache lacks notification data',
      () async {
        await service.rescheduleForWeather(
          cache: const WeatherForecast(),
          settings: _notificationsEnabled(),
          appSettings: const AppSettingsState(),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 0);
      },
    );

    test(
      'rescheduleForWeather cancels when valid cache has no matching slots',
      () async {
        await service.rescheduleForWeather(
          cache: sampleFutureWeatherForecast(),
          settings: _notificationsEnabled(weekdaysMask: 0),
          appSettings: const AppSettingsState(
            timeStart: '00:00',
            timeEnd: '23:59',
          ),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 1);
      },
    );

    test(
      'rescheduleForWeather cancels before scheduling when slots exist',
      () async {
        await service.rescheduleForWeather(
          cache: sampleFutureWeatherForecast(),
          settings: _notificationsEnabled(),
          appSettings: const AppSettingsState(
            timeStart: '00:00',
            timeEnd: '23:59',
          ),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 1);
      },
    );

    test(
      'ensureForecastNotificationsScheduled cancels when plan is empty',
      () async {
        await service.ensureForecastNotificationsScheduled(
          cache: sampleFutureWeatherForecast(),
          settings: _notificationsEnabled(weekdaysMask: 0),
          appSettings: const AppSettingsState(
            timeStart: '00:00',
            timeEnd: '23:59',
          ),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 1);
      },
    );

    test(
      'ensureForecastNotificationsScheduled skips cancel when cache invalid',
      () async {
        await service.ensureForecastNotificationsScheduled(
          cache: const WeatherForecast(),
          settings: _notificationsEnabled(),
          appSettings: const AppSettingsState(),
          cityLabel: 'Moscow',
        );

        expect(service.cancelScheduledCalls, 0);
      },
    );

    test('buildPersistentNotificationContent uses current hour', () {
      final cache = sampleWeatherForecast();
      final content = buildPersistentNotificationContent(
        cache: cache,
        settings: DomainMapper.settingsToDomain(
          Settings()..degrees = 'celsius',
        ),
        cityLabel: 'Moscow',
      );

      expect(content, isNotNull);
      expect(content!.title, contains('Moscow'));
      expect(content.body, isNotEmpty);
    });

    test('updatePersistentNotification is a no-op when disabled', () async {
      await service.updatePersistentNotification(
        cache: sampleWeatherForecast(),
        settings: DomainMapper.settingsToDomain(
          Settings()..persistentNotification = false,
        ),
        cityLabel: 'Moscow',
      );
    });
  });
}
