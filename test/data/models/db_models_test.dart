import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/db.dart';

void main() {
  group('MainWeatherCache.toJson', () {
    test('serializes core fields', () {
      final cache = MainWeatherCache(
        time: ['2026-06-05T12:00'],
        temperature2M: [20.0],
        weathercode: [0],
        timezone: 'UTC',
        timestamp: DateTime(2026, 6, 5, 12),
      );

      final json = cache.toJson();
      expect(json['time'], ['2026-06-05T12:00']);
      expect(json['temperature2M'], [20.0]);
      expect(json['weathercode'], [0]);
      expect(json['timezone'], 'UTC');
    });
  });

  group('LocationCache.toJson', () {
    test('serializes location fields', () {
      final location = LocationCache(
        lat: 55.75,
        lon: 37.62,
        city: 'Moscow',
        district: 'Moscow',
      );

      final json = location.toJson();
      expect(json['lat'], 55.75);
      expect(json['lon'], 37.62);
      expect(json['city'], 'Moscow');
      expect(json['district'], 'Moscow');
    });
  });

  group('WeatherCard.fromJson', () {
    test('round-trips list fields', () {
      final card = WeatherCard.fromJson({
        'time': ['2026-06-05T12:00'],
        'weathercode': [0],
        'temperature2M': [20.0],
        'apparentTemperature': [],
        'relativehumidity2M': [],
        'precipitation': [],
        'rain': [],
        'surfacePressure': [],
        'visibility': [],
        'evapotranspiration': [],
        'windspeed10M': [],
        'winddirection10M': [],
        'windgusts10M': [],
        'cloudcover': [],
        'uvIndex': [],
        'dewpoint2M': [],
        'precipitationProbability': [],
        'shortwaveRadiation': [],
        'timeDaily': [],
        'weathercodeDaily': [],
        'temperature2MMax': [],
        'temperature2MMin': [],
        'apparentTemperatureMax': [],
        'apparentTemperatureMin': [],
        'windspeed10MMax': [],
        'windgusts10MMax': [],
        'uvIndexMax': [],
        'rainSum': [],
        'winddirection10MDominant': [],
        'precipitationSum': [],
        'precipitationProbabilityMax': [],
        'sunrise': [],
        'sunset': [],
        'lat': 55.75,
        'lon': 37.62,
        'city': 'Moscow',
        'district': 'Moscow',
        'timezone': 'Europe/Moscow',
        'timestamp': DateTime(2026, 6, 5),
        'index': 0,
      });

      expect(card.city, 'Moscow');
      expect(card.temperature2M, [20.0]);
      expect(card.weathercode, [0]);
      expect(card.index, 0);
    });
  });
}
