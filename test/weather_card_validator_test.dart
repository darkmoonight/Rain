import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';

WeatherCard _completeCard({DateTime? timestamp, int? index}) => WeatherCard(
  time: ['2026-06-05T12:00'],
  timeDaily: [DateTime(2026, 6, 5)],
  sunrise: ['06:00'],
  sunset: ['18:00'],
  weathercode: [0],
  temperature2M: [20.0],
  city: 'Moscow',
  district: 'Moscow',
  timezone: 'Europe/Moscow',
  lat: 55.75,
  lon: 37.62,
  timestamp: timestamp,
  index: index,
);

void main() {
  group('WeatherCardValidator.isComplete', () {
    test('returns true for a card with required fields', () {
      expect(WeatherCardValidator.isComplete(_completeCard()), isTrue);
    });

    test('returns false when weather data is missing', () {
      final card = _completeCard()..time = null;
      expect(WeatherCardValidator.isComplete(card), isFalse);
    });
  });

  group('WeatherCardValidator.isExpired', () {
    final expiry = DateTime(2026, 6, 5, 10);

    test('treats null timestamp as expired', () {
      expect(WeatherCardValidator.isExpired(_completeCard(), expiry), isTrue);
    });

    test('returns true when timestamp is before expiry', () {
      expect(
        WeatherCardValidator.isExpired(
          _completeCard(timestamp: DateTime(2026, 6, 5, 9)),
          expiry,
        ),
        isTrue,
      );
    });

    test('returns false when timestamp is after expiry', () {
      expect(
        WeatherCardValidator.isExpired(
          _completeCard(timestamp: DateTime(2026, 6, 5, 11)),
          expiry,
        ),
        isFalse,
      );
    });
  });

  group('WeatherCardValidator.index repair', () {
    test('detects when indices are out of order', () {
      final cards = [
        _completeCard(index: 0),
        _completeCard(index: 2),
      ];
      expect(WeatherCardValidator.needsIndexRepair(cards), isTrue);
    });

    test('repairs indices sequentially', () {
      final cards = [
        _completeCard(index: 5),
        _completeCard(index: 1),
      ];
      WeatherCardValidator.applyRepairedIndices(cards);
      expect(cards.map((c) => c.index).toList(), [0, 1]);
    });
  });

  group('WeatherCardValidator.matchesSearch', () {
    test('matches city and district case-insensitively', () {
      final card = _completeCard()..city = 'Moscow';
      expect(WeatherCardValidator.matchesSearch(card, ''), isTrue);
      expect(WeatherCardValidator.matchesSearch(card, 'mos'), isTrue);
      expect(WeatherCardValidator.matchesSearch(card, 'berlin'), isFalse);
    });
  });

  group('WeatherCardValidator.findById', () {
    test('returns card with matching id', () {
      final card = _completeCard()..id = 42;
      expect(WeatherCardValidator.findById([card], 42), same(card));
      expect(WeatherCardValidator.findById([card], 1), isNull);
    });
  });

  group('WeatherCardValidator.filterExpired', () {
    test('includes only expired cards', () {
      final expiry = DateTime(2026, 6, 5, 10);
      final cards = [
        _completeCard(timestamp: DateTime(2026, 6, 5, 9)),
        _completeCard(timestamp: DateTime(2026, 6, 5, 11)),
        _completeCard(),
      ];

      final expired = WeatherCardValidator.filterExpired(cards, expiry);

      expect(expired.length, 2);
    });
  });
}
