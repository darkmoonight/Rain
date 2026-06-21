import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/core/widgets/city_search_field.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('citySearchResultLabel', () {
    test('formats name and admin region', () {
      const result = CitySearchResult(
        name: 'Paris',
        admin1: 'Île-de-France',
        latitude: 48.85,
        longitude: 2.35,
      );

      expect(citySearchResultLabel(result), 'Paris, Île-de-France');
    });
  });

  testWidgets('CitySearchField renders search field', (tester) async {
    await pumpRainWidget(
      tester,
      CitySearchField(onSelected: (_) {}, labelText: 'Search city'),
      bootstrap: ctx.bootstrap,
      overrides: [
        weatherRemoteDatasourceProvider.overrideWithValue(
          createFakeWeatherRemoteDatasource(),
        ),
      ],
    );

    expect(find.text('Search city'), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('CitySearchAutocomplete shows no options for empty query', (
    tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await pumpRainWidget(
      tester,
      Scaffold(
        body: CitySearchAutocomplete(
          controller: controller,
          focusNode: focusNode,
          onSelected: (_) {},
        ),
      ),
      bootstrap: ctx.bootstrap,
      overrides: [
        weatherRemoteDatasourceProvider.overrideWithValue(
          createFakeWeatherRemoteDatasource(),
        ),
      ],
    );

    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('CitySearchAutocomplete shows options when query matches', (
    tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await pumpRainWidget(
      tester,
      Scaffold(
        body: CitySearchAutocomplete(
          controller: controller,
          focusNode: focusNode,
          onSelected: (_) {},
        ),
      ),
      bootstrap: ctx.bootstrap,
      overrides: [
        weatherRemoteDatasourceProvider.overrideWithValue(
          createFakeWeatherRemoteDatasource(),
        ),
      ],
    );

    await tester.enterText(find.byType(TextFormField), 'Mos');
    await tester.pump();
    await tester.pump(AppConstants.debounceDelay);
    await tester.pump();

    expect(find.byType(ListTile), findsWidgets);
  });
}
