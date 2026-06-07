import '../helpers/fake_notifiers.dart';
import '../helpers/fixtures.dart';
import '../helpers/test_bootstrap.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/features/map/presentation/map_screen.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  testWidgets('MapPage renders flutter map scaffold', (tester) async {
    await pumpRainWidget(
      tester,
      const SizedBox(height: 500, width: 500, child: MapPage()),
      bootstrap: ctx.bootstrap,
      overrides: [
        mainWeatherNotifierProvider.overrideWith(LoadedMainWeatherNotifier.new),
        citiesNotifierProvider.overrideWith(IdleCitiesNotifier.new),
        weatherRemoteDatasourceProvider.overrideWithValue(
          createFakeWeatherRemoteDatasource(),
        ),
      ],
    );
    await tester.pump();

    expect(find.byType(MapPage), findsOneWidget);
  });

  testWidgets('builds map with seeded city notifier', (tester) async {
    await pumpRainWidget(
      tester,
      const SizedBox(height: 500, width: 500, child: MapPage()),
      bootstrap: ctx.bootstrap,
      overrides: [
        mainWeatherNotifierProvider.overrideWith(LoadedMainWeatherNotifier.new),
        citiesNotifierProvider.overrideWith(
          () => CitiesWithCardsNotifier([completeWeatherCard()]),
        ),
        weatherRemoteDatasourceProvider.overrideWithValue(
          createFakeWeatherRemoteDatasource(),
        ),
      ],
    );
    await tester.pump();

    expect(find.byType(MapPage), findsOneWidget);
  });

  testWidgets('map markers lay out without rendering exceptions', (
    tester,
  ) async {
    await pumpRainWidget(
      tester,
      const SizedBox(height: 500, width: 500, child: MapPage()),
      bootstrap: ctx.bootstrap,
      overrides: [
        mainWeatherNotifierProvider.overrideWith(LoadedMainWeatherNotifier.new),
        citiesNotifierProvider.overrideWith(
          () => CitiesWithCardsNotifier([completeWeatherCard()]),
        ),
        weatherRemoteDatasourceProvider.overrideWithValue(
          createFakeWeatherRemoteDatasource(),
        ),
      ],
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(tester.takeException(), isNull);
  });
}
