import '../helpers/fake_notifiers.dart';
import '../helpers/fake_services.dart';
import '../helpers/fixtures.dart';
import '../helpers/test_bootstrap.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/app.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/navigation/app_router.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('RainApp.updateAppState', () {
    testWidgets('updates app settings through provider', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bootstrapProvider.overrideWithValue(ctx.bootstrap),
            mainWeatherNotifierProvider.overrideWith(
              LoadedMainWeatherNotifier.new,
            ),
            citiesNotifierProvider.overrideWith(IdleCitiesNotifier.new),
            notificationServiceProvider.overrideWithValue(
              FakeNotificationService(),
            ),
            homeWidgetServiceProvider.overrideWithValue(
              FakeHomeWidgetService(),
            ),
            weatherRemoteDatasourceProvider.overrideWithValue(
              createFakeWeatherRemoteDatasource(),
            ),
          ],
          child: Consumer(
            builder: (context, ref, _) {
              return MaterialApp(
                home: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () => RainApp.updateAppState(
                      ref,
                      newRoundDegree: true,
                      newLargeElement: true,
                    ),
                    child: const Text('Apply'),
                  ),
                ),
              );
            },
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Apply'));
      await tester.pump();

      final container = ProviderScope.containerOf(
        tester.element(find.text('Apply')),
      );
      final state = container.read(appSettingsProvider);
      expect(state.roundDegree, isTrue);
      expect(state.largeElement, isTrue);
    });
  });

  group('RainApp.build', () {
    testWidgets('applies dark theme from settings', (tester) async {
      ctx.bootstrap.settings.theme = 'dark';
      final router = createTestRouter(ctx.bootstrap);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bootstrapProvider.overrideWithValue(ctx.bootstrap),
            appRouterProvider.overrideWithValue(router),
            mainWeatherNotifierProvider.overrideWith(
              LoadedMainWeatherNotifier.new,
            ),
            citiesNotifierProvider.overrideWith(IdleCitiesNotifier.new),
            notificationServiceProvider.overrideWithValue(
              FakeNotificationService(),
            ),
            homeWidgetServiceProvider.overrideWithValue(
              FakeHomeWidgetService(),
            ),
            weatherRemoteDatasourceProvider.overrideWithValue(
              createFakeWeatherRemoteDatasource(),
            ),
          ],
          child: RainApp(bootstrap: ctx.bootstrap),
        ),
      );
      await tester.pump();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.themeMode, ThemeMode.dark);
    });
  });
}
