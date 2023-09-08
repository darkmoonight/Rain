import 'package:get/get.dart';

class StatusWeather {
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
          return 'assets/images/fog_moon.png';
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
        return 'assets/images/rain.png';
      case 80:
      case 81:
      case 82:
        return 'assets/images/rain-fall.png';
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

  String getImageNowDaily(int? weather, DateTime time) {
    switch (weather) {
      case 0:
        return 'assets/images/sun.png';
      case 1:
      case 2:
      case 3:
        return 'assets/images/cloud.png';
      case 45:
      case 48:
        return 'assets/images/fog.png';
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
        return 'assets/images/rain.png';
      case 80:
      case 81:
      case 82:
        return 'assets/images/rain-fall.png';
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
          return 'assets/images/clear_day.png';
        } else {
          return 'assets/images/clear_night.png';
        }
      case 1:
      case 2:
      case 3:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/cloudy_day.png';
        } else {
          return 'assets/images/cloudy_night.png';
        }
      case 45:
      case 48:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/fog_day.png';
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
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/rain_day.png';
        } else {
          return 'assets/images/rain_night.png';
        }
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/snow_day.png';
        } else {
          return 'assets/images/snow_night.png';
        }
      case 95:
      case 96:
      case 99:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'assets/images/thunder_day.png';
        } else {
          return 'assets/images/thunder_night.png';
        }
      default:
        return '';
    }
  }

  String getImage7Day(int? weather) {
    switch (weather) {
      case 0:
        return 'assets/images/clear_day.png';
      case 1:
      case 2:
      case 3:
        return 'assets/images/cloudy_day.png';
      case 45:
      case 48:
        return 'assets/images/fog_day.png';
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
        return 'assets/images/rain_day.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'assets/images/snow_day.png';
      case 95:
      case 96:
      case 99:
        return 'assets/images/thunder_day.png';
      default:
        return '';
    }
  }

  String getText(int? weather) {
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

  String getImageNotification(
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
          return 'sun.png';
        } else {
          return 'full-moon.png';
        }
      case 1:
      case 2:
      case 3:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'cloud.png';
        } else {
          return 'moon.png';
        }
      case 45:
      case 48:
        if (currentTime.isAfter(dayTime) && currentTime.isBefore(nightTime)) {
          return 'fog.png';
        } else {
          return 'fog_moon.png';
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
        return 'rain.png';
      case 80:
      case 81:
      case 82:
        return 'rain-fall.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'snow.png';
      case 95:
        return 'thunder.png';
      case 96:
      case 99:
        return 'storm.png';
      default:
        return '';
    }
  }
}
