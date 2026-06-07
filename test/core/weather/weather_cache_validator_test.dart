import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/unit_converter.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/data/models/db.dart';

void main() {
  group('WeatherCacheValidator.isLikelyFahrenheit', () {
    test('detects legacy Fahrenheit cache values', () {
      final cache = MainWeatherCache(temperature2M: [72.5, 81.5, 82.2]);
      expect(WeatherCacheValidator.isLikelyFahrenheit(cache), isTrue);
    });

    test('accepts normal Celsius cache values', () {
      final cache = MainWeatherCache(temperature2M: [18.2, 27.5, 31.0]);
      expect(WeatherCacheValidator.isLikelyFahrenheit(cache), isFalse);
    });
  });

  test('legacy Fahrenheit cache double-converts like the reported bug', () {
    const legacyFahrenheitStored = 82.2;
    final settings = Settings()..degrees = 'fahrenheit';

    final wrong = UnitConverter.convertTemperature(
      legacyFahrenheitStored,
      settings,
    );

    expect(wrong, closeTo(179.96, 0.01));

    final correct = UnitConverter.convertTemperature(27.5, settings);
    expect(correct, closeTo(81.5, 0.01));
  });
}
