import 'package:flutter_test/flutter_test.dart';

import '../../tool/validate_i18n.dart';

void main() {
  test('validate_i18n passes for project locales', () {
    expect(runValidateI18n(), 0);
  });

  test('validate_i18n --fail-on-english passes for project locales', () {
    expect(runValidateI18n(failOnEnglish: true), 0);
  });

  test('isAllowedEnglishI18nKey covers font and unit keys', () {
    expect(isAllowedEnglishI18nKey('fontInter'), isTrue);
    expect(isAllowedEnglishI18nKey('kph'), isTrue);
    expect(isAllowedEnglishI18nKey('colorPaletteOrange'), isTrue);
    expect(isAllowedEnglishI18nKey('degrees'), isFalse);
  });
}
