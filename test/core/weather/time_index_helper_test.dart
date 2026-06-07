import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

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

  group('TimeIndexHelper.resolveTimeIndex', () {
    test('returns 0 for empty input', () {
      expect(TimeIndexHelper.resolveTimeIndex([], 'UTC'), 0);
    });

    test('finds exact hour match in timezone series', () {
      final now = DateTime.now().toUtc();
      final hour = now.hour.toString().padLeft(2, '0');
      final iso =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}T$hour:00';
      final index = TimeIndexHelper.resolveTimeIndex([iso], 'Etc/UTC');
      expect(index, 0);
    });
  });

  group('TimeIndexHelper.resolveDayIndex', () {
    test('returns 0 for empty input', () {
      expect(TimeIndexHelper.resolveDayIndex([], 'Etc/UTC'), 0);
    });

    test('finds today in daily series', () {
      final today = DateTime.now();
      final index = TimeIndexHelper.resolveDayIndex([today], 'Etc/UTC');
      expect(index, 0);
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
  });
}
