import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/mappers/weather_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/models/weather_api.dart';

WeatherDataApi _sampleApi() => WeatherDataApi(
  hourly: const Hourly(
    time: ['2026-06-05T12:00'],
    weatherCode: [0],
    temperature2M: [20.0],
    relativeHumidity2M: [50],
  ),
  daily: Daily(
    time: [DateTime(2026, 6, 5)],
    weatherCode: [0],
    temperature2MMax: [25.0],
    temperature2MMin: [15.0],
    sunrise: ['06:00'],
    sunset: ['18:00'],
  ),
  timezone: 'Europe/Moscow',
);

void main() {
  group('WeatherMapper.toMainWeatherCache', () {
    test('maps hourly and daily fields', () {
      final cache = WeatherMapper.toMainWeatherCache(_sampleApi());

      expect(cache.time, ['2026-06-05T12:00']);
      expect(cache.temperature2M, [20.0]);
      expect(cache.weathercode, [0]);
      expect(cache.timeDaily, [DateTime(2026, 6, 5)]);
      expect(cache.timezone, 'Europe/Moscow');
      expect(cache.timestamp, isNotNull);
    });
  });

  group('WeatherMapper.toWeatherCard', () {
    test('includes location metadata', () {
      final card = WeatherMapper.toWeatherCard(
        _sampleApi(),
        55.75,
        37.62,
        'Moscow',
        'Moscow Oblast',
        'Europe/Moscow',
      );

      expect(card.lat, 55.75);
      expect(card.lon, 37.62);
      expect(card.city, 'Moscow');
      expect(card.district, 'Moscow Oblast');
      expect(card.timezone, 'Europe/Moscow');
      expect(card.temperature2M, [20.0]);
    });
  });

  group('WeatherMapper.copyWeatherCardFields', () {
    test('copies forecast fields and refreshes timestamp', () {
      final oldCard = WeatherCard(city: 'Old')..temperature2M = [1.0];
      final updated = WeatherMapper.toWeatherCard(
        _sampleApi(),
        1,
        2,
        'New',
        'District',
        'UTC',
      );

      WeatherMapper.copyWeatherCardFields(oldCard, updated);

      expect(oldCard.city, 'Old');
      expect(oldCard.temperature2M, [20.0]);
      expect(oldCard.timestamp, isNotNull);
    });
  });
}
