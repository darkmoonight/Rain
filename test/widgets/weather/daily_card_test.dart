import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  testWidgets('DailyCard renders forecast summary row', (tester) async {
    await pumpRainWidget(
      tester,
      DailyCard(
        timeDaily: DateTime(2026, 6, 5),
        weathercodeDaily: 0,
        temperature2MMax: 25.0,
        temperature2MMin: 15.0,
      ),
      bootstrap: ctx.bootstrap,
    );
    await tester.pump();

    expect(find.byType(DailyCard), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
  });

  testWidgets('DailyCard renders empty container without weather code', (
    tester,
  ) async {
    await pumpRainWidget(
      tester,
      DailyCard(
        timeDaily: DateTime(2026, 6, 5),
        weathercodeDaily: null,
        temperature2MMax: 25.0,
        temperature2MMin: 15.0,
      ),
      bootstrap: ctx.bootstrap,
    );
    await tester.pump();

    expect(find.byType(DailyCard), findsOneWidget);
    expect(find.byType(Card), findsNothing);
  });
}
