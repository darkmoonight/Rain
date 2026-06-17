import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rain/core/config/settings_catalog.dart';
import 'package:rain/core/theme/app_font.dart';
import 'package:rain/i18n/strings.g.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.enUs));

  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  test('resolve falls back to ubuntu for unknown ids', () {
    expect(AppFont.resolve(null), AppFont.ubuntu);
    expect(AppFont.resolve('unknown'), AppFont.ubuntu);
  });

  test('textTheme replaces bundled Roboto for system font', () {
    const base = TextTheme(
      bodyLarge: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
    );
    final themed = AppFont.textTheme(AppFont.system, base);
    expect(themed.bodyLarge?.fontSize, 16);
    expect(themed.bodyLarge?.fontFamily, isNot('Roboto'));
    expect(themed.bodyLarge?.fontFamily, AppFont.platformFontFamily());
  });

  test('platformFontFamily prefers engine-reported family', () {
    expect(
      AppFont.platformFontFamily(engineFamily: 'SamsungOne'),
      'SamsungOne',
    );
  });

  test('catalog ids are unique and resolve to localized labels', () {
    expect(AppFont.choices, contains(AppFont.system));
    expect(AppFont.choices.toSet(), hasLength(AppFont.choices.length));

    for (final id in AppFont.choices) {
      expect(AppFont.resolve(id), id);
      expect(AppFont.label(id), isNotEmpty);
      expect(
        SettingsCatalog.labelKey('font', id),
        startsWith('font'),
      );
    }
  });
}
