import 'package:rain/data/models/db.dart';

/// Validates persisted main-weather cache rows.
class WeatherCacheValidator {
  const WeatherCacheValidator._();

  /// True when [time] has at least one hourly forecast timestamp.
  static bool hasHourlyTimestamps(List<String>? time) =>
      time != null && time.isNotEmpty;

  /// True when [cache] has the hourly and daily fields required by the main screen.
  static bool hasMainDisplayData(MainWeatherCache cache) {
    if (!hasHourlyTimestamps(cache.time)) return false;
    final daily = cache.timeDaily;
    if (daily == null || daily.isEmpty) return false;
    if (cache.temperature2M == null || cache.temperature2M!.isEmpty) {
      return false;
    }
    if (cache.temperature2MMax == null || cache.temperature2MMax!.isEmpty) {
      return false;
    }
    if (cache.temperature2MMin == null || cache.temperature2MMin!.isEmpty) {
      return false;
    }
    if (cache.sunrise == null ||
        cache.sunset == null ||
        cache.weathercode == null ||
        cache.weathercode!.isEmpty) {
      return false;
    }
    return true;
  }

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
