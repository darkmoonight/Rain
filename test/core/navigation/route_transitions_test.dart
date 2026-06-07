import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/navigation/route_transitions.dart';

void main() {
  testWidgets('slideRoute builds SlideTransition', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: (_) => slideRoute(
          child: const Scaffold(body: Text('Page')),
          begin: const Offset(1, 0),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(SlideTransition), findsOneWidget);
    expect(find.text('Page'), findsOneWidget);
  });
}
