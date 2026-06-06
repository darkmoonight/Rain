import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/unit_converter.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart';

/// Formats cached weather values for display using [Settings] and locale.
class StatusData {
  StatusData({required this.settings, Locale? locale})
    : _locale = locale ?? LocaleSettings.instance.currentLocale.flutterLocale;

  final Settings settings;
  final Locale _locale;

  /// Looks up a dynamic i18n string by key.
  String _t(String key) => trDynamic(key);

  /// Returns temperature with unit suffix for display.
  String getDegree(dynamic degree) => _formatDegree(degree);

  /// Returns wind speed with localized unit for display.
  String getSpeed(int? speed) => _formatSpeed(speed);

  /// Returns pressure with localized unit for display.
  String getPressure(int? pressure) => _formatPressure(pressure);

  /// Returns visibility distance with localized unit for display.
  String getVisibility(double? length) => _formatVisibility(length);

  /// Returns precipitation amount with localized unit for display.
  String getPrecipitation(double? precipitation) =>
      _formatPrecipitation(precipitation);

  /// Formats an ISO time string using the user's clock preference.
  String getTimeFormat(String time) => _formatTime(time);

  /// Formats a timezone-aware time using the user's clock preference.
  String getTimeFormatTz(TZDateTime time) => _formatTimeTz(time);

  /// Converts a raw temperature value into a display string.
  String _formatDegree(dynamic degree) {
    final converted = UnitConverter.convertTemperature(degree, settings);
    if (converted == null) return '';
    return '$converted${UnitConverter.temperatureSuffix(settings)}';
  }

  /// Converts a wind speed value into a display string with unit.
  String _formatSpeed(int? speed) {
    final formatted = UnitConverter.formatWindSpeed(speed, settings);
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.windSpeedUnitKey(settings))}';
  }

  /// Converts a pressure value into a display string with unit.
  String _formatPressure(int? pressure) {
    final formatted = UnitConverter.formatPressure(pressure, settings);
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.pressureUnitKey(settings))}';
  }

  /// Converts a visibility value into a display string with unit.
  String _formatVisibility(double? length) {
    final formatted = UnitConverter.formatVisibility(length, settings);
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.visibilityUnitKey(settings))}';
  }

  /// Converts a precipitation value into a display string with unit.
  String _formatPrecipitation(double? precipitation) {
    final formatted = UnitConverter.formatPrecipitation(
      precipitation,
      settings,
    );
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.precipitationUnitKey(settings))}';
  }

  /// Parses and formats an ISO time string for the current locale.
  String _formatTime(String time) {
    final parsedTime = DateTime.tryParse(time);
    if (parsedTime == null) return '';
    return TimeIndexHelper.formatDateTime(
      parsedTime,
      settings,
      _locale.languageCode,
    );
  }

  /// Formats a [TZDateTime] for the current locale and clock preference.
  String _formatTimeTz(TZDateTime time) =>
      TimeIndexHelper.formatDateTime(time, settings, _locale.languageCode);
}
