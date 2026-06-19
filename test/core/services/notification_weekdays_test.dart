import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/notification_weekdays.dart';
import 'package:rain/features/settings/presentation/widgets/notification_weekdays_summary.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async {
    await initTestEnvironment();
  });

  group('notificationWeekdaysFromMask', () {
    test('null mask enables all days', () {
      expect(notificationWeekdaysFromMask(null), {1, 2, 3, 4, 5, 6, 7});
    });

    test('zero mask disables all days', () {
      expect(notificationWeekdaysFromMask(0), isEmpty);
    });

    test('weekday bitmask enables selected days only', () {
      expect(notificationWeekdaysFromMask(31), {1, 2, 3, 4, 5});
    });

    test('full bitmask enables all days', () {
      expect(notificationWeekdaysFromMask(127), {1, 2, 3, 4, 5, 6, 7});
    });
  });

  group('isNotificationWeekdayEnabled', () {
    test('respects null as every day', () {
      expect(isNotificationWeekdayEnabled(DateTime.monday, null), isTrue);
      expect(isNotificationWeekdayEnabled(DateTime.sunday, null), isTrue);
    });

    test('respects weekday bitmask', () {
      const weekdaysOnly = 31;
      expect(
        isNotificationWeekdayEnabled(DateTime.monday, weekdaysOnly),
        isTrue,
      );
      expect(
        isNotificationWeekdayEnabled(DateTime.saturday, weekdaysOnly),
        isFalse,
      );
    });

    test('returns false when mask is zero', () {
      expect(isNotificationWeekdayEnabled(DateTime.monday, 0), isFalse);
    });
  });

  group('notificationWeekdaysMaskFromSet', () {
    test('stores null when all days are selected', () {
      expect(notificationWeekdaysMaskFromSet({1, 2, 3, 4, 5, 6, 7}), isNull);
    });

    test('stores zero when no days are selected', () {
      expect(notificationWeekdaysMaskFromSet({}), 0);
    });

    test('round-trips partial selection', () {
      const mask = 42; // Tue, Thu, Sat
      final weekdays = notificationWeekdaysFromMask(mask);
      expect(notificationWeekdaysMaskFromSet(weekdays), mask);
    });
  });

  group('notificationWeekdayLabel', () {
    test('formats full and abbreviated weekday names', () {
      expect(notificationWeekdayLabel(DateTime.monday, 'en'), isNotEmpty);
      expect(
        notificationWeekdayLabel(DateTime.monday, 'en', abbrev: true),
        'Mon',
      );
    });
  });

  group('formatNotificationWeekdaysSummary', () {
    test('formats null mask as every day', () {
      expect(
        formatNotificationWeekdaysSummary(mask: null, languageCode: 'en'),
        'Every day',
      );
    });

    test('formats empty mask as none', () {
      expect(
        formatNotificationWeekdaysSummary(mask: 0, languageCode: 'en'),
        'None',
      );
    });

    test('formats full bitmask as every day', () {
      expect(
        formatNotificationWeekdaysSummary(mask: 127, languageCode: 'en'),
        'Every day',
      );
    });

    test('formats single weekday', () {
      expect(
        formatNotificationWeekdaysSummary(mask: 4, languageCode: 'en'),
        'Wed',
      );
    });

    test('formats consecutive weekdays as a range', () {
      expect(
        formatNotificationWeekdaysSummary(mask: 31, languageCode: 'en'),
        'Mon–Fri',
      );
      expect(
        formatNotificationWeekdaysSummary(mask: 63, languageCode: 'en'),
        'Mon–Sat',
      );
    });

    test('formats non-consecutive weekdays as a list', () {
      expect(
        formatNotificationWeekdaysSummary(mask: 42, languageCode: 'en'),
        'Tue, Thu, Sat',
      );
    });
  });
}
