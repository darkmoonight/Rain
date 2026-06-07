import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/widgets/async_state_views.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

  group('LoadingStateView', () {
    testWidgets('shows progress indicator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LoadingStateView())),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('ErrorRetryStateView', () {
    testWidgets('shows message and retry button', (tester) async {
      var retried = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorRetryStateView(
              message: 'Something failed',
              onRetry: () => retried = true,
            ),
          ),
        ),
      );

      expect(find.text('Something failed'), findsOneWidget);
      await tester.tap(find.byType(FilledButton));
      await tester.pump();
      expect(retried, isTrue);
    });
  });

  group('EmptyMessageStateView', () {
    testWidgets('shows message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmptyMessageStateView(
              message: 'No cities yet',
              imageAsset: 'assets/icons/City.png',
            ),
          ),
        ),
      );

      expect(find.text('No cities yet'), findsOneWidget);
    });
  });
}
