import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/onboarding/presentation/onboarding_screen.dart';

void main() {
  group('DotIndicator', () {
    testWidgets('active dot is wider than inactive', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(
          body: Row(children: [DotIndicator(isActive: true), DotIndicator()]),
        ),
      );

      final activeDot = find.byType(AnimatedContainer).at(0);
      final inactiveDot = find.byType(AnimatedContainer).at(1);

      expect(
        tester.getSize(activeDot).width,
        greaterThan(tester.getSize(inactiveDot).width),
      );
    });

    testWidgets('completed dot uses primary container color', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: DotIndicator(isCompleted: true)),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final theme = Theme.of(tester.element(find.byType(Scaffold)));

      expect(
        (container.decoration! as BoxDecoration).color,
        theme.colorScheme.primaryContainer,
      );
    });
  });

  group('OnboardingContent', () {
    testWidgets('renders slide title and description', (tester) async {
      final slide = OnboardingConstants.getData().first;

      await pumpRainWidget(
        tester,
        Scaffold(body: OnboardingContent(data: slide)),
      );

      expect(find.text(slide.title), findsOneWidget);
      expect(find.text(slide.description), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
