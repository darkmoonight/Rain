import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/weather/time_index_helper.dart';
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
    if (degree == null) return '';
    final num? value = degree is num ? degree : num.tryParse('$degree');
    if (value == null) return '';
    final display = settings.roundDegree ? value.round() : value;
    switch (settings.degrees) {
      case 'fahrenheit':
        return '$display°F';
      default:
        return '$display°C';
    }
  }

  String _formatSpeed(int? speed) {
    if (speed == null) return '';
    switch (settings.measurements) {
      case 'imperial':
        return '$speed ${_t('mph')}';
      default:
        return settings.wind == 'm/s'
            ? '${(speed * (5 / 18)).toStringAsFixed(1)} ${_t('m/s')}'
            : '$speed ${_t('kph')}';
    }
  }

  String _formatPressure(int? pressure) {
    if (pressure == null) return '';
    return settings.pressure == 'mmHg'
        ? '${(pressure * (3 / 4)).toStringAsFixed(1)} ${_t('mmHg')}'
        : '$pressure ${_t('hPa')}';
  }

  String _formatVisibility(double? length) {
    if (length == null) return '';
    switch (settings.measurements) {
      case 'imperial':
        return _formatImperialVisibility(length);
      default:
        return _formatMetricVisibility(length);
    }
  }

  String _formatMetricVisibility(double length) =>
      '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${_t('km')}';

  String _formatImperialVisibility(double length) =>
      '${length > 5280 ? (length / 5280).round() : (length / 5280).toStringAsFixed(2)} ${_t('mi')}';

  String _formatPrecipitation(double? precipitation) {
    if (precipitation == null) return '';
    switch (settings.measurements) {
      case 'imperial':
        return '$precipitation ${_t('inch')}';
      default:
        return '$precipitation ${_t('mm')}';
    }
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
