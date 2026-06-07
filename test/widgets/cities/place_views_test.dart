import '../../helpers/fake_notifiers.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/features/cities/application/cities_notifier.dart';
import 'package:rain/features/weather/application/main_weather_notifier.dart';
import 'package:rain/data/models/db.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/features/cities/presentation/view/place_info.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('PlaceInfo', () {
    testWidgets('renders weather detail for saved card', (tester) async {
      final card = weeklyWeatherCard()..id = 1;

      await pumpRainWidget(
        tester,
        const PlaceInfo(cardId: 1),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(() => _CardCitiesNotifier(card)),
        ],
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(WeatherDetailView), findsOneWidget);
    });

    testWidgets('renders detail from card fallback for main weather on map', (
      tester,
    ) async {
      final card = weeklyWeatherCard();

      await pumpRainWidget(
        tester,
        PlaceInfo(cardId: card.id, card: card),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(_EmptyCitiesNotifier.new),
          mainWeatherNotifierProvider.overrideWith(
            LoadedMainWeatherNotifier.new,
          ),
        ],
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(WeatherDetailView), findsOneWidget);
      expect(find.text('City not found'), findsNothing);
    });

    testWidgets('shows city not found when card id is missing', (tester) async {
      final card = weeklyWeatherCard()..id = 1;

      await pumpRainWidget(
        tester,
        const PlaceInfo(cardId: 999),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(() => _CardCitiesNotifier(card)),
        ],
      );
      await tester.pump();

      expect(find.text('City not found'), findsOneWidget);
    });

    testWidgets('shows city not found when list is empty without loadError', (
      tester,
    ) async {
      await pumpRainWidget(
        tester,
        const PlaceInfo(cardId: 999),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(_EmptyCitiesNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.text('City not found'), findsOneWidget);
      expect(find.text('Failed to load cities'), findsNothing);
    });

    testWidgets('shows load error when loadError is true', (tester) async {
      await pumpRainWidget(
        tester,
        const PlaceInfo(cardId: 999),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(_LoadErrorCitiesNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.text('Failed to load cities'), findsOneWidget);
      expect(find.text('City not found'), findsNothing);
    });

    testWidgets('back button closes place info without error', (tester) async {
      final card = weeklyWeatherCard()..id = 1;

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
                      () => const PlaceInfo(cardId: 1),
                    ),
                    child: const Text('Open info'),
                  ),
                ),
              ),
            ),
          ],
        ),
        overrides: [
          citiesNotifierProvider.overrideWith(() => _CardCitiesNotifier(card)),
        ],
      );

      await tester.tap(find.text('Open info'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(WeatherDetailView), findsOneWidget);

      await tester.tap(find.byIcon(IconsaxPlusLinear.arrow_left_3));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(tester.takeException(), isNull);
      expect(find.text('Open info'), findsOneWidget);
    });
  });

  group('PlaceAction', () {
    testWidgets('edit mode prefills coordinates and labels', (tester) async {
      final card = completeWeatherCard();

      await pumpRainWidget(
        tester,
        Scaffold(body: PlaceAction(edit: true, card: card)),
        bootstrap: ctx.bootstrap,
        overrides: [
          weatherRemoteDatasourceProvider.overrideWithValue(
            createFakeWeatherRemoteDatasource(),
          ),
        ],
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('55.75'), findsOneWidget);
      expect(find.text('37.62'), findsOneWidget);
      expect(find.text('Moscow'), findsOneWidget);
    });

    testWidgets('renders add-city form', (tester) async {
      await pumpRainWidget(
        tester,
        Scaffold(
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

      expect(find.byType(PlaceAction), findsOneWidget);
    });
  });
}

class _EmptyCitiesNotifier extends CitiesNotifier {
  @override
  CitiesState build() => const CitiesState(isLoading: false);
}

class _LoadErrorCitiesNotifier extends CitiesNotifier {
  @override
  CitiesState build() => const CitiesState(isLoading: false, loadError: true);
}

class _CardCitiesNotifier extends CitiesNotifier {
  _CardCitiesNotifier(this.card);

  final WeatherCard card;

  @override
  CitiesState build() => CitiesState(cards: [card]);
}
