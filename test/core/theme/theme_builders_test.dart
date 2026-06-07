import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
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
    });
  });

  group('darkTheme', () {
    testWidgets('builds inside widget tree', (tester) async {
      await tester.pumpWidget(MaterialApp(theme: darkTheme(null, null, false)));

      final theme = tester.widget<MaterialApp>(find.byType(MaterialApp)).theme!;
      expect(theme.useMaterial3, isTrue);
      expect(theme.brightness, Brightness.dark);
    });
  });
}
