import '../helpers/fake_services.dart';
import '../helpers/fixtures.dart';
import '../helpers/isar_test_helper.dart';
import '../helpers/test_bootstrap.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/features/geolocation/presentation/geolocation_screen.dart';
import 'package:rain/features/weather/application/main_weather_notifier.dart';

Future<void> _enterGeolocationField(
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

List geolocationTestOverrides() => [
  locationServiceProvider.overrideWithValue(FakeLocationService()),
  weatherRemoteDatasourceProvider.overrideWithValue(
    createFakeWeatherRemoteDatasource(),
  ),
  notificationServiceProvider.overrideWithValue(FakeNotificationService()),
  homeWidgetServiceProvider.overrideWithValue(FakeHomeWidgetService()),
  mainWeatherNotifierProvider.overrideWith(
    _GeolocationSubmitMainWeatherNotifier.new,
  ),
];

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
    setTestConnectivity(true);
    await seedMainWeatherCache(ctx.isarContext.isar);
  });

  group('SelectGeolocation', () {
    testWidgets('start flow renders location form', (tester) async {
      await pumpRainWidget(
        tester,
        const SelectGeolocation(isStart: true),
        bootstrap: ctx.bootstrap,
        overrides: [
          locationServiceProvider.overrideWithValue(FakeLocationService()),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      expect(find.byType(SelectGeolocation), findsOneWidget);
    });

    testWidgets('edit flow renders without start flag', (tester) async {
      await pumpRainWidget(
        tester,
        const SelectGeolocation(isStart: false),
        bootstrap: ctx.bootstrap,
        overrides: [
          locationServiceProvider.overrideWithValue(FakeLocationService()),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      expect(find.byType(SelectGeolocation), findsOneWidget);
    });

    testWidgets('shows map and coordinate form fields', (tester) async {
      await pumpRainWidget(
        tester,
        const SelectGeolocation(isStart: true),
        bootstrap: ctx.bootstrap,
        overrides: [
          locationServiceProvider.overrideWithValue(FakeLocationService()),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      expect(find.byType(FlutterMap), findsOneWidget);
      expect(find.byType(MyTextForm), findsNWidgets(5));
    });

    testWidgets('city search shows autocomplete suggestions', (tester) async {
      await pumpRainWidget(
        tester,
        const SelectGeolocation(isStart: true),
        bootstrap: ctx.bootstrap,
        overrides: [
          locationServiceProvider.overrideWithValue(FakeLocationService()),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      final searchField = find
          .descendant(
            of: find.byType(SelectGeolocation),
            matching: find.byType(EditableText),
          )
          .first;

      await tester.enterText(searchField, 'Moscow');
      await tester.pump();
      await tester.pumpAndSettle(const Duration(milliseconds: 100));

      expect(find.textContaining('Moscow'), findsWidgets);
    });

    testWidgets('exposes GPS location button', (tester) async {
      await pumpRainWidget(
        tester,
        const SelectGeolocation(isStart: true),
        bootstrap: ctx.bootstrap,
        overrides: [
          locationServiceProvider.overrideWithValue(FakeLocationService()),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(SelectGeolocation),
          matching: find.byType(IconButton),
        ),
        findsWidgets,
      );
    });

    testWidgets('filled location form has no validation errors', (
      tester,
    ) async {
      await pumpRainWidget(
        tester,
        const SelectGeolocation(isStart: true),
        bootstrap: ctx.bootstrap,
        overrides: [
          locationServiceProvider.overrideWithValue(FakeLocationService()),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      await _enterGeolocationField(tester, 'Latitude', '55.75');
      await _enterGeolocationField(tester, 'Longitude', '37.62');
      await _enterGeolocationField(tester, 'City', 'Moscow');
      await _enterGeolocationField(tester, 'District', 'Moscow Oblast');

      await tester.tap(find.text('Done'));
      await tester.pump();

      expect(tester.takeException(), isNull);
      expect(find.text('Please enter a value'), findsNothing);
      expect(find.text('Please enter the name'), findsNothing);
    });

    testWidgets('start flow submit navigates to home', (tester) async {
      final router = GoRouter(
        initialLocation: AppRoutes.geolocationStart,
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) =>
                const Scaffold(body: Text('home-landing')),
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

      await pumpRainRouter(
        tester,
        bootstrap: ctx.bootstrap,
        router: router,
        overrides: geolocationTestOverrides(),
      );
      await tester.pump();

      await _enterGeolocationField(tester, 'Latitude', '55.75');
      await _enterGeolocationField(tester, 'Longitude', '37.62');
      await _enterGeolocationField(tester, 'City', 'Moscow');
      await _enterGeolocationField(tester, 'District', 'Moscow Oblast');

      await tester.tap(find.text('Done'));
      await tester.pump();
      for (var i = 0; i < 30; i++) {
        await tester.pump(const Duration(milliseconds: 50));
        if (find.text('home-landing').evaluate().isNotEmpty) break;
      }

      expect(find.text('home-landing'), findsOneWidget);
      expect(router.state.uri.path, AppRoutes.home);
    });

    testWidgets('edit flow submit returns to previous page', (tester) async {
      await pumpRainRouter(
        tester,
        bootstrap: ctx.bootstrap,
        router: GoRouter(
          initialLocation: AppRoutes.home,
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => Scaffold(
                body: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () => context.pushRouteUp(
                      const SelectGeolocation(isStart: false),
                    ),
                    child: const Text('Edit location'),
                  ),
                ),
              ),
            ),
          ],
        ),
        overrides: geolocationTestOverrides(),
      );
      await tester.pump();

      await tester.tap(find.text('Edit location'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(SelectGeolocation), findsOneWidget);

      await _enterGeolocationField(tester, 'Latitude', '52.52');
      await _enterGeolocationField(tester, 'Longitude', '13.41');
      await _enterGeolocationField(tester, 'City', 'Berlin');
      await _enterGeolocationField(tester, 'District', 'Berlin');

      await tester.tap(find.text('Done'));
      await tester.pump();
      for (var i = 0; i < 30; i++) {
        await tester.pump(const Duration(milliseconds: 50));
        if (find.text('Edit location').evaluate().isNotEmpty) break;
      }

      expect(find.text('Edit location'), findsOneWidget);
    });
  });
}

class _GeolocationSubmitMainWeatherNotifier extends MainWeatherNotifier {
  @override
  MainWeatherState build() =>
      MainWeatherState(isLoading: false, location: sampleLocationCache());

  @override
  Future<void> deleteAll(bool changeCity) async {}

  @override
  Future<void> getLocation(
    double latitude,
    double longitude,
    String district,
    String locality, {
    bool showLoading = true,
  }) async {}
}
