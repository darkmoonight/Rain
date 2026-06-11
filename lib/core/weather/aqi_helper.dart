import 'package:flutter/material.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/i18n/tr.dart';

/// European and United States AQI thresholds, colors, and formatting.
class AqiHelper {
  AqiHelper._();

  static const String european = 'european';
  static const String american = 'american';

  /// Large AQI number shown in the summary card header.
  static const double valueFontSize = 26;

  /// Background fill for the severity badge next to the AQI value.
  static const double severityBadgeAlpha = 0.15;

  /// Number of colored segments drawn on the scale bar.
  static const int scaleBandCount = 5;

  /// EEA band index used as the 100% mark on pollutant bars (upper "poor" limit).
  static const int _pollutantBarCapBand = 3;

  /// Pollutants shown in the summary card, in display order.
  static const pollutantKeys = ['pm25', 'pm10', 'ozone', 'no2', 'so2', 'co'];

  static const _euColors = [
    Color(0xFF5DB88A),
    Color(0xFF9BB86A),
    Color(0xFFD4B84A),
    Color(0xFFD9955C),
    Color(0xFFD97272),
    Color(0xFFC45C5C),
  ];

  static const _usColors = [
    Color(0xFF5CB85C),
    Color(0xFFC9B84A),
    Color(0xFFD9A05C),
    Color(0xFFD97070),
    Color(0xFFB07AB8),
    Color(0xFFB85555),
  ];

  static const _euThresholds = [20.0, 40.0, 60.0, 80.0, 100.0];
  static const _usThresholds = [50.0, 100.0, 150.0, 200.0, 300.0];

  /// EEA pollutant breakpoints (good → extremely poor), μg/m³.
  static const _pollutantThresholds = {
    'pm25': [10.0, 20.0, 25.0, 50.0, 75.0],
    'pm10': [20.0, 40.0, 50.0, 100.0, 150.0],
    'ozone': [50.0, 100.0, 130.0, 240.0, 380.0],
    'no2': [40.0, 90.0, 120.0, 230.0, 340.0],
    'so2': [100.0, 200.0, 350.0, 500.0, 750.0],
    // US 8-hour CO breakpoints converted from ppm to μg/m³.
    'co': [5150.0, 10878.0, 14313.0, 17748.0, 34923.0],
  };

  static const _euLabelKeys = [
    'aqiGood',
    'aqiFair',
    'aqiModerate',
    'aqiPoor',
    'aqiVeryPoor',
    'aqiExtremelyPoor',
  ];

  static const _usLabelKeys = [
    'aqiGood',
    'aqiModerate',
    'aqiUnhealthySensitive',
    'aqiUnhealthy',
    'aqiVeryUnhealthy',
    'aqiHazardous',
  ];

  static const _adviceKeys = [
    'aqiAdviceGood',
    'aqiAdviceFair',
    'aqiAdviceModerate',
    'aqiAdvicePoor',
    'aqiAdviceVeryPoor',
    'aqiAdviceExtremelyPoor',
  ];

  /// Long-press help keys for how Open-Meteo derives each consolidated index.
  static const _howCalculatedKeys = {
    european: 'aqiHelpHowCalculatedEuropean',
    american: 'aqiHelpHowCalculatedAmerican',
  };

  static bool _isAmerican(String standard) => standard == american;

  static List<double> _aqiThresholds(String standard) =>
      _isAmerican(standard) ? _usThresholds : _euThresholds;

  static List<Color> _aqiColors(String standard) =>
      _isAmerican(standard) ? _usColors : _euColors;

  static List<String> _aqiLabelKeys(String standard) =>
      _isAmerican(standard) ? _usLabelKeys : _euLabelKeys;

  static List<double> _pollutantThresholdsFor(String pollutantKey) =>
      _pollutantThresholds[pollutantKey]!;

  static int _bandIndex(List<double> thresholds, double value) {
    for (var i = 0; i < thresholds.length; i++) {
      if (value <= thresholds[i]) return i;
    }
    return thresholds.length;
  }

  /// Returns the AQI value for the selected [standard].
  static double? resolveAqi(
    String standard,
    double? europeanAqi,
    double? usAqi,
  ) => _isAmerican(standard) ? usAqi : europeanAqi;

  /// Consolidated AQI for [card] at [hourIndex] under [standard].
  static double? aqiAt(WeatherCard card, int hourIndex, String standard) {
    if (!hasData(card, hourIndex, standard)) return null;
    return resolveAqi(
      standard,
      card.europeanAqi?[hourIndex],
      card.usAqi?[hourIndex],
    );
  }

  /// Zero-based severity band index for [aqi] under [standard].
  static int severityIndex(String standard, double aqi) =>
      _bandIndex(_aqiThresholds(standard), aqi);

  /// Zero-based EEA severity band for a [pollutantKey] concentration.
  static int pollutantBandIndex(String pollutantKey, double value) =>
      _bandIndex(_pollutantThresholdsFor(pollutantKey), value);

  /// Upper bound of the pollutant bar scale (aligned with EEA color bands).
  static double _pollutantBarScaleMax(String pollutantKey) {
    final thresholds = _pollutantThresholdsFor(pollutantKey);
    return pollutantKey == 'co'
        ? thresholds.first
        : thresholds[_pollutantBarCapBand];
  }

  /// Bar fill fraction for [value] on the [pollutantKey] EEA scale.
  static double pollutantBarFraction(String pollutantKey, double? value) {
    if (value == null || value <= 0) return 0;
    return (value / _pollutantBarScaleMax(pollutantKey)).clamp(0.0, 1.0);
  }

