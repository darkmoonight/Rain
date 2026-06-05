import 'package:rain/data/models/db.dart';

class WeatherCacheValidator {
  const WeatherCacheValidator._();

  /// Detects caches written when the API used `temperature_unit=fahrenheit`.
  /// Open-Meteo Celsius hourly values are almost always below this threshold.
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
