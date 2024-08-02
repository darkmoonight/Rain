import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/main.dart';
import 'package:timezone/timezone.dart';

class StatusData {
  String getDegree(degree) {
    switch (settings.degrees) {
      case 'celsius':
        return '$degree°C';
      case 'fahrenheit':
        return '$degree°F';
      default:
        return '$degree°C';
    }
  }

  String getSpeed(int? speed) {
    switch (settings.measurements) {
      case 'metric':
        return settings.wind == 'm/s'
            ? '${(speed! * (5 / 18)).toPrecision(1)} ${'m/s'.tr}'
            : '$speed ${'kph'.tr}';
      case 'imperial':
        return '$speed ${'mph'.tr}';
      default:
        return '$speed ${'kph'.tr}';
    }
  }

  String getPressure(int? pressure) {
    return settings.pressure == 'mmHg'
        ? '${(pressure! * (3 / 4)).toPrecision(1)} ${'mmHg'.tr}'
        : '$pressure ${'hPa'.tr}';
  }

  String getVisibility(double? length) {
    if (length != null) {
      switch (settings.measurements) {
        case 'metric':
          return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'km'.tr}';
        case 'imperial':
          return '${length > 5280 ? (length / 5280).round() : (length / 5280).toStringAsFixed(2)} ${'mi'.tr}';
        default:
          return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'km'.tr}';
      }
    } else {
      return '';
    }
  }

  String getPrecipitation(double? precipitation) {
    switch (settings.measurements) {
      case 'metric':
        return '$precipitation ${'mm'.tr}';
      case 'imperial':
        return '$precipitation ${'inch'.tr}';
      default:
        return '$precipitation ${'mm'.tr}';
    }
  }

  String getTimeFormat(String time) {
    switch (settings.timeformat) {
      case '12':
        return DateFormat.jm(locale.languageCode)
            .format(DateTime.tryParse(time)!);
      case '24':
        return DateFormat.Hm(locale.languageCode)
            .format(DateTime.tryParse(time)!);
      default:
        return DateFormat.Hm(locale.languageCode)
            .format(DateTime.tryParse(time)!);
    }
  }

  String getTimeFormatTz(TZDateTime time) {
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
