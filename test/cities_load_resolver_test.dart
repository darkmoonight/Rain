import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/cities_load_resolver.dart';

WeatherCard _card(int id) => WeatherCard(city: 'City $id')..id = id;

void main() {
  group('CitiesLoadResolver.resolve', () {
    test('returns database cards when available', () {
      final fromDb = [_card(1), _card(2)];
      final result = CitiesLoadResolver.resolve(
        fromDb: fromDb,
        previous: [_card(99)],
      );

      expect(result.cards, fromDb);
      expect(result.loadError, isFalse);
    });

    test('preserves previous cards when database is unexpectedly empty', () {
      final previous = [_card(1), _card(2)];
      final result = CitiesLoadResolver.resolve(
        fromDb: const [],
        previous: previous,
      );

      expect(result.cards, previous);
      expect(result.loadError, isTrue);
    });

    test('returns empty list when both database and previous are empty', () {
      final result = CitiesLoadResolver.resolve(
        fromDb: const [],
        previous: const [],
      );

      expect(result.cards, isEmpty);
      expect(result.loadError, isFalse);
    });
  });
}
