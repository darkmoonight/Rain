import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/notification_weekdays.dart';

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

    test('re-enabling last disabled weekday stores null (all days)', () {
      const monToSat = 63;
      final weekdays = notificationWeekdaysFromMask(monToSat)
        ..add(DateTime.sunday);
      expect(notificationWeekdaysMaskFromSet(weekdays), isNull);
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
}
