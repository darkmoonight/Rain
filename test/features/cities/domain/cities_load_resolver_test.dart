import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/cities_load_resolver.dart';

WeatherCard _card(int id) => WeatherCard(city: 'City $id')..id = id;

void main() {
  group('CitiesLoadResolver.resolve', () {
    test('returns database cards when available', () {
      final fromDb = [_card(1), _card(2)];
      final result = CitiesLoadResolver.resolve(fromDb: fromDb);

      expect(result.cards, fromDb);
    });

    test('returns empty list when database has no saved cities', () {
      final result = CitiesLoadResolver.resolve(fromDb: const []);

      expect(result.cards, isEmpty);
    });
  });
}
