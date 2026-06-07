import 'package:flutter/material.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_info.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  testWidgets('DailyCardInfo renders paged daily detail', (tester) async {
    await pumpRainWidget(
      tester,
      DailyCardInfo(weatherData: dailyDetailWeatherCard(), index: 0),
      bootstrap: ctx.bootstrap,
    );
    await tester.pump();

    expect(find.byType(DailyCardInfo), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('back button closes daily detail without error', (tester) async {
    await pumpRainRouter(
      tester,
      bootstrap: ctx.bootstrap,
      router: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => NavigationHelper.toDownToUp(
                    context,
                    () => DailyCardInfo(
                      weatherData: dailyDetailWeatherCard(),
                      index: 0,
                    ),
                  ),
                  child: const Text('Open daily'),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    await tester.tap(find.text('Open daily'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(DailyCardInfo), findsOneWidget);

    await tester.tap(find.byIcon(IconsaxPlusLinear.arrow_left_3));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(tester.takeException(), isNull);
    expect(find.text('Open daily'), findsOneWidget);
  });
}
