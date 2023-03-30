import 'package:get/get.dart';
import 'package:rain/main.dart';

class StatusImFa {
  String getDegree(int degree) {
    switch (settings.degrees) {
      case 'celsius':
        return '$degree°C';
      case 'fahrenheit':
        return '$degree°F';
      default:
        return '$degree°C';
    }
  }

  String getSpeed(int speed) {
    switch (settings.measurements) {
      case 'metric':
        return '$speed ${'kph'.tr}';
      case 'imperial':
        return '$speed ${'mph'.tr}';
      default:
        return '$speed ${'kph'.tr}';
    }
  }

  String getVisibility(double length) {
    switch (settings.measurements) {
      case 'metric':
        return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'km'.tr}';
      case 'imperial':
        return '${length > 5280 ? (length / 5280).round() : (length / 5280).toStringAsFixed(2)} ${'mi'.tr}';
      default:
        return '${length > 1000 ? (length / 1000).round() : (length / 1000).toStringAsFixed(2)} ${'km'.tr}';
    }
  }

  String getPrecipitation(double precipitation) {
    switch (settings.measurements) {
      case 'metric':
        return '$precipitation ${'mm'.tr}';
      case 'imperial':
        return '$precipitation ${'inch'.tr}';
      default:
        return '$precipitation ${'mm'.tr}';
    }
  }
}
