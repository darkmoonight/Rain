import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:rain/i18n/tr.dart';

/// Maps WMO weather codes to localized text and context-specific icons.
class StatusWeather {
  StatusWeather({String? assetRoot})
    : assetRoot = assetRoot ?? WeatherIconTheme.assetRoot(null);

  final String assetRoot;

  /// Builds a mapper for the persisted [themeId] from settings.
  factory StatusWeather.forTheme(String? themeId) =>
      StatusWeather(assetRoot: WeatherIconTheme.assetRoot(themeId));

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
    _dayNightImagePaths,
  );

  /// Returns a simplified daily-forecast icon path.
  String getImageNowDaily(int? weather) => _getDailyImage(weather);

  /// Returns the today-summary icon path for day or night.
  String getImageToday(
    int weather,
    String time,
    String timeDay,
    String timeNight,
  ) =>
      _getImageBasedOnTime(weather, time, timeDay, timeNight, _todayImagePaths);

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
    _notificationImagePaths,
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
        return '$assetRoot${isDay ? 'clear_day' : 'sun'}.png';
      case 1:
      case 2:
      case 3:
        return '$assetRoot${isDay ? 'cloudy_day' : 'cloud'}.png';
      case 45:
      case 48:
        return '${assetRoot}fog${isDay ? '_day' : ''}.png';
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
        return '${assetRoot}rain${isDay ? '_day' : ''}.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return '${assetRoot}snow${isDay ? '_day' : ''}.png';
      case 95:
      case 96:
      case 99:
        return '${assetRoot}thunder${isDay ? '_day' : ''}.png';
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

  Map<int, Map<bool, String>> get _dayNightImagePaths => {
    0: {true: '${assetRoot}sun.png', false: '${assetRoot}full-moon.png'},
    1: {true: '${assetRoot}cloud.png', false: '${assetRoot}moon.png'},
    2: {true: '${assetRoot}cloud.png', false: '${assetRoot}moon.png'},
    3: {true: '${assetRoot}cloud.png', false: '${assetRoot}moon.png'},
    45: {true: '${assetRoot}fog.png', false: '${assetRoot}fog_moon.png'},
    48: {true: '${assetRoot}fog.png', false: '${assetRoot}fog_moon.png'},
    51: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    53: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    55: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    56: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    57: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    61: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    63: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    65: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    66: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    67: {true: '${assetRoot}rain.png', false: '${assetRoot}rain.png'},
    80: {true: '${assetRoot}rain-fall.png', false: '${assetRoot}rain-fall.png'},
    81: {true: '${assetRoot}rain-fall.png', false: '${assetRoot}rain-fall.png'},
    82: {true: '${assetRoot}rain-fall.png', false: '${assetRoot}rain-fall.png'},
    71: {true: '${assetRoot}snow.png', false: '${assetRoot}snow.png'},
    73: {true: '${assetRoot}snow.png', false: '${assetRoot}snow.png'},
    75: {true: '${assetRoot}snow.png', false: '${assetRoot}snow.png'},
    77: {true: '${assetRoot}snow.png', false: '${assetRoot}snow.png'},
    85: {true: '${assetRoot}snow.png', false: '${assetRoot}snow.png'},
    86: {true: '${assetRoot}snow.png', false: '${assetRoot}snow.png'},
    95: {true: '${assetRoot}thunder.png', false: '${assetRoot}thunder.png'},
    96: {true: '${assetRoot}storm.png', false: '${assetRoot}storm.png'},
    99: {true: '${assetRoot}storm.png', false: '${assetRoot}storm.png'},
  };

  Map<int, Map<bool, String>> get _todayImagePaths => {
    0: {
      true: '${assetRoot}clear_day.png',
      false: '${assetRoot}clear_night.png',
    },
    1: {
      true: '${assetRoot}cloudy_day.png',
      false: '${assetRoot}cloudy_night.png',
    },
    2: {
      true: '${assetRoot}cloudy_day.png',
      false: '${assetRoot}cloudy_night.png',
    },
    3: {
      true: '${assetRoot}cloudy_day.png',
      false: '${assetRoot}cloudy_night.png',
    },
    45: {true: '${assetRoot}fog_day.png', false: '${assetRoot}fog_night.png'},
    48: {true: '${assetRoot}fog_day.png', false: '${assetRoot}fog_night.png'},
    51: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    53: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    55: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    56: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    57: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    61: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    63: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    65: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    66: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    67: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    80: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    81: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    82: {true: '${assetRoot}rain_day.png', false: '${assetRoot}rain_night.png'},
    71: {true: '${assetRoot}snow_day.png', false: '${assetRoot}snow_night.png'},
    73: {true: '${assetRoot}snow_day.png', false: '${assetRoot}snow_night.png'},
    75: {true: '${assetRoot}snow_day.png', false: '${assetRoot}snow_night.png'},
    77: {true: '${assetRoot}snow_day.png', false: '${assetRoot}snow_night.png'},
    85: {true: '${assetRoot}snow_day.png', false: '${assetRoot}snow_night.png'},
    86: {true: '${assetRoot}snow_day.png', false: '${assetRoot}snow_night.png'},
    95: {
      true: '${assetRoot}thunder_day.png',
      false: '${assetRoot}thunder_night.png',
    },
    96: {
      true: '${assetRoot}thunder_day.png',
      false: '${assetRoot}thunder_night.png',
    },
    99: {
      true: '${assetRoot}thunder_day.png',
      false: '${assetRoot}thunder_night.png',
    },
  };

  static const Map<int, Map<bool, String>> _notificationImagePaths = {
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
