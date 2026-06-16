import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/unit_converter.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/data/models/db.dart';

void main() {
  MainWeatherCache validMainCache() => MainWeatherCache(
    time: ['2026-06-05T12:00'],
    weathercode: [0],
    temperature2M: [20.0],
    timeDaily: [DateTime(2026, 6, 5)],
    temperature2MMax: [25.0],
    temperature2MMin: [15.0],
    sunrise: ['2026-06-05T06:00'],
    sunset: ['2026-06-05T20:00'],
  );

  group('WeatherCacheValidator.hasHourlyTimestamps', () {
    test('requires a non-empty hourly time list', () {
      expect(
        WeatherCacheValidator.hasHourlyTimestamps(['2026-06-05T12:00']),
        isTrue,
      );
      expect(WeatherCacheValidator.hasHourlyTimestamps([]), isFalse);
      expect(WeatherCacheValidator.hasHourlyTimestamps(null), isFalse);
    });
  });

  group('WeatherCacheValidator.hasMainDisplayData', () {
    test('accepts cache with hourly and daily fields', () {
      expect(
        WeatherCacheValidator.hasMainDisplayData(validMainCache()),
        isTrue,
      );
    });

    test('rejects cache missing daily min/max', () {
      final cache = validMainCache()..temperature2MMin = null;
      expect(WeatherCacheValidator.hasMainDisplayData(cache), isFalse);
    });

    test('rejects cache missing hourly timestamps', () {
      final cache = validMainCache()..time = [];
      expect(WeatherCacheValidator.hasMainDisplayData(cache), isFalse);
    });
  });

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
