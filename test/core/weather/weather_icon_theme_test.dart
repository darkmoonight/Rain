import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';

void main() {
  group('WeatherIconTheme', () {
    test('resolve falls back to classic for unknown id', () {
      expect(WeatherIconTheme.resolve(null), WeatherIconTheme.classic);
      expect(WeatherIconTheme.resolve('unknown'), WeatherIconTheme.classic);
    });

    test('assetRoot points classic theme to weather_icons/classic/', () {
      expect(
        WeatherIconTheme.assetRoot(WeatherIconTheme.classic),
        'assets/weather_icons/classic/',
      );
    });

    test('assetRoot falls back to classic for unregistered theme id', () {
      expect(
        WeatherIconTheme.assetRoot('minimal'),
        'assets/weather_icons/classic/',
      );
    });

    test('asset builds full path for file in theme', () {
      expect(
        WeatherIconTheme.asset('rain.png', themeId: WeatherIconTheme.classic),
        'assets/weather_icons/classic/rain.png',
      );
    });

    test('previewAsset uses sun.png from theme root', () {
      expect(
        WeatherIconTheme.previewAsset(WeatherIconTheme.classic),
        'assets/weather_icons/classic/sun.png',
      );
    });
  });
}