  /// Accent color for a pollutant bar from EEA breakpoints.
  static Color pollutantColor(String pollutantKey, double? value) {
    if (value == null) {
      return _euColors.first.withValues(alpha: 0.35);
    }
    return _euColors[pollutantBandIndex(pollutantKey, value)];
  }

  /// Reads a pollutant concentration from [card] at [index].
  static double? pollutantValue(
    WeatherCard card,
    int index,
    String pollutantKey,
  ) {
    final values = switch (pollutantKey) {
      'pm25' => card.pm25,
      'pm10' => card.pm10,
      'ozone' => card.ozone,
      'no2' => card.no2,
      'so2' => card.so2,
      'co' => card.co,
      _ => null,
    };
    if (values == null || index < 0 || index >= values.length) return null;
    return values[index];
  }

  /// Localized human-readable severity label.
  static String severityLabel(String standard, double aqi) =>
      _aqiLabelKeys(standard)[severityIndex(standard, aqi)].tr;

  /// Localized health recommendation for the current severity band.
  static String recommendation(String standard, double aqi) =>
      _adviceKeys[severityIndex(standard, aqi)].tr;

  /// Long-press help: standard, index, pollutants, advice, and data source.
  ///
  /// Pass [aqi] when the caller already resolved it (e.g. [AirQualityCard]).
  static String buildHelpText({
    required String standard,
    required WeatherCard card,
    required int hourIndex,
    double? aqi,
  }) {
    final resolved = aqi ?? aqiAt(card, hourIndex, standard);
    if (resolved == null) return '';

    final pollutants = _pollutantSummaries(card, hourIndex);
    final sections = <String>[
      '${standardLabel(standard)}: ${resolved.round()} — '
          '${severityLabel(standard, resolved)}',
      _howCalculatedHelp(standard),
    ];

    final dominant = pollutants.dominant;
    if (dominant != null) {
      sections.add(
        '${'aqiHelpDominant'.tr}: ${dominant.key.tr} '
        '(${_pollutantLevelSummary(dominant.key, dominant.value)})',
      );
    }

    if (pollutants.lines.isNotEmpty) {
      sections.add('${'pollutants'.tr}\n${pollutants.lines.join('\n')}');
    }

    sections.add(
      '${'aqiHelpAdviceLabel'.tr}\n${recommendation(standard, resolved)}',
    );
    sections.add('aqiHelpSource'.tr);

    return sections.join('\n\n');
  }

  /// Accent color for badges, markers, and severity text.
  static Color severityColor(String standard, double aqi) =>
      _aqiColors(standard)[severityIndex(standard, aqi)];

  /// Colors for the five scale-bar segments, good to very poor.
  static List<Color> scaleColors(String standard) =>
      _aqiColors(standard).sublist(0, scaleBandCount);

  /// Maximum value shown on the scale bar.
  static double scaleMax(String standard) =>
      _isAmerican(standard) ? 300.0 : 100.0;

  /// Localized name of the active AQI standard.
  static String standardLabel(String standard) =>
      _isAmerican(standard) ? 'aqiAmerican'.tr : 'aqiEuropean'.tr;

  /// Formats a pollutant concentration for display, or an em dash when missing.
  static String formatConcentration(double? value) {
    if (value == null) return '—';
    final rounded = value < 10
        ? value.toStringAsFixed(1)
        : value.round().toString();
    return '$rounded µg/m³';
  }

  /// Whether [card] has a non-null AQI value at [index] for [standard].
  static bool hasData(WeatherCard card, int index, String standard) {
    if (index < 0) return false;
    final values = _isAmerican(standard) ? card.usAqi : card.europeanAqi;
    return values != null && index < values.length && values[index] != null;
  }

  static String _howCalculatedHelp(String standard) =>
      (_howCalculatedKeys[standard] ?? _howCalculatedKeys[european]!).tr;

  /// Localized EEA band label for a pollutant concentration (bar scale).
  static String _pollutantBandLabel(String pollutantKey, double value) =>
      _euLabelKeys[pollutantBandIndex(pollutantKey, value)].tr;

  /// Concentration and EEA band, without the pollutant name prefix.
  static String _pollutantLevelSummary(String pollutantKey, double value) =>
      '${formatConcentration(value)} — ${_pollutantBandLabel(pollutantKey, value)}';

  /// Full pollutant row for long-press help.
  static String _pollutantLine(String pollutantKey, double value) =>
      '${pollutantKey.tr}: ${_pollutantLevelSummary(pollutantKey, value)}';

  /// One pass over [pollutantKeys]: help lines and the highest EEA band.
  static ({List<String> lines, ({String key, double value})? dominant})
  _pollutantSummaries(WeatherCard card, int hourIndex) {
    final lines = <String>[];
    String? dominantKey;
    double? dominantValue;
    var bestBand = -1;

    for (final key in pollutantKeys) {
      final value = pollutantValue(card, hourIndex, key);
      if (value == null) continue;

      lines.add(_pollutantLine(key, value));
      final band = pollutantBandIndex(key, value);
      if (band > bestBand) {
        bestBand = band;
        dominantKey = key;
        dominantValue = value;
      }
    }

    return (
      lines: lines,
      dominant: dominantKey == null
          ? null
          : (key: dominantKey, value: dominantValue!),
    );
  }
}
