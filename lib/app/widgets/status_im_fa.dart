import 'package:get/get.dart';
import 'package:rain/main.dart';

class StatusImFa {
  String getDegree(int degree) {
    switch (settings.degrees) {
      case 'fahrenheit':
        return '$degree°F';
      case 'celsius':
        return '$degree°C';
      default:
        return '';
    }
  }

  String getSpeed(int speed) {
    switch (settings.measurements) {
      case 'imperial':
        return '$speed ${'mph'.tr}';
      case 'metric':
        return '$speed ${'kph'.tr}';
      default:
        return '';
    }
  }

  String getVisibility(double length) {
    switch (settings.measurements) {
      case 'imperial':
        return '${length > 5280 ? (length / 5280).round() : (length / 5280).toStringAsFixed(2)} ${'mi'.tr}';
      case 'metric':
        return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'km'.tr}';
      default:
        return '';
    }
  }

  String getPrecipitation(double precipitation) {
    switch (settings.measurements) {
      case 'imperial':
        return '$precipitation ${'inch'.tr}';
      case 'metric':
        return '$precipitation ${'mm'.tr}';
      default:
        return '';
    }
  }
}
