import '../helpers/fake_notifiers.dart';
import '../helpers/fake_services.dart';
import '../helpers/fixtures.dart';
import '../helpers/test_bootstrap.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/features/cities/presentation/view/place_list.dart';
import 'package:rain/features/map/presentation/map_screen.dart';
import 'package:rain/features/settings/presentation/view/settings.dart';
import 'package:rain/features/shell/presentation/home_screen.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
    ctx.bootstrap.settings.hideMap = true;
  });

  Future<void> pumpHome(WidgetTester tester) async {
    await pumpRainWidget(
      tester,
      const HomeScreen(),
      bootstrap: ctx.bootstrap,
      overrides: [
        mainWeatherNotifierProvider.overrideWith(LoadedMainWeatherNotifier.new),
        citiesNotifierProvider.overrideWith(NoOpCitiesNotifier.new),
        notificationServiceProvider.overrideWithValue(
          FakeNotificationService(),
        ),
        weatherRemoteDatasourceProvider.overrideWithValue(
          createFakeWeatherRemoteDatasource(),
        ),
      ],
    );
    await tester.pump();
  }

  group('HomeScreen tabs', () {
    testWidgets('switches to cities tab', (tester) async {
      await pumpHome(tester);

      await tester.tap(find.text('Cities'));
      await tester.pumpAndSettle();

      expect(find.byType(PlaceList), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('switches to settings tab', (tester) async {
      await pumpHome(tester);

      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();

      expect(find.byType(SettingsPage), findsOneWidget);
    });

    testWidgets('toggles inline search on weather tab', (tester) async {
      await pumpHome(tester);

      expect(find.byType(TextField), findsNothing);

      await tester.tap(find.byIcon(IconsaxPlusLinear.search_normal_1));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);

      await tester.tap(find.byIcon(IconsaxPlusLinear.close_circle));
      await tester.pump();

      expect(find.byType(TextField), findsNothing);
    });

    testWidgets('shows seeded cities on cities tab', (tester) async {
      final card = completeWeatherCard();

      await pumpRainWidget(
        tester,
        const HomeScreen(),
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            LoadedMainWeatherNotifier.new,
          ),
          citiesNotifierProvider.overrideWith(
            () => CitiesWithCardsNotifier([card]),
          ),
          notificationServiceProvider.overrideWithValue(
            FakeNotificationService(),
          ),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      await tester.tap(find.text('Cities'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Moscow'), findsWidgets);
    });

    testWidgets('switches to map tab when map is enabled', (tester) async {
      ctx.bootstrap.settings.hideMap = false;

      await pumpRainWidget(
        tester,
        const HomeScreen(),
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            LoadedMainWeatherNotifier.new,
          ),
          citiesNotifierProvider.overrideWith(NoOpCitiesNotifier.new),
          notificationServiceProvider.overrideWithValue(
            FakeNotificationService(),
          ),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      await tester.tap(find.text('Map'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(MapPage), findsOneWidget);
    });
  });

  group('HomeScreen lifecycle and tab sync', () {
    testWidgets('refreshes cities when app resumes', (tester) async {
      final trackingNotifier = _RefreshTrackingCitiesNotifier();

      await pumpRainWidget(
        tester,
        const HomeScreen(),
        bootstrap: ctx.bootstrap,
        overrides: [
          mainWeatherNotifierProvider.overrideWith(
            LoadedMainWeatherNotifier.new,
          ),
          citiesNotifierProvider.overrideWith(() => trackingNotifier),
          notificationServiceProvider.overrideWithValue(
            FakeNotificationService(),
          ),
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();

      final initialRefreshCalls = trackingNotifier.refreshCalls;

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();

      expect(trackingNotifier.refreshCalls, initialRefreshCalls + 1);
    });

    testWidgets('keeps settings tab selected when map tab is enabled', (
      tester,
    ) async {
      await pumpHome(tester);

      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);

      ctx.bootstrap.settings.hideMap = false;
      final container = ProviderScope.containerOf(
        tester.element(find.byType(HomeScreen)),
      );
      container.read(settingsRevisionProvider.notifier).bump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.text('Map'), findsOneWidget);
    });
  });
}

class _RefreshTrackingCitiesNotifier extends CitiesNotifier {
  int refreshCalls = 0;

  @override
  CitiesState build() => const CitiesState(isLoading: false);

  @override
  Future<void> refresh({bool all = true}) async {
    refreshCalls++;
  }
}
