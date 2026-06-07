import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

  group('ConfirmationDialog', () {
    testWidgets('shows title, message, and both actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (_) => const ConfirmationDialog(
                    title: 'Delete item',
                    message: 'Are you sure?',
                  ),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Delete item'), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('showConfirmationDialog returns true when confirmed', (
      tester,
    ) async {
      bool? confirmed;

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () async {
                      confirmed = await showConfirmationDialog(
                        context: context,
                        title: 'Confirm action',
                        message: 'Proceed?',
                      );
                    },
                    child: const Text('Open confirm'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Open confirm'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();

      expect(confirmed, isTrue);
    });

    testWidgets('showConfirmationDialog returns false when cancelled', (
      tester,
    ) async {
      bool? confirmed;

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () async {
                      confirmed = await showConfirmationDialog(
                        context: context,
                        title: 'Confirm action',
                        message: 'Proceed?',
                      );
                    },
                    child: const Text('Open confirm'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Open confirm'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(confirmed, isFalse);
    });

    testWidgets('showDeleteConfirmation uses destructive styling', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => showDeleteConfirmation(
                  context: context,
                  title: 'Delete city',
                  message: 'Cannot undo',
                ),
                child: const Text('Delete'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.text('Delete city'), findsOneWidget);
      expect(find.text('Cannot undo'), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('hides cancel button when disabled', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ConfirmationDialog(
            title: 'Confirm',
            message: 'Proceed?',
            showCancelButton: false,
          ),
        ),
      );

      expect(find.byType(TextButton), findsNothing);
      expect(find.byType(FilledButton), findsOneWidget);
    });
  });
}
