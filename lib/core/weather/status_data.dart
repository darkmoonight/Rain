import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/unit_converter.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart';

class StatusData {
  StatusData({required this.settings, Locale? locale})
    : _locale = locale ?? LocaleSettings.instance.currentLocale.flutterLocale;

  final Settings settings;
  final Locale _locale;

  String _t(String key) => trDynamic(key);

  String getDegree(dynamic degree) => _formatDegree(degree);

  String getSpeed(int? speed) => _formatSpeed(speed);

  String getPressure(int? pressure) => _formatPressure(pressure);

  String getVisibility(double? length) => _formatVisibility(length);

  String getPrecipitation(double? precipitation) =>
      _formatPrecipitation(precipitation);

  String getTimeFormat(String time) => _formatTime(time);

  String getTimeFormatTz(TZDateTime time) => _formatTimeTz(time);

  String _formatDegree(dynamic degree) {
    final converted = UnitConverter.convertTemperature(degree, settings);
    if (converted == null) return '';
    return '$converted${UnitConverter.temperatureSuffix(settings)}';
  }

  String _formatSpeed(int? speed) {
    final formatted = UnitConverter.formatWindSpeed(speed, settings);
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.windSpeedUnitKey(settings))}';
  }

  String _formatPressure(int? pressure) {
    final formatted = UnitConverter.formatPressure(pressure, settings);
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.pressureUnitKey(settings))}';
  }

  String _formatVisibility(double? length) {
    final formatted = UnitConverter.formatVisibility(length, settings);
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.visibilityUnitKey(settings))}';
  }

  String _formatPrecipitation(double? precipitation) {
    final formatted = UnitConverter.formatPrecipitation(
      precipitation,
      settings,
    );
    if (formatted == null) return '';
    return '$formatted ${_t(UnitConverter.precipitationUnitKey(settings))}';
  }

  String _formatTime(String time) {
    final parsedTime = DateTime.tryParse(time);
    if (parsedTime == null) return '';
    return TimeIndexHelper.formatDateTime(
      parsedTime,
      settings,
      _locale.languageCode,
    );
  }

  String _formatTimeTz(TZDateTime time) =>
      TimeIndexHelper.formatDateTime(time, settings, _locale.languageCode);
}
