import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rain/core/i18n/locale_format_helper.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async {
    await initTestEnvironment();
    await initializeDateFormatting('ru');
  });

  group('LocaleFormatHelper', () {
    test('weekdayName capitalizes Russian intl output', () {
      expect(
        LocaleFormatHelper.weekdayName(DateTime(2026, 6, 7), 'ru'),
        'Воскресенье',
      );
    });

    test(
      'ensureDateFormatting loads locale data for background isolates',
      () async {
        await LocaleFormatHelper.ensureDateFormatting('en');
        expect(
          LocaleFormatHelper.weekdayName(DateTime(2026, 6, 7), 'en'),
          'Sunday',
        );
      },
    );

    test('fullDateWithWeekday capitalizes leading weekday letter', () {
      final label = LocaleFormatHelper.fullDateWithWeekday(
        DateTime(2026, 6, 7),
        'ru',
      );
      expect(label.startsWith('В'), isTrue);
    });
  });
}
