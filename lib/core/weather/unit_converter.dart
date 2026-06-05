import 'package:rain/data/models/db.dart';

class UnitConverter {
  const UnitConverter._();

  static const double kphToMsFactor = 5 / 18;
  static const double hpaToMmHgFactor = 3 / 4;

  static double celsiusToFahrenheit(num celsius) => celsius * 9 / 5 + 32;

  static double kphToMph(num kph) => kph * 0.621371;

  static double kphToMs(num kph) => kph * kphToMsFactor;

  static double mmToInch(num mm) => mm / 25.4;

  static double metersToKm(num meters) => meters / 1000;

  static double metersToMiles(num meters) => meters / 1609.344;

  static double hpaToMmHg(num hpa) => hpa * hpaToMmHgFactor;

  static num? parseValue(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    return num.tryParse('$value');
  }

  static num? convertTemperature(dynamic celsius, Settings settings) {
    final value = parseValue(celsius);
    if (value == null) return null;

    final converted = settings.degrees == 'fahrenheit'
        ? celsiusToFahrenheit(value)
        : value.toDouble();

    return settings.roundDegree ? converted.round() : converted;
  }

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

  static String windSpeedUnitKey(Settings settings) {
    if (settings.measurements == 'imperial') return 'mph';
    if (settings.wind == 'm/s') return 'm/s';
    return 'kph';
  }

  static String? formatPressure(num? hpa, Settings settings) {
    if (hpa == null) return null;

    if (settings.pressure == 'mmHg') {
      return hpaToMmHg(hpa).toStringAsFixed(1);
    }
    return '${hpa.round()}';
  }

  static String pressureUnitKey(Settings settings) =>
      settings.pressure == 'mmHg' ? 'mmHg' : 'hPa';

  static String? formatVisibility(num? meters, Settings settings) {
    if (meters == null) return null;

    if (settings.measurements == 'imperial') {
      final miles = metersToMiles(meters);
      return miles >= 1 ? '${miles.round()}' : miles.toStringAsFixed(2);
    }

    final km = metersToKm(meters);
    return km >= 1 ? '${km.round()}' : km.toStringAsFixed(2);
  }

  static String visibilityUnitKey(Settings settings) =>
      settings.measurements == 'imperial' ? 'mi' : 'km';

  static String? formatPrecipitation(num? mm, Settings settings) {
    if (mm == null) return null;

    if (settings.measurements == 'imperial') {
      return mmToInch(mm).toStringAsFixed(2);
    }
    return '$mm';
  }

  static String precipitationUnitKey(Settings settings) =>
      settings.measurements == 'imperial' ? 'inch' : 'mm';

  static String temperatureSuffix(Settings settings) =>
      settings.degrees == 'fahrenheit' ? '°F' : '°C';
}
