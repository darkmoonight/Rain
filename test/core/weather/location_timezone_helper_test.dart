import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/location_timezone_helper.dart';
import 'package:rain/data/models/db.dart';

void main() {
  group('LocationTimezoneHelper', () {
    test('fromCoordinates returns Europe/Moscow for Moscow', () {
      expect(
        LocationTimezoneHelper.fromCoordinates(55.75, 37.62),
        'Europe/Moscow',
      );
    });

    test('resolve prefers coordinates over mismatched cached timezone', () {
      expect(
        LocationTimezoneHelper.resolve(
          cached: 'America/Los_Angeles',
          lat: 55.75,
          lon: 37.62,
        ),
        'Europe/Moscow',
      );
    });

    test('resolve keeps cached timezone when it matches coordinates', () {
      expect(
        LocationTimezoneHelper.resolve(
          cached: 'Europe/Moscow',
          lat: 55.75,
          lon: 37.62,
        ),
        'Europe/Moscow',
      );
    });

    test('resolve falls back to UTC when nothing else is available', () {
      expect(
        LocationTimezoneHelper.resolve(cached: null, lat: null, lon: null),
        'UTC',
      );
    });

    test('repairCardTimezone fixes mismatched card timezone', () {
      final card = WeatherCard(
        lat: 55.75,
        lon: 37.62,
        timezone: 'America/Los_Angeles',
      );

      expect(LocationTimezoneHelper.repairCardTimezone(card), isTrue);
      expect(card.timezone, 'Europe/Moscow');
    });
  });
}
