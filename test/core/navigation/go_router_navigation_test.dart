import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/navigation/app_router.dart';

void main() {
  group('GoRouterNavigation', () {
    testWidgets('pushRouteUp opens page from bottom', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () =>
                  context.pushRouteUp(const Scaffold(body: Text('Sheet page'))),
              child: const Text('Up'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Up'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Sheet page'), findsOneWidget);
    });
  });
}
