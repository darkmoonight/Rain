import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/navigation_helper.dart';

void main() {
  group('NavigationHelper', () {
    testWidgets('showAppDialog presents child widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => NavigationHelper.showAppDialog(
                context: context,
                child: const AlertDialog(content: Text('Dialog body')),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Dialog body'), findsOneWidget);
    });
  });
}
