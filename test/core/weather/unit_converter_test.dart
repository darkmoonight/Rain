import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/unit_converter.dart';
import 'package:rain/data/models/db.dart';

Settings _settings({
  String degrees = 'celsius',
  String measurements = 'metric',
  String wind = 'kph',
  String pressure = 'hPa',
  bool roundDegree = false,
}) =>
    Settings()
      ..degrees = degrees
      ..measurements = measurements
      ..wind = wind
      ..pressure = pressure
      ..roundDegree = roundDegree;

void main() {
  group('UnitConverter conversions', () {
    test('celsiusToFahrenheit', () {
      expect(UnitConverter.celsiusToFahrenheit(0), 32);
      expect(UnitConverter.celsiusToFahrenheit(100), 212);
    });

    test('kphToMph and kphToMs', () {
      expect(UnitConverter.kphToMph(100), closeTo(62.1371, 0.001));
      expect(UnitConverter.kphToMs(36), closeTo(10, 0.001));
    });

    test('mmToInch and meters conversions', () {
      expect(UnitConverter.mmToInch(25.4), closeTo(1, 0.001));
      expect(UnitConverter.metersToKm(1500), 1.5);
      expect(UnitConverter.metersToMiles(1609.344), closeTo(1, 0.001));
    });

    test('hpaToMmHg', () {
      expect(UnitConverter.hpaToMmHg(1000), 750);
    });
  });

  group('UnitConverter.parseValue', () {
    test('handles num, string, and null', () {
      expect(UnitConverter.parseValue(null), isNull);
      expect(UnitConverter.parseValue(12), 12);
      expect(UnitConverter.parseValue('3.5'), 3.5);
      expect(UnitConverter.parseValue('bad'), isNull);
    });
  });

  group('UnitConverter.convertTemperature', () {
    test('returns celsius unchanged by default', () {
      expect(UnitConverter.convertTemperature(20.4, _settings()), 20.4);
    });

    test('converts to fahrenheit when configured', () {
      expect(
        UnitConverter.convertTemperature(20, _settings(degrees: 'fahrenheit')),
        68,
      );
    });

    test('rounds when roundDegree is enabled', () {
      expect(
        UnitConverter.convertTemperature(
          20.6,
          _settings(roundDegree: true),
        ),
        21,
      );
    });
  });

  group('UnitConverter.formatters', () {
    test('formatWindSpeed respects units', () {
      expect(UnitConverter.formatWindSpeed(10, _settings()), '10');
      expect(
        UnitConverter.formatWindSpeed(10, _settings(measurements: 'imperial')),
        '6',
      );
      expect(
        UnitConverter.formatWindSpeed(36, _settings(wind: 'm/s')),
        '10.0',
      );
    });

    test('formatPressure respects units', () {
      expect(UnitConverter.formatPressure(1000, _settings()), '1000');
      expect(
        UnitConverter.formatPressure(1000, _settings(pressure: 'mmHg')),
        '750.0',
      );
    });

    test('formatVisibility respects metric and imperial', () {
      expect(UnitConverter.formatVisibility(500, _settings()), '0.50');
      expect(UnitConverter.formatVisibility(5000, _settings()), '5');
      expect(
        UnitConverter.formatVisibility(
          1609,
          _settings(measurements: 'imperial'),
        ),
        '1.00',
      );
    });

    test('formatPrecipitation respects units', () {
      expect(UnitConverter.formatPrecipitation(5, _settings()), '5');
      expect(
        UnitConverter.formatPrecipitation(
          25.4,
          _settings(measurements: 'imperial'),
        ),
        '1.00',
      );
    });

    test('unit keys and temperature suffix', () {
      final metric = _settings();
      expect(UnitConverter.windSpeedUnitKey(metric), 'kph');
      expect(UnitConverter.pressureUnitKey(metric), 'hPa');
      expect(UnitConverter.visibilityUnitKey(metric), 'km');
      expect(UnitConverter.precipitationUnitKey(metric), 'mm');
      expect(UnitConverter.temperatureSuffix(metric), '°C');

      final imperial = _settings(measurements: 'imperial', degrees: 'fahrenheit');
      expect(UnitConverter.windSpeedUnitKey(imperial), 'mph');
      expect(UnitConverter.temperatureSuffix(imperial), '°F');
    });
  });
}
