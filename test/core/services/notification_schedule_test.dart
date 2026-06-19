import '../../helpers/fixtures.dart';
import '../../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(() async {
    await initTestEnvironment();
    tz_data.initializeTimeZones();
  });

  group('isHourInNotificationWindow', () {
    test('includes hours inside a same-day window', () {
      expect(isHourInNotificationWindow(12, 8, 20), isTrue);
      expect(isHourInNotificationWindow(7, 8, 20), isFalse);
      expect(isHourInNotificationWindow(21, 8, 20), isFalse);
    });

    test('includes hours inside an overnight window', () {
      expect(isHourInNotificationWindow(23, 22, 8), isTrue);
      expect(isHourInNotificationWindow(1, 22, 8), isTrue);
      expect(isHourInNotificationWindow(12, 22, 8), isFalse);
    });
  });

  group('isForecastNotificationInFuture', () {
    test('matches zoned scheduling, not naive device comparison', () {
      const timezone = 'Europe/Moscow';
      const offset = 10800;
      final referenceNowMillis = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 15, 30),
        timezone,
        utcOffsetSeconds: offset,
      );

      expect(
        isForecastNotificationInFuture(
          DateTime(2026, 6, 17, 15, 0),
          timezone,
          utcOffsetSeconds: offset,
          referenceNowMillis: referenceNowMillis,
        ),
        isFalse,
      );
      expect(
        isForecastNotificationInFuture(
          DateTime(2026, 6, 17, 16, 0),
          timezone,
          utcOffsetSeconds: offset,
          referenceNowMillis: referenceNowMillis,
        ),
        isTrue,
      );
    });

    test('keeps 19:00 slot in the future at 17:00 location wall clock', () {
      const timezone = 'Europe/Moscow';
      const offset = 10800;
      final referenceNowMillis = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 17, 0),
        timezone,
        utcOffsetSeconds: offset,
      );
      final wrongZoneMillis = tz.TZDateTime(
        tz.getLocation('Asia/Yekaterinburg'),
        2026,
        6,
        17,
        19,
        0,
      ).millisecondsSinceEpoch;

      expect(
        isForecastNotificationInFuture(
          DateTime(2026, 6, 17, 19, 0),
          timezone,
          utcOffsetSeconds: offset,
          referenceNowMillis: referenceNowMillis,
        ),
        isTrue,
      );
      expect(
        wrongZoneMillis <= referenceNowMillis,
        isTrue,
        reason: 'wrong IANA zone would fire 19:00 two hours early at 17:00',
      );
    });

    test('excludes slots that naive wall clock would still include', () {
      const timezone = 'Europe/Moscow';
      const offset = 10800;
      final referenceNowMillis = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 15, 30),
        timezone,
        utcOffsetSeconds: offset,
      );

      expect(
        DateTime(2026, 6, 17, 15, 0).isAfter(DateTime(2026, 6, 17, 14, 40)),
        isTrue,
      );
      expect(
        isForecastNotificationInFuture(
          DateTime(2026, 6, 17, 15, 0),
          timezone,
          utcOffsetSeconds: offset,
          referenceNowMillis: referenceNowMillis,
        ),
        isFalse,
      );
    });
  });

  group('buildWeatherNotificationSlots', () {
    test('returns empty list when cache has no hourly data', () {
      final slots = buildWeatherNotificationSlots(
        cache: MainWeatherCache(),
        settings: Settings(),
        appSettings: const AppSettingsState(),
        cityLabel: 'Moscow',
      );

      expect(slots, isEmpty);
    });

    test('skips notifications outside configured time window', () {
      final cache = sampleMainWeatherCache();
      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '23:00',
          timeEnd: '23:30',
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 12),
      );

      expect(slots, isEmpty);
    });

    test('builds slots for future hours inside time window', () {
      final cache = sampleMainWeatherCache();
      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 11),
      );

      expect(slots, isNotEmpty);
      expect(slots.first.title, contains('Moscow'));
    });

    test('creates one slot per hour when multiple daily rows match', () {
      final cache = sampleMainWeatherCache()
        ..timeDaily = [DateTime(2026, 6, 5), DateTime(2026, 6, 5)]
        ..sunrise = ['06:00', '06:01']
        ..sunset = ['18:00', '18:01'];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 11),
      );

      expect(slots.where((slot) => slot.time.hour == 13).length, 1);
    });

    test('builds slots for the next calendar day', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-05T18:00', '2026-06-06T08:00', '2026-06-06T09:00']
        ..temperature2M = [20.0, 19.0, 20.0]
        ..weathercode = [0, 1, 0];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '08:00',
          timeEnd: '20:00',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 18),
      );

      expect(slots.any((slot) => slot.time.day == 6), isTrue);
    });

    test('includes hours at the end of the notification window', () {
      final cache = sampleMainWeatherCache()..time = ['2026-06-05T20:00'];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '08:00',
          timeEnd: '20:00',
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 12),
      );

      expect(slots, hasLength(1));
      expect(slots.first.time.hour, 20);
    });

    test('includes upcoming hourly slots when cache uses utc offset', () {
      final cache = sampleMainWeatherCache()
        ..time = [
          '2026-06-17T15:00',
          '2026-06-17T16:00',
          '2026-06-17T17:00',
          '2026-06-17T18:00',
        ]
        ..timeDaily = [DateTime(2026, 6, 17)]
        ..sunrise = ['06:00']
        ..sunset = ['18:00']
        ..temperature2M = [20.0, 21.0, 22.0, 23.0]
        ..weathercode = [0, 1, 2, 3];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 17, 14, 40),
      );

      expect(slots.map((s) => s.time.hour), [15, 16, 17, 18]);
    });

    test('skips past hours when rescheduling at 16:00', () {
      final cache = sampleMainWeatherCache()
        ..time = [
          '2026-06-17T12:00',
          '2026-06-17T13:00',
          '2026-06-17T15:00',
          '2026-06-17T16:00',
          '2026-06-17T17:00',
        ]
        ..timeDaily = [DateTime(2026, 6, 17)]
        ..sunrise = ['06:00']
        ..sunset = ['18:00']
        ..temperature2M = [26.5, 26.0, 25.3, 26.5, 27.0]
        ..weathercode = [1, 0, 3, 3, 3];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '08:00',
          timeEnd: '20:00',
          timeRange: 1,
        ),
        cityLabel: 'Rostov-on-Don',
        now: DateTime(2026, 6, 17, 16, 5),
      );

      expect(slots.map((slot) => slot.time.hour), [17]);
    });

    test('skips the current hour when enabling notifications mid-hour', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-17T17:00', '2026-06-17T18:00', '2026-06-17T19:00']
        ..timeDaily = [DateTime(2026, 6, 17)]
        ..sunrise = ['06:00']
        ..sunset = ['18:00']
        ..temperature2M = [24.0, 24.5, 25.0]
        ..weathercode = [3, 3, 3];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Rostov-on-Don',
        now: DateTime(2026, 6, 17, 17, 15),
      );

      expect(slots.map((slot) => slot.time.hour), [18, 19]);
    });

    test('skips the current hour when enabling at 21:25', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-17T21:00', '2026-06-17T22:00']
        ..timeDaily = [DateTime(2026, 6, 17)]
        ..sunrise = ['06:00']
        ..sunset = ['21:00']
        ..temperature2M = [21.0, 20.5]
        ..weathercode = [3, 3];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Ростов-на-Дону',
        now: DateTime(2026, 6, 17, 21, 25),
      );

      expect(slots.map((slot) => slot.time.hour), [22]);
    });

    test('supports overnight notification windows', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-05T23:00', '2026-06-06T01:00'];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '22:00',
          timeEnd: '08:00',
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 12),
      );

      expect(slots.map((slot) => slot.time.hour), containsAll([23, 1]));
    });

    test('skips slots on disabled weekdays', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-17T12:00', '2026-06-18T12:00', '2026-06-19T12:00']
        ..timeDaily = [
          DateTime(2026, 6, 17),
          DateTime(2026, 6, 18),
          DateTime(2026, 6, 19),
        ]
        ..sunrise = ['06:00', '06:00', '06:00']
        ..sunset = ['18:00', '18:00', '18:00']
        ..temperature2M = [20.0, 21.0, 22.0]
        ..weathercode = [0, 1, 2];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings()..notificationWeekdaysMask = 4,
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 17, 10),
      );

      expect(slots, hasLength(1));
      expect(slots.single.time.weekday, DateTime.wednesday);
    });

    test('includes calendar date in body for slots on another day', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-06T13:00']
        ..timeDaily = [DateTime(2026, 6, 5), DateTime(2026, 6, 6)]
        ..sunrise = ['06:00', '06:01']
        ..sunset = ['18:00', '18:01'];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 12),
      );

      expect(slots, hasLength(1));
      expect(slots.first.body, contains('6'));
      expect(slots.first.body, contains('13'));
    });
  });
}
