import '../../helpers/fake_notifiers.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/application/cities_notifier.dart';
import 'package:rain/features/cities/presentation/view/place_list.dart';
import 'package:rain/features/cities/presentation/widgets/place_card.dart';
import 'package:rain/features/cities/presentation/widgets/place_card_list.dart';
import 'package:rain/features/cities/presentation/widgets/place_card_shimmer.dart';
import 'package:rain/features/cities/presentation/widgets/weather_card_tile.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
    setTestConnectivity(true);
  });

  group('PlaceCard', () {
    test('tryFromWeatherCard returns null for incomplete card', () {
      expect(PlaceCard.tryFromWeatherCard(WeatherCard(city: 'X')), isNull);
    });

    test('tryFromWeatherCard builds widget for complete card', () {
      final widget = PlaceCard.tryFromWeatherCard(completeWeatherCard());
      expect(widget, isNotNull);
      expect(widget!.card.city, 'Moscow');
    });

    testWidgets('renders city and temperature', (tester) async {
      final cardWidget = PlaceCard.tryFromWeatherCard(completeWeatherCard())!;

      await pumpRainWidget(tester, cardWidget, bootstrap: ctx.bootstrap);

      expect(find.textContaining('Moscow'), findsWidgets);
    });
  });

  group('WeatherCardTile', () {
    testWidgets('renders complete card tile', (tester) async {
      await pumpRainWidget(
        tester,
        WeatherCardTile(card: completeWeatherCard()),
        bootstrap: ctx.bootstrap,
      );

      expect(find.byType(PlaceCard), findsOneWidget);
    });

    testWidgets('renders invalid tile for incomplete card', (tester) async {
      await pumpRainWidget(
        tester,
        WeatherCardTile(card: WeatherCard(city: 'Broken')),
        bootstrap: ctx.bootstrap,
      );

      expect(find.byType(InvalidWeatherCard), findsOneWidget);
    });
  });

  group('PlaceCardList', () {
    testWidgets('confirm dismiss removes card without error banner', (
      tester,
    ) async {
      final card = completeWeatherCard();

      await pumpRainWidget(
        tester,
        SizedBox(
          height: 400,
          child: Scaffold(
            body: Column(
              children: [
                const Expanded(child: PlaceCardList(searchCity: '')),
                Consumer(
                  builder: (context, ref, _) {
                    final cities = ref.watch(citiesNotifierProvider);
                    if (cities.loadError) {
                      return const Text('Failed to load cities');
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(
            () => _DeletableCitiesNotifier([card]),
          ),
        ],
      );
      await tester.pump();

      expect(find.byType(WeatherCardTile), findsOneWidget);

      await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();

      expect(find.byType(WeatherCardTile), findsNothing);
      expect(find.text('Failed to load cities'), findsNothing);
    });

    // Real notifier + Isar in testWidgets: use cities_notifier_test deleteCard;
    // Dismissible UI path covered by _DeletableCitiesNotifier test above.

    testWidgets('filters cards by search query', (tester) async {
      final moscow = completeWeatherCard()..city = 'Moscow';
      final berlin = completeWeatherCard()
        ..city = 'Berlin'
        ..district = 'Berlin';

      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceCardList(searchCity: 'berlin')),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(
            () => CitiesWithCardsNotifier([moscow, berlin]),
          ),
        ],
      );
      await tester.pump();

      expect(find.textContaining('Berlin'), findsWidgets);
      expect(find.textContaining('Moscow'), findsNothing);
    });

    testWidgets('renders cards from notifier state', (tester) async {
      await pumpRainWidget(
        tester,
        Scaffold(body: PlaceCardList(searchCity: '')),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(_TestCitiesNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.byType(WeatherCardTile), findsOneWidget);
    });
  });

  group('PlaceList', () {
    testWidgets('shows shimmer placeholders while loading', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(LoadingCitiesNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.byType(PlaceCardsLoadingView), findsOneWidget);
      expect(find.byType(PlaceCardShimmer), findsNWidgets(4));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(Shimmer), findsWidgets);
    });

    testWidgets('keeps cached cards visible while loading', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(_LoadingWithCardsNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.byType(PlaceCardsLoadingView), findsNothing);
      expect(find.byType(WeatherCardTile), findsOneWidget);
      expect(find.textContaining('Moscow'), findsWidgets);
    });

    testWidgets('shows Add a city when list is empty without loadError', (
      tester,
    ) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(IdleCitiesNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.text('Add a city'), findsOneWidget);
      expect(find.text('Retry'), findsNothing);
      expect(find.text('Failed to load cities'), findsNothing);
    });

    testWidgets('shows Retry when loadError with empty cards', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(_EmptyLoadErrorNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.text('Failed to load cities'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
      expect(find.text('Add a city'), findsNothing);
    });

    testWidgets('filters cards via search field', (tester) async {
      final moscow = completeWeatherCard()..city = 'Moscow';
      final berlin = completeWeatherCard()
        ..city = 'Berlin'
        ..district = 'Berlin';

      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(
            () => CitiesWithCardsNotifier([moscow, berlin]),
          ),
        ],
      );
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'berlin');
      await tester.pump();

      expect(find.textContaining('Berlin'), findsWidgets);
      expect(find.textContaining('Moscow'), findsNothing);
    });

    testWidgets('pull-to-refresh calls notifier refresh', (tester) async {
      final tracking = _RefreshTrackingCitiesNotifier([completeWeatherCard()]);

      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [citiesNotifierProvider.overrideWith(() => tracking)],
      );
      await tester.pump();

      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(tracking.refreshCalls, greaterThan(0));
    });

    testWidgets('shows error banner when refresh fails with cards', (
      tester,
    ) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(_CitiesWithErrorNotifier.new),
        ],
      );
      await tester.pump();

      expect(find.text('Failed to load cities'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('renders saved cards in list', (tester) async {
      await pumpRainWidget(
        tester,
        const Scaffold(body: PlaceList()),
        bootstrap: ctx.bootstrap,
        overrides: [
          citiesNotifierProvider.overrideWith(
            () => CitiesWithCardsNotifier([completeWeatherCard()]),
          ),
        ],
      );
      await tester.pump();

      expect(find.byType(WeatherCardTile), findsOneWidget);
      expect(find.textContaining('Moscow'), findsWidgets);
    });
  });
}

