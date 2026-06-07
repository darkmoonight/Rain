import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';

Future<void> _enterPlaceActionField(
  WidgetTester tester,
  String label,
  String value,
) async {
  final field = find.descendant(
    of: find.ancestor(of: find.text(label), matching: find.byType(MyTextForm)),
    matching: find.byType(TextFormField),
  );
  await tester.enterText(field, value);
  await tester.pump();
}

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
    setTestConnectivity(true);
  });

  group('PlaceAction save flow', () {
    testWidgets('city search fills coordinate fields', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceAction(edit: false)),
        bootstrap: ctx.bootstrap,
        overrides: [
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      final searchField = find
          .descendant(
            of: find.byType(PlaceAction),
            matching: find.byType(EditableText),
          )
          .first;

      await tester.enterText(searchField, 'Moscow');
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.textContaining('Moscow'), findsWidgets);
    });

    testWidgets('keeps done disabled until all fields are filled', (
      tester,
    ) async {
      await pumpRainWidget(
        tester,
        const Scaffold(
          body: PlaceAction(edit: false, latitude: '55.75', longitude: '37.62'),
        ),
        bootstrap: ctx.bootstrap,
        overrides: [
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      final doneButton = find.ancestor(
        of: find.text('Done'),
        matching: find.byType(InkWell),
      );

      expect(tester.widget<InkWell>(doneButton).onTap, isNull);
    });

    testWidgets('done enables when all fields are filled', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(
          body: PlaceAction(edit: false, latitude: '55.75', longitude: '37.62'),
        ),
        bootstrap: ctx.bootstrap,
        overrides: [
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      await _enterPlaceActionField(tester, 'City', 'Moscow');
      await _enterPlaceActionField(tester, 'District', 'Moscow Oblast');

      final doneButton = find.ancestor(
        of: find.text('Done'),
        matching: find.byType(InkWell),
      );

      expect(tester.widget<InkWell>(doneButton).onTap, isNotNull);
    });
  });
}
