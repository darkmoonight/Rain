import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/main.dart';
import 'package:timezone/timezone.dart';

class StatusData {
  String getDegree(dynamic degree) {
    return _formatDegree(degree);
  }

  String getSpeed(int? speed) {
    return _formatSpeed(speed);
  }

  String getPressure(int? pressure) {
    return _formatPressure(pressure);
  }

  String getVisibility(double? length) {
    return _formatVisibility(length);
  }

  String getPrecipitation(double? precipitation) {
    return _formatPrecipitation(precipitation);
  }

  String getTimeFormat(String time) {
    return _formatTime(time);
  }

  String getTimeFormatTz(TZDateTime time) {
    return _formatTimeTz(time);
  }

  String _formatDegree(dynamic degree) {
    switch (settings.degrees) {
      case 'celsius':
        return '$degree°C';
      case 'fahrenheit':
        return '$degree°F';
      default:
        return '$degree°C';
    }
  }

  String _formatSpeed(int? speed) {
    if (speed == null) return '';

    switch (settings.measurements) {
      case 'metric':
        return settings.wind == 'm/s'
            ? '${(speed * (5 / 18)).toPrecision(1)} ${'m/s'.tr}'
            : '$speed ${'kph'.tr}';
      case 'imperial':
        return '$speed ${'mph'.tr}';
      default:
        return '$speed ${'kph'.tr}';
    }
  }

  String _formatPressure(int? pressure) {
    if (pressure == null) return '';

    return settings.pressure == 'mmHg'
        ? '${(pressure * (3 / 4)).toPrecision(1)} ${'mmHg'.tr}'
        : '$pressure ${'hPa'.tr}';
  }

  String _formatVisibility(double? length) {
    if (length == null) return '';

    switch (settings.measurements) {
      case 'metric':
        return _formatMetricVisibility(length);
      case 'imperial':
        return _formatImperialVisibility(length);
      default:
        return _formatMetricVisibility(length);
    }
  }

  String _formatMetricVisibility(double length) {
    return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'km'.tr}';
  }

  String _formatImperialVisibility(double length) {
    return '${length > 5280 ? (length / 5280).round() : (length / 5280).toStringAsFixed(2)} ${'mi'.tr}';
  }

  String _formatPrecipitation(double? precipitation) {
    if (precipitation == null) return '';

    switch (settings.measurements) {
      case 'metric':
        return '$precipitation ${'mm'.tr}';
      case 'imperial':
        return '$precipitation ${'inch'.tr}';
      default:
        return '$precipitation ${'mm'.tr}';
    }
  }

  String _formatTime(String time) {
    final parsedTime = DateTime.tryParse(time);
    if (parsedTime == null) return '';

    switch (settings.timeformat) {
      case '12':
        return DateFormat.jm(locale.languageCode).format(parsedTime);
      case '24':
        return DateFormat.Hm(locale.languageCode).format(parsedTime);
      default:
        return DateFormat.Hm(locale.languageCode).format(parsedTime);
    }
  }

  String _formatTimeTz(TZDateTime time) {
    switch (settings.timeformat) {
      case '12':
        return DateFormat.jm(locale.languageCode).format(time);
      case '24':
        return DateFormat.Hm(locale.languageCode).format(time);
      default:
        return DateFormat.Hm(locale.languageCode).format(time);
    }
  }
}
