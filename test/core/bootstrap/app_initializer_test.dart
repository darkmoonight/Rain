import '../../helpers/test_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/bootstrap/app_initializer.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';

void main() {
  setUpAll(initTestEnvironment);

  group('seedDefaultSettings', () {
    test('seeds language and theme when missing', () {
      final settings = Settings();

      final changed = seedDefaultSettings(settings, const Locale('de', 'DE'));

      expect(changed, isTrue);
      expect(settings.language, 'de_DE');
      expect(settings.theme, 'system');
    });

    test('returns false when defaults already exist', () {
      final settings = Settings()
        ..language = 'en_US'
        ..theme = 'dark';

      final changed = seedDefaultSettings(settings, const Locale('de', 'DE'));

      expect(changed, isFalse);
      expect(settings.language, 'en_US');
      expect(settings.theme, 'dark');
    });

    test('applies locale from seeded language code', () async {
      final settings = Settings();
      seedDefaultSettings(settings, const Locale('ru', 'RU'));

      await LocaleSettings.setLocale(
        appLocaleFromLanguageCode(settings.language),
      );

      expect(LocaleSettings.currentLocale, AppLocale.ruRu);
    });
  });

  group('weather cache schema version', () {
    test('defaults to zero before first migration', () {
      expect(Settings().weatherCacheVersion, 0);
      expect(AppConstants.weatherCacheSchemaVersion, 2);
    });
  });
}
