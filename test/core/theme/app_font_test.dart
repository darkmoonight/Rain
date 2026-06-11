import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rain/core/theme/app_font.dart';
import 'package:rain/i18n/strings.g.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.enUs));

  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  test('resolve falls back to ubuntu for unknown ids', () {
    expect(AppFont.resolve(null), AppFont.ubuntu);
    expect(AppFont.resolve('unknown'), AppFont.ubuntu);
  });

  test('textTheme keeps base theme for system font', () {
    const base = TextTheme(bodyLarge: TextStyle(fontSize: 16));
    final themed = AppFont.textTheme(AppFont.system, base);
    expect(themed.bodyLarge?.fontSize, 16);
    expect(themed.bodyLarge?.fontFamily, isNull);
  });

  test('choices include ubuntu system and condensed option', () {
    expect(AppFont.choices, contains(AppFont.system));
    expect(AppFont.choices, contains(AppFont.barlowCondensed));
  });
}
