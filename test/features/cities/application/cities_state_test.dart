import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/cities/application/cities_notifier.dart';
import 'package:rain/data/models/db.dart';

WeatherCard _card(int id) => WeatherCard(city: 'City $id')..id = id;

void main() {
  group('CitiesState', () {
    test('copyWith replaces selected fields', () {
      const initial = CitiesState(cards: [], isLoading: true, loadError: false);
      final updated = initial.copyWith(
        cards: [_card(1)],
        isLoading: false,
        loadError: true,
      );

      expect(updated.cards, hasLength(1));
      expect(updated.isLoading, isFalse);
      expect(updated.loadError, isTrue);
    });

    test('cardById finds card in state', () {
      final card = _card(7);
      final state = CitiesState(cards: [card]);
      expect(state.cardById(7), same(card));
      expect(state.cardById(99), isNull);
    });
  });
}
