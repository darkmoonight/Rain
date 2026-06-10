import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/weather_api.dart';

void main() {
  group('WeatherDataApi.fromJson', () {
    test('deserializes hourly and daily forecast payload', () {
      final api = WeatherDataApi.fromJson({
        'hourly': {
          'time': ['2026-06-05T12:00'],
          'weathercode': [0],
          'temperature_2m': [20.0],
        },
        'daily': {
          'time': ['2026-06-05'],
          'weathercode': [0],
          'temperature_2m_max': [25.0],
          'temperature_2m_min': [15.0],
        },
        'timezone': 'Europe/Moscow',
        'utc_offset_seconds': 10800,
      });

      expect(api.timezone, 'Europe/Moscow');
      expect(api.utcOffsetSeconds, 10800);
      expect(api.hourly.time, ['2026-06-05T12:00']);
      expect(api.hourly.temperature2M, [20.0]);
      expect(api.daily.temperature2MMax, [25.0]);
    });
  });
}
