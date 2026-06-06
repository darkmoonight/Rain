import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/i18n/tr.dart';

/// Root path for bundled weather condition image assets.
const assetImageRoot = 'assets/images/';

/// Maps WMO weather codes to localized text and context-specific icons.
class StatusWeather {
  /// Returns the current-condition icon path for day or night.
  String getImageNow(
    int weather,
    String time,
    String timeDay,
    String timeNight,
  ) => _getImageBasedOnTime(
    weather,
    time,
    timeDay,
    timeNight,
    _getDayNightImagePaths,
  );

  /// Returns a simplified daily-forecast icon path.
  String getImageNowDaily(int? weather) => _getDailyImage(weather);

  /// Returns the today-summary icon path for day or night.
  String getImageToday(
    int weather,
    String time,
    String timeDay,
    String timeNight,
  ) => _getImageBasedOnTime(
    weather,
    time,
    timeDay,
    timeNight,
    _getTodayImagePaths,
  );

  /// Returns a day-variant icon path for the 7-day forecast row.
  String getImage7Day(int? weather) => _getDailyImage(weather, isDay: true);

  /// Returns localized weather description text for [weather].
  String getText(int? weather) => _getWeatherText(weather);

  /// Returns a notification icon filename for day or night.
  String getImageNotification(
    int weather,
    String time,
    String timeDay,
    String timeNight,
  ) => _getImageBasedOnTime(
    weather,
    time,
    timeDay,
    timeNight,
    _getNotificationImagePaths,
  );

  // --- Private helpers ---

  /// Picks a day or night icon from [imagePaths] based on sunrise/sunset.
  String _getImageBasedOnTime(
    int weather,
    String time,
    String timeDay,
    String timeNight,
    Map<int, Map<bool, String>> imagePaths,
  ) {
    final isDayTime = TimeIndexHelper.isDaytime(time, timeDay, timeNight);
    return imagePaths[weather]?[isDayTime] ?? '';
  }

  /// Returns a simplified forecast icon path for WMO code [weather].
  String _getDailyImage(int? weather, {bool isDay = false}) {
    switch (weather) {
      case 0:
        return '$assetImageRoot${isDay ? 'clear_day' : 'sun'}.png';
      case 1:
      case 2:
      case 3:
        return '$assetImageRoot${isDay ? 'cloudy_day' : 'cloud'}.png';
      case 45:
      case 48:
        return '${assetImageRoot}fog${isDay ? '_day' : ''}.png';
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
        return '${assetImageRoot}rain${isDay ? '_day' : ''}.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return '${assetImageRoot}snow${isDay ? '_day' : ''}.png';
      case 95:
      case 96:
      case 99:
        return '${assetImageRoot}thunder${isDay ? '_day' : ''}.png';
      default:
        return '';
    }
  }

  /// Returns localized description text for WMO code [weather].
  String _getWeatherText(int? weather) {
    String t(String key) => trDynamic(key);
    switch (weather) {
      case 0:
        return t('clear_sky');
      case 1:
      case 2:
        return t('cloudy');
      case 3:
        return t('overcast');
      case 45:
      case 48:
        return t('fog');
      case 51:
      case 53:
      case 55:
        return t('drizzle');
      case 56:
      case 57:
        return t('drizzling_rain');
      case 61:
      case 63:
      case 65:
        return t('rain');
      case 66:
      case 67:
        return t('freezing_rain');
      case 80:
      case 81:
      case 82:
        return t('heavy_rains');
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return t('snow');
      case 95:
      case 96:
      case 99:
        return t('thunderstorm');
      default:
        return '';
    }
  }

  // Image path maps

  final Map<int, Map<bool, String>> _getDayNightImagePaths = {
    0: {
      true: '${assetImageRoot}sun.png',
      false: '${assetImageRoot}full-moon.png',
    },
    1: {true: '${assetImageRoot}cloud.png', false: '${assetImageRoot}moon.png'},
    2: {true: '${assetImageRoot}cloud.png', false: '${assetImageRoot}moon.png'},
    3: {true: '${assetImageRoot}cloud.png', false: '${assetImageRoot}moon.png'},
    45: {
      true: '${assetImageRoot}fog.png',
      false: '${assetImageRoot}fog_moon.png',
    },
    48: {
      true: '${assetImageRoot}fog.png',
      false: '${assetImageRoot}fog_moon.png',
    },
    51: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    53: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    55: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    56: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    57: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    61: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    63: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    65: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    66: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    67: {true: '${assetImageRoot}rain.png', false: '${assetImageRoot}rain.png'},
    80: {
      true: '${assetImageRoot}rain-fall.png',
      false: '${assetImageRoot}rain-fall.png',
    },
    81: {
      true: '${assetImageRoot}rain-fall.png',
      false: '${assetImageRoot}rain-fall.png',
    },
    82: {
      true: '${assetImageRoot}rain-fall.png',
      false: '${assetImageRoot}rain-fall.png',
    },
    71: {true: '${assetImageRoot}snow.png', false: '${assetImageRoot}snow.png'},
    73: {true: '${assetImageRoot}snow.png', false: '${assetImageRoot}snow.png'},
    75: {true: '${assetImageRoot}snow.png', false: '${assetImageRoot}snow.png'},
    77: {true: '${assetImageRoot}snow.png', false: '${assetImageRoot}snow.png'},
    85: {true: '${assetImageRoot}snow.png', false: '${assetImageRoot}snow.png'},
    86: {true: '${assetImageRoot}snow.png', false: '${assetImageRoot}snow.png'},
    95: {
      true: '${assetImageRoot}thunder.png',
      false: '${assetImageRoot}thunder.png',
    },
    96: {
      true: '${assetImageRoot}storm.png',
      false: '${assetImageRoot}storm.png',
    },
    99: {
      true: '${assetImageRoot}storm.png',
      false: '${assetImageRoot}storm.png',
    },
  };

