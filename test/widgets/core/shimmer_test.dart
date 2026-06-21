import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/theme/theme.dart';
import 'package:rain/core/widgets/shimmer.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  group('MyShimmer', () {
    testWidgets('renders visible placeholder with configured height', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: const Scaffold(body: MyShimmer(height: 120)),
        ),
      );

      final size = tester.getSize(find.byType(MyShimmer));
      expect(size.height, 120);
      expect(find.byType(Shimmer), findsOneWidget);
    });

    testWidgets('uses dark theme-matched gradient on AMOLED scaffold', (
      tester,
    ) async {
      final appTheme = darkTheme(oledColor, colorSchemeDark, false);

      await tester.pumpWidget(
        MaterialApp(
          theme: appTheme,
          home: Builder(
            builder: (context) {
              final (base, highlight) = MyShimmer.shimmerGradientColors(
                context,
              );
              expect(base, isNot(equals(highlight)));
              expect(
                highlight.computeLuminance(),
                greaterThan(base.computeLuminance()),
              );
              expect(base.computeLuminance(), lessThan(0.04));
              expect(highlight.computeLuminance(), lessThan(0.08));
              return const Scaffold(body: MyShimmer(height: 80));
            },
          ),
        ),
      );
    });
  });

  group('MainWeatherLoadingShimmer', () {
    testWidgets('wraps skeleton in a single shimmer', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: const Scaffold(body: MainWeatherLoadingShimmer()),
        ),
      );

      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
