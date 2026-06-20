import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rain/core/theme/color_palette.dart';
import 'package:rain/core/theme/theme.dart';

void main() {
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('lightTheme', () {
    testWidgets('builds inside widget tree', (tester) async {
      await tester.pumpWidget(
        MaterialApp(theme: lightTheme(null, null, false)),
      );

      final theme = tester.widget<MaterialApp>(find.byType(MaterialApp)).theme!;
      expect(theme.useMaterial3, isTrue);
      expect(theme.brightness, Brightness.light);
      expect(theme.splashFactory, NoSplash.splashFactory);
      expect(theme.splashColor, Colors.transparent);
      expect(theme.highlightColor, Colors.transparent);
    });
  });

  group('darkTheme', () {
    testWidgets('builds inside widget tree', (tester) async {
      await tester.pumpWidget(MaterialApp(theme: darkTheme(null, null, false)));

      final theme = tester.widget<MaterialApp>(find.byType(MaterialApp)).theme!;
      expect(theme.useMaterial3, isTrue);
      expect(theme.brightness, Brightness.dark);
      expect(theme.splashFactory, NoSplash.splashFactory);
    });
  });

  group('resolveAppThemes', () {
    test('palette mode uses Material You tonal surfaces', () {
      final paletteLight = AppColorPalette.of('purple').lightScheme();
      final paletteDark = AppColorPalette.of('purple').darkScheme();
      final themes = resolveAppThemes(
        materialColor: false,
        amoledTheme: false,
        colorPalette: AppColorPalette.defaultId,
        lightDynamic: null,
        darkDynamic: null,
        edgeToEdgeAvailable: false,
        appFont: 'ubuntu',
      );

      expect(themes.light.scaffoldBackgroundColor, paletteLight.surface);
      expect(themes.dark.scaffoldBackgroundColor, paletteDark.surface);
      expect(themes.light.scaffoldBackgroundColor, isNot(lightColor));
      expect(themes.dark.scaffoldBackgroundColor, isNot(darkColor));
    });
  });
}
