import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/widgets/button.dart';

void main() {
  group('MyTextButton', () {
    testWidgets('renders filled button text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MyTextButton(text: 'Continue', onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('renders outlined button with icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MyTextButton(
              text: 'Cancel',
              icon: IconsaxPlusLinear.close_circle,
              isOutlined: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Cancel'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.byIcon(IconsaxPlusLinear.close_circle), findsOneWidget);
    });

    testWidgets('invokes callback on tap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MyTextButton(text: 'Tap me', onPressed: () => tapped = true),
          ),
        ),
      );

      await tester.tap(find.text('Tap me'));
      await tester.pump();
      expect(tapped, isTrue);
    });
  });
}
