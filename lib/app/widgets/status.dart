import 'package:get/get.dart';

class Status {
  String getImageNow(
      int weather, String time, String timeDay, String timeNight) {
    final currentTime = DateTime.parse(time);
    final day = DateTime.parse(timeDay);
    final night = DateTime.parse(timeNight);

    final dayTime =
        DateTime(day.year, day.month, day.day, day.hour, day.minute);
    final nightTime =
        DateTime(night.year, night.month, night.day, night.hour, night.minute);

    switch (weather) {
      case 0:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/sun.png';
        } else {
          return 'assets/images/full-moon.png';
        }
      case 1:
      case 2:
      case 3:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/cloud.png';
        } else {
          return 'assets/images/moon.png';
        }
      case 45:
      case 48:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/fog.png';
        } else {
          return 'assets/images/fog_night.png';
        }
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
        return 'assets/images/rain.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'assets/images/snow.png';
      case 95:
        return 'assets/images/thunder.png';
      case 96:
      case 99:
        return 'assets/images/storm.png';
      default:
        return '';
    }
  }

  String getImageToday(
      String time, int weather, String timeDay, String timeNight) {
    final currentTime = DateTime.parse(time);
    final day = DateTime.parse(timeDay);
    final night = DateTime.parse(timeNight);

    final dayTime =
        DateTime(day.year, day.month, day.day, day.hour, day.minute);
    final nightTime =
        DateTime(night.year, night.month, night.day, night.hour, night.minute);

    switch (weather) {
      case 0:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/01d.png';
        } else {
          return 'assets/images/01n.png';
        }
      case 1:
      case 2:
      case 3:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/02d.png';
        } else {
          return 'assets/images/02n.png';
        }
      case 45:
      case 48:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/50d.png';
        } else {
          return 'assets/images/50n.png';
        }
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/10d.png';
        } else {
          return 'assets/images/10n.png';
        }
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/13d.png';
        } else {
          return 'assets/images/13n.png';
        }
      case 95:
      case 96:
      case 99:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/11d.png';
        } else {
          return 'assets/images/11n.png';
        }
      default:
        return '';
    }
  }

  String getImage7Day(int weather) {
    switch (weather) {
      case 0:
        return 'assets/images/01d.png';
      case 1:
      case 2:
      case 3:
        return 'assets/images/02d.png';
      case 45:
      case 48:
        return 'assets/images/50d.png';
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
        return 'assets/images/10d.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'assets/images/13d.png';
      case 95:
      case 96:
      case 99:
        return 'assets/images/11d.png';
      default:
        return '';
    }
  }

  String getText(int weather) {
    switch (weather) {
      case 0:
        return 'clear_sky'.tr;
      case 1:
      case 2:
        return 'cloudy'.tr;
      case 3:
        return 'overcast'.tr;
      case 45:
      case 48:
        return 'fog'.tr;
      case 51:
      case 53:
      case 55:
        return 'drizzle'.tr;
      case 56:
      case 57:
        return 'drizzling_rain'.tr;
      case 61:
      case 63:
      case 65:
        return 'rain'.tr;
      case 66:
      case 67:
        return 'freezing_rain'.tr;
      case 80:
      case 81:
      case 82:
        return 'heavy_rains'.tr;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'snow'.tr;
      case 95:
      case 96:
      case 99:
        return 'thunderstorm'.tr;
      default:
        return '';
    }
  }
}
