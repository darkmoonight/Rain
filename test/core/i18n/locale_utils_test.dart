import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

  group('appLocaleFromLanguageCode', () {
    test('parses stored language codes', () {
      expect(appLocaleFromLanguageCode('en_US'), AppLocale.enUs);
      expect(appLocaleFromLanguageCode('ru_RU'), AppLocale.ruRu);
      expect(appLocaleFromLanguageCode(null), AppLocale.enUs);
      expect(appLocaleFromLanguageCode(''), AppLocale.enUs);
    });
  });

  group('appLocaleFromFlutterLocale', () {
    test('maps Flutter locales to app locales', () {
      expect(
        appLocaleFromFlutterLocale(const Locale('en', 'US')),
        AppLocale.enUs,
      );
      expect(appLocaleFromFlutterLocale(const Locale('de')), AppLocale.deDe);
    });
  });

  group('languageCodeFromAppLocale', () {
    test('serializes with country or language only', () {
      expect(languageCodeFromAppLocale(AppLocale.enUs), 'en_US');
      expect(languageCodeFromAppLocale(AppLocale.deDe), 'de_DE');
    });
  });
}
