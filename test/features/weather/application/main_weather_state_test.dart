import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/weather/application/main_weather_notifier.dart';
import 'package:rain/data/models/db.dart';

void main() {
  group('MainWeatherState', () {
    test('exposes city and district labels', () {
      final state = MainWeatherState(
        location: LocationCache(city: 'Moscow', district: 'Moscow Oblast'),
      );
      expect(state.city, 'Moscow');
      expect(state.district, 'Moscow Oblast');
    });

    test('copyWith updates forecast indices', () {
      final state = MainWeatherState(hourOfDay: 1, dayOfNow: 2);
      final updated = state.copyWith(hourOfDay: 5, dayOfNow: 6);
      expect(updated.hourOfDay, 5);
      expect(updated.dayOfNow, 6);
    });

    test('defaults empty labels when location is unset', () {
      final state = MainWeatherState();
      expect(state.city, '');
      expect(state.district, '');
    });
  });
}
