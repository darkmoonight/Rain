import 'package:rain/data/models/db.dart';

/// Detects stale or inconsistent main-weather cache entries.
class WeatherCacheValidator {
  const WeatherCacheValidator._();

  /// True when max temperature suggests values were stored as Fahrenheit, not Celsius.
  static bool isLikelyFahrenheit(MainWeatherCache cache) {
    final temps = cache.temperature2M;
    if (temps == null || temps.isEmpty) return false;

    var max = temps.first;
    for (final temp in temps) {
      if (temp > max) max = temp;
    }
    return max > 60;
  }
}
