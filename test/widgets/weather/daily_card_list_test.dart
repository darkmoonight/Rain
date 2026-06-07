import 'package:flutter/material.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_list.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  testWidgets('DailyCardList renders daily rows', (tester) async {
    await pumpRainWidget(
      tester,
      DailyCardList(weatherData: weeklyWeatherCard()),
      bootstrap: ctx.bootstrap,
    );
    await tester.pump();

    expect(find.byType(DailyCardList), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
