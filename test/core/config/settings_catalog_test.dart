import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/config/settings_catalog.dart';
import 'package:rain/i18n/strings.g.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.enUs));

  group('SettingsCatalog', () {
    test('resolve returns default for unknown ids', () {
      expect(SettingsCatalog.resolve(null, const ['a', 'b'], 'a'), 'a');
      expect(SettingsCatalog.resolve('missing', const ['a', 'b'], 'a'), 'a');
      expect(SettingsCatalog.resolve('b', const ['a', 'b'], 'a'), 'b');
    });

    test('labelKey builds slang keys from prefix and id', () {
      expect(SettingsCatalog.labelKey('font', 'ubuntu'), 'fontUbuntu');
      expect(
        SettingsCatalog.labelKey('font', 'ibmPlexSans'),
        'fontIbmPlexSans',
      );
      expect(
        SettingsCatalog.labelKey('weatherIcon', 'classic'),
        'weatherIconClassic',
      );
    });
  });
}
