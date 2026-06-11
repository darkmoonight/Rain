import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/widgets/collapsible_section.dart';

void main() {
  testWidgets('CollapsibleSection hides child while collapsed', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CollapsibleSection(
            title: const Text('Section title'),
            child: const Text('Section content'),
          ),
        ),
      ),
    );

    expect(find.text('Section content'), findsNothing);

    await tester.tap(find.text('Section title'));
    await tester.pumpAndSettle();

    expect(find.text('Section content'), findsOneWidget);
  });

  testWidgets('CollapsibleSection removes child after collapse animation', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CollapsibleSection(
            title: const Text('Section title'),
            initiallyExpanded: true,
            child: const Text('Section content'),
          ),
        ),
      ),
    );

    expect(find.text('Section content'), findsOneWidget);

    await tester.tap(find.text('Section title'));
    await tester.pumpAndSettle();

    expect(find.text('Section content'), findsNothing);
  });

  testWidgets('CollapsibleSection toggles expand chevron', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CollapsibleSection(
            title: const Text('Section title'),
            child: const Text('Section content'),
          ),
        ),
      ),
    );

    final collapsedChevron = tester.widget<AnimatedRotation>(
      find.byType(AnimatedRotation),
    );
    expect(collapsedChevron.turns, 0);

    await tester.tap(find.text('Section title'));
    await tester.pumpAndSettle();

    final expandedChevron = tester.widget<AnimatedRotation>(
      find.byType(AnimatedRotation),
    );
    expect(expandedChevron.turns, 0.5);
  });
}
