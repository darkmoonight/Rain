import 'package:rain/data/models/air_quality_api.dart';
import 'package:rain/data/models/db.dart';

/// Maps Open-Meteo Air Quality API responses onto weather cache models.
class AirQualityMapper {
  AirQualityMapper._();

  /// Reindexes [source] from air-quality timestamps onto [weatherTimes].
  static List<T?>? _alignByTime<T>(
    List<String>? weatherTimes,
    List<String>? aqTimes,
    List<T?>? source,
  ) {
    if (weatherTimes == null || aqTimes == null || source == null) return null;
    final indexByTime = {for (var i = 0; i < aqTimes.length; i++) aqTimes[i]: i};
    return List<T?>.generate(weatherTimes.length, (i) {
      final aqIndex = indexByTime[weatherTimes[i]];
      return aqIndex == null ? null : source[aqIndex];
    });
  }

  /// Merges hourly air quality fields into [target], aligned to its timestamps.
  static void merge(Object target, AirQualityDataApi data) {
    final weatherTimes = switch (target) {
      MainWeatherCache cache => cache.time,
      WeatherCard card => card.time,
      _ => null,
    };
    if (weatherTimes == null) return;

    final hourly = data.hourly;
    final aqTimes = hourly.time;
    _writeFields(
      target,
      europeanAqi: _alignByTime(weatherTimes, aqTimes, hourly.europeanAqi),
      usAqi: _alignByTime(weatherTimes, aqTimes, hourly.usAqi),
      pm25: _alignByTime(weatherTimes, aqTimes, hourly.pm25),
      pm10: _alignByTime(weatherTimes, aqTimes, hourly.pm10),
      ozone: _alignByTime(weatherTimes, aqTimes, hourly.ozone),
      co: _alignByTime(weatherTimes, aqTimes, hourly.co),
      no2: _alignByTime(weatherTimes, aqTimes, hourly.no2),
      so2: _alignByTime(weatherTimes, aqTimes, hourly.so2),
    );
  }

  /// Writes aligned hourly air quality lists onto a cache or card model.
  static void _writeFields(
    Object target, {
    required List<double?>? europeanAqi,
    required List<double?>? usAqi,
    required List<double?>? pm25,
    required List<double?>? pm10,
    required List<double?>? ozone,
    required List<double?>? co,
    required List<double?>? no2,
    required List<double?>? so2,
  }) {
    void assign(dynamic model) {
      model
        ..europeanAqi = europeanAqi
        ..usAqi = usAqi
        ..pm25 = pm25
        ..pm10 = pm10
        ..ozone = ozone
        ..co = co
        ..no2 = no2
        ..so2 = so2;
    }

    switch (target) {
      case MainWeatherCache cache:
        assign(cache);
      case WeatherCard card:
        assign(card);
    }
  }
}
