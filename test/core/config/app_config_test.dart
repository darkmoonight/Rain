import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/config/app_config.dart';

void main() {
  group('appLanguages', () {
    test('contains English and Russian entries', () {
      final codes = appLanguages.map((l) => l.locale.languageCode).toSet();
      expect(codes, contains('en'));
      expect(codes, contains('ru'));
    });

    test('each entry has a non-empty display name', () {
      for (final lang in appLanguages) {
        expect(lang.name, isNotEmpty);
      }
    });
  });

  group('defaultLanguageOption', () {
    test('prefers English locale', () {
      expect(defaultLanguageOption.locale.languageCode, 'en');
    });
  });

  group('appGroupId', () {
    test('is defined for widget sharing', () {
      expect(appGroupId, isNotEmpty);
    });
  });
}