  final Map<int, Map<bool, String>> _getTodayImagePaths = {
    0: {
      true: '${assetImageRoot}clear_day.png',
      false: '${assetImageRoot}clear_night.png',
    },
    1: {
      true: '${assetImageRoot}cloudy_day.png',
      false: '${assetImageRoot}cloudy_night.png',
    },
    2: {
      true: '${assetImageRoot}cloudy_day.png',
      false: '${assetImageRoot}cloudy_night.png',
    },
    3: {
      true: '${assetImageRoot}cloudy_day.png',
      false: '${assetImageRoot}cloudy_night.png',
    },
    45: {
      true: '${assetImageRoot}fog_day.png',
      false: '${assetImageRoot}fog_night.png',
    },
    48: {
      true: '${assetImageRoot}fog_day.png',
      false: '${assetImageRoot}fog_night.png',
    },
    51: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    53: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    55: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    56: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    57: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    61: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    63: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    65: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    66: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    67: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    80: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    81: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    82: {
      true: '${assetImageRoot}rain_day.png',
      false: '${assetImageRoot}rain_night.png',
    },
    71: {
      true: '${assetImageRoot}snow_day.png',
      false: '${assetImageRoot}snow_night.png',
    },
    73: {
      true: '${assetImageRoot}snow_day.png',
      false: '${assetImageRoot}snow_night.png',
    },
    75: {
      true: '${assetImageRoot}snow_day.png',
      false: '${assetImageRoot}snow_night.png',
    },
    77: {
      true: '${assetImageRoot}snow_day.png',
      false: '${assetImageRoot}snow_night.png',
    },
    85: {
      true: '${assetImageRoot}snow_day.png',
      false: '${assetImageRoot}snow_night.png',
    },
    86: {
      true: '${assetImageRoot}snow_day.png',
      false: '${assetImageRoot}snow_night.png',
    },
    95: {
      true: '${assetImageRoot}thunder_day.png',
      false: '${assetImageRoot}thunder_night.png',
    },
    96: {
      true: '${assetImageRoot}thunder_day.png',
      false: '${assetImageRoot}thunder_night.png',
    },
    99: {
      true: '${assetImageRoot}thunder_day.png',
      false: '${assetImageRoot}thunder_night.png',
    },
  };

  final Map<int, Map<bool, String>> _getNotificationImagePaths = {
    0: {true: 'sun.png', false: 'full-moon.png'},
    1: {true: 'cloud.png', false: 'moon.png'},
    2: {true: 'cloud.png', false: 'moon.png'},
    3: {true: 'cloud.png', false: 'moon.png'},
    45: {true: 'fog.png', false: 'fog_moon.png'},
    48: {true: 'fog.png', false: 'fog_moon.png'},
    51: {true: 'rain.png', false: 'rain.png'},
    53: {true: 'rain.png', false: 'rain.png'},
    55: {true: 'rain.png', false: 'rain.png'},
    56: {true: 'rain.png', false: 'rain.png'},
    57: {true: 'rain.png', false: 'rain.png'},
    61: {true: 'rain.png', false: 'rain.png'},
    63: {true: 'rain.png', false: 'rain.png'},
    65: {true: 'rain.png', false: 'rain.png'},
    66: {true: 'rain.png', false: 'rain.png'},
    67: {true: 'rain.png', false: 'rain.png'},
    80: {true: 'rain-fall.png', false: 'rain-fall.png'},
    81: {true: 'rain-fall.png', false: 'rain-fall.png'},
    82: {true: 'rain-fall.png', false: 'rain-fall.png'},
    71: {true: 'snow.png', false: 'snow.png'},
    73: {true: 'snow.png', false: 'snow.png'},
    75: {true: 'snow.png', false: 'snow.png'},
    77: {true: 'snow.png', false: 'snow.png'},
    85: {true: 'snow.png', false: 'snow.png'},
    86: {true: 'snow.png', false: 'snow.png'},
    95: {true: 'thunder.png', false: 'thunder.png'},
    96: {true: 'storm.png', false: 'storm.png'},
    99: {true: 'storm.png', false: 'storm.png'},
  };
}
