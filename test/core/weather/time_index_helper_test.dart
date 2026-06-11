import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

  const moscowClock = LocationClock(
    timezone: 'Europe/Moscow',
    utcOffsetSeconds: 10800,
  );

  group('TimeIndexHelper.parseTime', () {
    test('parses 24h and 12h formats', () {
      expect(
        TimeIndexHelper.parseTime('13:35'),
        const TimeOfDay(hour: 13, minute: 35),
      );
      expect(
        TimeIndexHelper.parseTime('1:05 PM'),
        const TimeOfDay(hour: 13, minute: 5),
      );
      expect(
        TimeIndexHelper.parseTime(null),
        const TimeOfDay(hour: 0, minute: 0),
      );
    });
  });

  group('TimeIndexHelper.timeTo24h', () {
    test('formats padded 24h time', () {
      expect(
        TimeIndexHelper.timeTo24h(const TimeOfDay(hour: 9, minute: 5)),
        '09:05',
      );
    });
  });

  group('TimeIndexHelper.isDaytime', () {
    test('returns true between sunrise and sunset', () {
      expect(
        TimeIndexHelper.isDaytime('2026-06-05T12:00', '06:00', '18:00'),
        isTrue,
      );
      expect(
        TimeIndexHelper.isDaytime('2026-06-05T20:00', '06:00', '18:00'),
        isFalse,
      );
    });
  });

  group('TimeIndexHelper.wallClockNow', () {
    test('applies utc offset and clock skew', () {
      final utc = DateTime.now().toUtc();
      final wall = TimeIndexHelper.wallClockNow(
        const LocationClock(utcOffsetSeconds: 10800, clockSkewSeconds: 3600),
      );
      final expected = utc.add(const Duration(hours: 4));
      expect(wall.hour, expected.hour);
      expect(wall.minute, expected.minute);
    });
  });

  group('TimeIndexHelper.parseCalendarDate', () {
    test('keeps calendar components from API date strings', () {
      final date = TimeIndexHelper.parseCalendarDate('2026-06-10');
      expect(date.year, 2026);
      expect(date.month, 6);
      expect(date.day, 10);
    });
  });

  group('TimeIndexHelper.getTime', () {
    test('returns 0 for empty input', () {
      expect(TimeIndexHelper.getTime([], moscowClock), 0);
    });

    test('finds exact hour match in timezone series', () {
      final now = DateTime.now().toUtc().add(const Duration(hours: 3));
      final hour = now.hour.toString().padLeft(2, '0');
      final iso =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}T$hour:00';
      final index = TimeIndexHelper.getTime([iso], moscowClock);
      expect(index, 0);
    });
  });

  group('TimeIndexHelper.getDay', () {
    test('returns 0 for empty input', () {
      expect(TimeIndexHelper.getDay([], moscowClock), 0);
    });

    test('finds today in daily series', () {
      final wall = TimeIndexHelper.wallClockNow(moscowClock);
      final today = DateTime(wall.year, wall.month, wall.day);
      final index = TimeIndexHelper.getDay([today], moscowClock);
      expect(index, 0);
    });
  });

  group('TimeIndexHelper.parseForecastDate', () {
    test('keeps calendar components from hourly ISO strings', () {
      final date = TimeIndexHelper.parseForecastDate('2026-06-10T14:00');
      expect(date.year, 2026);
      expect(date.month, 6);
      expect(date.day, 10);
    });
  });

  group('TimeIndexHelper clock formatting', () {
    test('detects 12h preference from settings', () {
      expect(
        TimeIndexHelper.is12HourFormat(Settings()..timeformat = '12'),
        isTrue,
      );
      expect(
        TimeIndexHelper.is12HourFormat(Settings()..timeformat = '24'),
        isFalse,
      );
    });

    test('formatTime respects 24h settings', () {
      final settings = Settings()..timeformat = '24';
      expect(TimeIndexHelper.formatTime('13:35', settings, 'en'), '13:35');
    });

    test('formatUpdatedAt formats date and time', () {
      final settings = Settings()..timeformat = '24';
      final formatted = TimeIndexHelper.formatUpdatedAt(
        DateTime(2026, 6, 9, 14, 30),
        settings,
        'en',
      );
      expect(formatted, contains('Jun'));
      expect(formatted, contains('14:30'));
    });
  });
}
