import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/settings/presentation/widgets/notification_weekdays_summary.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async {
    await initTestEnvironment();
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
