import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/status_weather.dart';

void main() {
  final statusWeather = StatusWeather();

  group('StatusWeather.getText', () {
    test('returns clear sky for code 0', () {
      expect(statusWeather.getText(0), isNotEmpty);
    });

    test('returns empty string for null code', () {
      expect(statusWeather.getText(null), '');
    });
  });

  group('StatusWeather image paths', () {
    test('returns asset paths for known codes', () {
      expect(statusWeather.getImageNowDaily(0), contains('assets/images/'));
      expect(statusWeather.getImage7Day(61), contains('assets/images/'));
    });

    test('switches day/night icons based on time', () {
      final day = statusWeather.getImageNow(
        0,
        '2026-06-05T12:00',
        '06:00',
        '18:00',
      );
      final night = statusWeather.getImageNow(
        0,
        '2026-06-05T22:00',
        '06:00',
        '18:00',
      );
      expect(day, isNotEmpty);
      expect(night, isNotEmpty);
      expect(day, isNot(equals(night)));
    });
  });
}
