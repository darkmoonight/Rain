import 'package:rain/i18n/tr.dart';

/// Localized severity labels and long-press help text for weather metrics.
class Message {
  /// Returns a localized pressure level for [pressure] in hPa.
  String getPressure(int? pressure) => _pressureLevel(pressure);

  /// Returns a localized UV index severity for [uvIndex].
  String getUvIndex(int? uvIndex) => _uvLevel(uvIndex);

  /// Returns a localized wind direction for [direction] in degrees.
  String getDirection(int? direction) => _compassDirection(direction);

  /// Long-press help for minimum apparent temperature (daily).
  String helpApparentTemperatureMin() =>
      _help('metricHelpApparentTemperatureMin');

  /// Long-press help for maximum apparent temperature (daily).
  String helpApparentTemperatureMax() =>
      _help('metricHelpApparentTemperatureMax');

  /// UV severity line plus help text.
  String helpUvIndex(int? uvIndex) =>
      _withLevel(getUvIndex(uvIndex), _help('metricHelpUvIndex'));

  /// Compass label plus wind-direction help.
  String helpDirection(int? direction) =>
      _withLevel(getDirection(direction), _help('metricHelpDirection'));

  /// Long-press help for wind speed.
  String helpWind() => _help('metricHelpWind');

  /// Long-press help for wind gusts.
  String helpWindGusts() => _help('metricHelpWindGusts');

  /// Long-press help for precipitation probability.
  String helpPrecipitationProbability() =>
      _help('metricHelpPrecipitationProbability');

  /// Long-press help for rain amount.
  String helpRain() => _help('metricHelpRain');

  /// Long-press help for total precipitation.
  String helpPrecipitation() => _help('metricHelpPrecipitation');

  /// Long-press help for dew point.
  String helpDewpoint() => _help('metricHelpDewpoint');

  /// Long-press help for apparent temperature (hourly).
  String helpFeels() => _help('metricHelpFeels');

  /// Long-press help for visibility.
  String helpVisibility() => _help('metricHelpVisibility');

  /// Long-press help for evapotranspiration.
  String helpEvaporation() => _help('metricHelpEvaporation');

  /// Long-press help for relative humidity.
  String helpHumidity() => _help('metricHelpHumidity');

  /// Long-press help for cloud cover.
  String helpCloudcover() => _help('metricHelpCloudcover');

  /// Pressure level line plus help text.
  String helpPressure(int? pressure) =>
      _withLevel(getPressure(pressure), _help('metricHelpPressure'));

  /// Long-press help for shortwave radiation.
  String helpShortwaveRadiation() => _help('metricHelpShortwaveRadiation');

  String _help(String key) => key.tr;

  String _withLevel(String level, String help) {
    if (level.isEmpty) return help;
    return '$level\n$help';
  }

  String _pressureLevel(int? pressure) {
    if (pressure == null) return '';

    if (pressure < 1000) {
      return 'low'.tr;
    }
    if (pressure > 1020) {
      return 'high'.tr;
    }
    return 'normal'.tr;
  }

  String _uvLevel(int? uvIndex) {
    if (uvIndex == null) return '';

    if (uvIndex < 3) return 'uvLow'.tr;
    if (uvIndex < 6) return 'uvAverage'.tr;
    if (uvIndex < 8) return 'uvHigh'.tr;
    if (uvIndex < 11) return 'uvVeryHigh'.tr;
    return 'uvExtreme'.tr;
  }

  String _compassDirection(int? direction) {
    if (direction == null) return '';

    if (direction >= 337.5 || direction < 22.5) return 'north'.tr;
    if (direction < 67.5) return 'northeast'.tr;
    if (direction < 112.5) return 'east'.tr;
    if (direction < 157.5) return 'southeast'.tr;
    if (direction < 202.5) return 'south'.tr;
    if (direction < 247.5) return 'southwest'.tr;
    if (direction < 292.5) return 'west'.tr;
    return 'northwest'.tr;
  }
}
