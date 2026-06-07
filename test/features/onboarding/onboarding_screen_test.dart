import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/data/models/db.dart';
import '../../helpers/fixtures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/features/geolocation/presentation/geolocation_screen.dart';
import 'package:rain/features/onboarding/presentation/onboarding_screen.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap(
      settings: onboardedSettings()..onboard = false,
      locationCache: LocationCache(),
    );
  });

  group('OnBoarding', () {
    testWidgets('renders carousel with three slides', (tester) async {
      await pumpRainWidget(
        tester,
        const OnBoarding(),
        bootstrap: ctx.bootstrap,
      );
      await tester.pump();

      expect(find.byType(OnBoarding), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('advances to next slide on primary button tap', (tester) async {
      final slides = OnboardingConstants.getData();

      await pumpRainWidget(
        tester,
        const OnBoarding(),
        bootstrap: ctx.bootstrap,
      );
      await tester.pump();

      expect(find.text(slides.first.title), findsOneWidget);

      await tester.tap(find.byType(FilledButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text(slides[1].title), findsOneWidget);
    });

    testWidgets('skip marks onboarding complete and opens geolocation', (
      tester,
    ) async {
      final router = GoRouter(
        initialLocation: AppRoutes.onboarding,
        routes: [
          GoRoute(
            path: AppRoutes.onboarding,
            builder: (context, state) => const OnBoarding(),
          ),
          GoRoute(
            path: AppRoutes.geolocation,
            builder: (context, state) {
              final isStart = state.uri.queryParameters['start'] == 'true';
              return SelectGeolocation(isStart: isStart);
            },
          ),
        ],
      );

      await pumpRainRouter(tester, bootstrap: ctx.bootstrap, router: router);
      await tester.pump();

      await tester.tap(find.text('Skip'));
      await tester.pump();
      await tester.pumpAndSettle();

      expect(ctx.bootstrap.settings.onboard, isTrue);
    });
  });
}
