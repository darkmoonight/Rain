import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/mappers/air_quality_mapper.dart';
import 'package:rain/data/models/air_quality_api.dart';
import 'package:rain/data/models/db.dart';
import '../../helpers/fixtures.dart';

void main() {
  group('AirQualityMapper', () {
    test('mergeIntoMainWeatherCache aligns by time', () {
      final cache = MainWeatherCache(
        time: ['2026-06-05T12:00', '2026-06-05T13:00', '2026-06-05T14:00'],
      );
      final data = AirQualityDataApi.fromJson(sampleAirQualityJson());

      AirQualityMapper.merge(cache, data);

      expect(cache.europeanAqi, [28.0, 32.0, null]);
      expect(cache.pm25, [8.4, 9.1, null]);
      expect(cache.usAqi, [45.0, 55.0, null]);
      expect(cache.co, [420.0, 510.0, null]);
      expect(cache.no2, [18.0, 22.0, null]);
      expect(cache.so2, [5.0, 6.5, null]);
    });

    test('mergeIntoWeatherCard aligns by time', () {
      final card = WeatherCard(
        time: ['2026-06-05T12:00', '2026-06-05T13:00'],
      );
      final data = AirQualityDataApi.fromJson(sampleAirQualityJson());

      AirQualityMapper.merge(card, data);

      expect(card.ozone, [45.0, 48.0]);
      expect(card.europeanAqi, [28.0, 32.0]);
      expect(card.co, [420.0, 510.0]);
      expect(card.no2, [18.0, 22.0]);
      expect(card.so2, [5.0, 6.5]);
    });
  });
}
