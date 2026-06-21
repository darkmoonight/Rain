import '../helpers/fake_notifiers.dart';
import '../helpers/test_bootstrap.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/widgets/shimmer.dart';
import 'package:rain/features/weather/application/main_weather_notifier.dart';
import 'package:rain/features/weather/presentation/main_weather_screen.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('MainWeatherScreen', () {
    testWidgets('shows weather detail when cache is loaded', (tester) async {
      await pumpRainWidget(
        tester,
        const MainWeatherScreen(),
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            LoadedMainWeatherNotifier.new,
          ),
        ],
      );
      await tester.pump();

      expect(find.byType(WeatherDetailView), findsOneWidget);
    });

    testWidgets('shows empty state without forecast data', (tester) async {
      await pumpRainWidget(
        tester,
        const MainWeatherScreen(),
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            EmptyMainWeatherNotifier.new,
          ),
        ],
      );
      await tester.pump();

      expect(find.byIcon(Icons.cloud_off_outlined), findsOneWidget);
    });

    testWidgets('shows shimmer while loading', (tester) async {
      await pumpRainWidget(
        tester,
        const MainWeatherScreen(),
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            LoadingMainWeatherNotifier.new,
          ),
        ],
      );
      await tester.pump();

      expect(find.byType(MainWeatherLoadingShimmer), findsOneWidget);
    });
  });
}
