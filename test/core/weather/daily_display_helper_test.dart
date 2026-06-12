import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rain/core/weather/daily_display_helper.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/data/models/db.dart';
import '../../helpers/test_helpers.dart';

WeatherCard _card({List<int?> daily = const [61, 0, 0]}) =>
    WeatherCard()..weathercodeDaily = daily;

void main() {
  setUpAll(() async {
    await initTestEnvironment();
    await initializeDateFormatting('ru');
  });

  group('DailyDisplayHelper', () {
    test('previewDayLabel shows Today, Tomorrow, then weekday', () {
      final monday = DateTime(2026, 6, 8);

      expect(
        DailyDisplayHelper.previewDayLabel(
          listIndex: 0,
          dayIndex: 0,
          date: monday,
          languageCode: 'en',
        ),
        'Today',
      );
      expect(
        DailyDisplayHelper.previewDayLabel(
          listIndex: 1,
          dayIndex: 0,
          date: DateTime(2026, 6, 9),
          languageCode: 'en',
        ),
        'Tomorrow',
      );
      expect(
        DailyDisplayHelper.previewDayLabel(
          listIndex: 3,
          dayIndex: 0,
          date: monday,
          languageCode: 'en',
        ),
        'Monday',
      );
      expect(
        DailyDisplayHelper.previewDayLabel(
          listIndex: 2,
          dayIndex: 0,
          date: DateTime(2026, 6, 7),
          languageCode: 'ru',
        ),
        'Воскресенье',
      );
    });

    test('dailyWeatherCode reads Open-Meteo daily series', () {
      final card = _card();

      expect(DailyDisplayHelper.dailyWeatherCode(card, 0), 61);
      expect(DailyDisplayHelper.dailyWeatherCode(card, 1), 0);
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
        final card = _card(daily: [61, 0]);
        const anchor = DailyForecastAnchor(dayIndex: 0, hourIndex: 1);

        expect(anchor.weatherCode(card, 0), 61);
        expect(anchor.weatherCode(card, 1), 0);
        expect(anchor.detailInitialHour(0), 1);
        expect(anchor.detailInitialHour(1), 0);
      },
    );

    test('previewImagePath uses 7-day asset for all preview rows', () {
      final card = _card(daily: [61, 0]);
      final statusWeather = StatusWeather();

      final todayPath = DailyDisplayHelper.previewImagePath(
        statusWeather: statusWeather,
        card: card,
        listIndex: 0,
      );
      final tomorrowPath = DailyDisplayHelper.previewImagePath(
        statusWeather: statusWeather,
        card: card,
        listIndex: 1,
      );

      expect(todayPath, contains('rain_day'));
      expect(tomorrowPath, contains('clear_day'));
    });
  });
}
