import 'package:get/get.dart';

class Message {
  String getPressure(int? pressure) {
    return _getPressureDescription(pressure);
  }

  String getUvIndex(int? uvIndex) {
    return _getUvIndexDescription(uvIndex);
  }

  String getDirection(int? direction) {
    return _getDirectionDescription(direction);
  }

  String _getPressureDescription(int? pressure) {
    if (pressure == null) return '';

    if (pressure < 1000) {
      return 'low'.tr;
    } else if (pressure > 1020) {
      return 'high'.tr;
    } else {
      return 'normal'.tr;
    }
  }

  String _getUvIndexDescription(int? uvIndex) {
    if (uvIndex == null) return '';

    if (uvIndex < 3) {
      return 'uvLow'.tr;
    } else if (uvIndex < 6) {
      return 'uvAverage'.tr;
    } else if (uvIndex < 8) {
      return 'uvHigh'.tr;
    } else if (uvIndex < 11) {
      return 'uvVeryHigh'.tr;
    } else {
      return 'uvExtreme'.tr;
    }
  }

  String _getDirectionDescription(int? direction) {
    if (direction == null) return '';

    if (direction >= 337.5 || direction < 22.5) {
      return 'north'.tr;
    } else if (direction >= 22.5 && direction < 67.5) {
      return 'northeast'.tr;
    } else if (direction >= 67.5 && direction < 112.5) {
      return 'east'.tr;
    } else if (direction >= 112.5 && direction < 157.5) {
      return 'southeast'.tr;
    } else if (direction >= 157.5 && direction < 202.5) {
      return 'south'.tr;
    } else if (direction >= 202.5 && direction < 247.5) {
      return 'southwest'.tr;
    } else if (direction >= 247.5 && direction < 292.5) {
      return 'west'.tr;
    } else {
      return 'northwest'.tr;
    }
  }
}
