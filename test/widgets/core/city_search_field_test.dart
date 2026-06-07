import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/widgets/city_search_field.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
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
}
