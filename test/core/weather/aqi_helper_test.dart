import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/i18n/strings.g.dart';

void main() {
  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.enUs);
  });

  group('AqiHelper', () {
    test('resolveAqi picks european or american value', () {
      expect(
        AqiHelper.resolveAqi(AqiHelper.european, 28.0, 45.0),
        28.0,
      );
      expect(
        AqiHelper.resolveAqi(AqiHelper.american, 28.0, 45.0),
        45.0,
      );
    });

    test('severityColor returns expected EU colors', () {
      expect(AqiHelper.severityColor(AqiHelper.european, 10), const Color(0xFF5DB88A));
      expect(AqiHelper.severityColor(AqiHelper.european, 50), const Color(0xFFD4B84A));
      expect(AqiHelper.severityColor(AqiHelper.european, 120), const Color(0xFFC45C5C));
    });

    test('severityColor returns expected US colors', () {
      expect(AqiHelper.severityColor(AqiHelper.american, 30), const Color(0xFF5CB85C));
      expect(AqiHelper.severityColor(AqiHelper.american, 80), const Color(0xFFC9B84A));
      expect(AqiHelper.severityColor(AqiHelper.american, 350), const Color(0xFFB85555));
    });

    test('scaleColors returns five segments per standard', () {
      expect(
        AqiHelper.scaleColors(AqiHelper.european),
        hasLength(AqiHelper.scaleBandCount),
      );
      expect(
        AqiHelper.scaleColors(AqiHelper.american),
        hasLength(AqiHelper.scaleBandCount),
      );
      expect(AqiHelper.scaleMax(AqiHelper.european), 100);
      expect(AqiHelper.scaleMax(AqiHelper.american), 300);
    });

    test('recommendation returns advice for severity band', () {
      expect(
        AqiHelper.recommendation(AqiHelper.european, 16),
        isNotEmpty,
      );
      expect(AqiHelper.severityIndex(AqiHelper.european, 16), 0);
      expect(AqiHelper.severityIndex(AqiHelper.european, 85), 4);
    });

    test('formatConcentration formats values', () {
      expect(AqiHelper.formatConcentration(8.42), '8.4 µg/m³');
      expect(AqiHelper.formatConcentration(12.0), '12 µg/m³');
      expect(AqiHelper.formatConcentration(null), '—');
    });

    test('pollutantBarFraction and pollutantColor use EEA breakpoints', () {
      expect(AqiHelper.pollutantBandIndex('pm25', 26), 3);
      expect(AqiHelper.pollutantBarFraction('pm25', 26), closeTo(0.52, 0.01));
      expect(AqiHelper.pollutantBarFraction('so2', 60), closeTo(0.12, 0.01));
      expect(
        AqiHelper.pollutantColor('pm25', 26),
        const Color(0xFFD9955C),
      );
      expect(
        AqiHelper.pollutantColor('so2', 60),
        const Color(0xFF5DB88A),
      );
    });

    test('pollutantValue reads card fields', () {
      final card = WeatherCard(
        pm25: [8.4],
        no2: [22.0],
      );
      expect(AqiHelper.pollutantValue(card, 0, 'pm25'), 8.4);
      expect(AqiHelper.pollutantValue(card, 0, 'no2'), 22.0);
      expect(AqiHelper.pollutantValue(card, 0, 'co'), isNull);
    });

    test('hasData returns false when AQI is missing', () {
      final card = WeatherCard(time: ['2026-06-05T12:00']);
      expect(AqiHelper.hasData(card, 0, AqiHelper.european), isFalse);
    });
  });
}
