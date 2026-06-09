import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/widgets/shimmer.dart';

void main() {
  group('MyShimmer', () {
    testWidgets('renders card with configured height', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: MyShimmer(height: 120))),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(MyShimmer),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(sizedBox.height, 120);
    });
  });
}
