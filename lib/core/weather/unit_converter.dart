import 'package:rain/data/models/db.dart';

/// Converts and formats weather units according to user settings.
class UnitConverter {
  const UnitConverter._();

  static const double kphToMsFactor = 5 / 18;
  static const double hpaToMmHgFactor = 3 / 4;

  /// Converts Celsius to Fahrenheit.
  static double celsiusToFahrenheit(num celsius) => celsius * 9 / 5 + 32;

  /// Converts kilometers per hour to miles per hour.
  static double kphToMph(num kph) => kph * 0.621371;

  /// Converts kilometers per hour to meters per second.
  static double kphToMs(num kph) => kph * kphToMsFactor;

  /// Converts millimeters to inches.
  static double mmToInch(num mm) => mm / 25.4;

  /// Converts meters to kilometers.
  static double metersToKm(num meters) => meters / 1000;

  /// Converts meters to miles.
  static double metersToMiles(num meters) => meters / 1609.344;

  /// Converts hectopascals to millimeters of mercury.
  static double hpaToMmHg(num hpa) => hpa * hpaToMmHgFactor;

  /// Parses a numeric API value from [num] or string form.
  static num? parseValue(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    return num.tryParse('$value');
  }

  /// Converts Celsius to the user's preferred scale and rounding.
  static num? convertTemperature(dynamic celsius, Settings settings) {
    final value = parseValue(celsius);
    if (value == null) return null;

    final converted = settings.degrees == 'fahrenheit'
        ? celsiusToFahrenheit(value)
        : value.toDouble();

    return settings.roundDegree ? converted.round() : converted;
  }

  /// Formats wind speed from API kph into the user's preferred unit.
  static String? formatWindSpeed(num? kph, Settings settings) {
    if (kph == null) return null;

    if (settings.measurements == 'imperial') {
      return '${kphToMph(kph).round()}';
    }
    if (settings.wind == 'm/s') {
      return kphToMs(kph).toStringAsFixed(1);
    }
    return '${kph.round()}';
  }

  /// i18n key for the active wind speed unit label.
  static String windSpeedUnitKey(Settings settings) {
    if (settings.measurements == 'imperial') return 'mph';
    if (settings.wind == 'm/s') return 'm/s';
    return 'kph';
  }

  /// Formats surface pressure into hPa or mmHg per user settings.
  static String? formatPressure(num? hpa, Settings settings) {
    if (hpa == null) return null;

    if (settings.pressure == 'mmHg') {
      return hpaToMmHg(hpa).toStringAsFixed(1);
    }
    return '${hpa.round()}';
  }

  /// i18n key for the active pressure unit label.
  static String pressureUnitKey(Settings settings) =>
      settings.pressure == 'mmHg' ? 'mmHg' : 'hPa';

  /// Formats visibility from meters into km or miles per user settings.
  static String? formatVisibility(num? meters, Settings settings) {
    if (meters == null) return null;

    if (settings.measurements == 'imperial') {
      final miles = metersToMiles(meters);
      return miles >= 1 ? '${miles.round()}' : miles.toStringAsFixed(2);
    }

    final km = metersToKm(meters);
    return km >= 1 ? '${km.round()}' : km.toStringAsFixed(2);
  }

  /// i18n key for the active visibility unit label.
  static String visibilityUnitKey(Settings settings) =>
      settings.measurements == 'imperial' ? 'mi' : 'km';

  /// Formats precipitation from millimeters into mm or inches.
  static String? formatPrecipitation(num? mm, Settings settings) {
    if (mm == null) return null;

    if (settings.measurements == 'imperial') {
      return mmToInch(mm).toStringAsFixed(2);
    }
    return '$mm';
  }

  /// i18n key for the active precipitation unit label.
  static String precipitationUnitKey(Settings settings) =>
      settings.measurements == 'imperial' ? 'inch' : 'mm';

  /// Degree symbol suffix for the user's temperature scale.
  static String temperatureSuffix(Settings settings) =>
      settings.degrees == 'fahrenheit' ? '°F' : '°C';
}
