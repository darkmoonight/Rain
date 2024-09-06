import 'package:get/get.dart';

class Message {
  String getPressure(int? pressure) {
    if (pressure != null) {
      if (pressure < 1000) {
        return 'low'.tr;
      } else if (pressure > 1020) {
        return 'high'.tr;
      } else {
        return 'normal'.tr;
      }
    } else {
      return '';
    }
  }

  String getUvIndex(int? uvIndex) {
    if (uvIndex != null) {
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
    } else {
      return '';
    }
  }

  String getDirection(int? direction) {
    if (direction != null) {
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
    } else {
      return '';
    }
  }
}