class _LoadingWithCardsNotifier extends CitiesNotifier {
  @override
  CitiesState build() =>
      CitiesState(cards: [completeWeatherCard()], isLoading: true);
}

class _TestCitiesNotifier extends CitiesNotifier {
  @override
  CitiesState build() => CitiesState(cards: [completeWeatherCard()]);
}

class _CitiesWithErrorNotifier extends CitiesNotifier {
  @override
  CitiesState build() =>
      CitiesState(cards: [completeWeatherCard()], loadError: true);
}

class _EmptyLoadErrorNotifier extends CitiesNotifier {
  @override
  CitiesState build() => const CitiesState(isLoading: false, loadError: true);
}

class _DeletableCitiesNotifier extends CitiesNotifier {
  _DeletableCitiesNotifier(this.initialCards);

  final List<WeatherCard> initialCards;

  @override
  CitiesState build() => CitiesState(cards: initialCards, isLoading: false);

  @override
  Future<void> deleteCard(WeatherCard card) async {
    state = state.copyWith(
      cards: state.cards.where((c) => c.id != card.id).toList(),
      loadError: false,
    );
  }
}

class _RefreshTrackingCitiesNotifier extends CitiesNotifier {
  _RefreshTrackingCitiesNotifier(this.cards);

  final List<WeatherCard> cards;
  int refreshCalls = 0;

  @override
  CitiesState build() => CitiesState(cards: cards, isLoading: false);

  @override
  Future<void> refresh({bool all = true}) async {
    refreshCalls++;
  }
}
