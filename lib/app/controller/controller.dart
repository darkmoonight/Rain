class Controller {
  String getImageNow(weather) {
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
      case 96:
      case 99:
        return 'assets/images/storm.png';
      default:
        return '';
    }
  }

  String getImageToday(time, weather) {
    final currentTime = DateTime.parse(time);

    final dayTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day, 6, 00);
    final nightTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day, 19, 00);

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

  String getImage7Day(weather) {
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

  String getText(weather) {
    switch (weather) {
      case 0:
        return 'Чистое небо';
      case 1:
      case 2:
        return 'Облачно';
      case 3:
        return 'Пасмурно';
      case 45:
      case 48:
        return 'Туман';
      case 51:
      case 53:
      case 55:
        return 'Морось';
      case 56:
      case 57:
        return 'Моросящий дождь';
      case 61:
      case 63:
      case 65:
        return 'Дождь';
      case 66:
      case 67:
        return 'Ледяной дождь';
      case 80:
      case 81:
      case 82:
        return 'Ливневые дожди';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'Снег';
      case 95:
      case 96:
      case 99:
        return 'Гроза';
      default:
        return '';
    }
  }
}
