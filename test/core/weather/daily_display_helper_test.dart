import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/daily_display_helper.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/data/models/db.dart';

WeatherCard _card({required List<int> hourly, required List<int?> daily}) {
  return WeatherCard()
    ..weathercode = hourly
    ..weathercodeDaily = daily;
}

void main() {
  group('DailyDisplayHelper', () {
    test('uses hourly code for today', () {
      final card = _card(hourly: [3, 2, 1], daily: [61, 0, 0]);

      expect(
        DailyDisplayHelper.weatherCodeForDay(
          card: card,
          dayIndex: 0,
          hourIndex: 1,
          listIndex: 0,
        ),
        2,
      );
    });

    test('uses daily code for other days', () {
      final card = _card(hourly: [3, 2, 1], daily: [61, 0, 0]);

      expect(
        DailyDisplayHelper.weatherCodeForDay(
          card: card,
          dayIndex: 0,
          hourIndex: 1,
          listIndex: 1,
        ),
        0,
      );
    });

    test('hourWithinDay subtracts day offset', () {
      expect(DailyDisplayHelper.hourWithinDay(1, 27), 3);
      expect(DailyDisplayHelper.hourWithinDay(0, 14), 14);
    });

    test('dailyCardInitialHour returns current hour only for today', () {
      expect(
        DailyDisplayHelper.dailyCardInitialHour(
          dayIndex: 0,
          hourIndex: 14,
          listIndex: 0,
        ),
        14,
      );
      expect(
        DailyDisplayHelper.dailyCardInitialHour(
          dayIndex: 0,
          hourIndex: 14,
          listIndex: 1,
        ),
        0,
      );
    });

    test(
      'DailyForecastAnchor delegates weather code and navigation context',
      () {
        final card = _card(hourly: [3, 2], daily: [61, 0]);
        const anchor = DailyForecastAnchor(dayIndex: 0, hourIndex: 1);

        expect(anchor.weatherCode(card, 0), 2);
        expect(anchor.weatherCode(card, 1), 0);
        expect(anchor.detailInitialHour(0), 1);
        expect(anchor.detailInitialHour(1), 0);
      },
    );

    test('forecastImagePath uses today asset for current day', () {
      final card = WeatherCard()
        ..weathercode = [3, 2]
        ..weathercodeDaily = [61, 0]
        ..time = ['2026-06-05T14:00', '2026-06-05T15:00']
        ..sunrise = ['06:00', '06:00']
        ..sunset = ['18:00', '18:00'];
      final statusWeather = StatusWeather();

      final todayPath = DailyDisplayHelper.forecastImagePath(
        statusWeather: statusWeather,
        card: card,
        dayIndex: 0,
        hourIndex: 0,
        listIndex: 0,
      );
      final tomorrowPath = DailyDisplayHelper.forecastImagePath(
        statusWeather: statusWeather,
        card: card,
        dayIndex: 0,
        hourIndex: 0,
        listIndex: 1,
      );

      expect(todayPath, contains('cloudy_day'));
      expect(tomorrowPath, contains('clear_day'));
    });
  });
}
