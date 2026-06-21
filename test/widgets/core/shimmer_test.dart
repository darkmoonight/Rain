import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

    testWidgets('uses contrasting gradient on AMOLED black scaffold', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            colorScheme: const ColorScheme.dark(
              surface: Colors.black,
              onSurface: Colors.white,
            ),
          ),
          home: Builder(
            builder: (context) {
              final (base, highlight) = MyShimmer.shimmerGradientColors(
                context,
              );
              expect(base, isNot(equals(highlight)));
              expect(base.a, closeTo(0.14, 0.01));
              expect(highlight.a, closeTo(0.35, 0.01));
              return const Scaffold(
                backgroundColor: Colors.black,
                body: MyShimmer(height: 80),
              );
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
