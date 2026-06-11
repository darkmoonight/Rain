import 'package:flutter/material.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_info.dart';

/// Current day/hour slice for resolving "today" in daily forecast rows.
class DailyForecastAnchor {
  const DailyForecastAnchor({required this.dayIndex, required this.hourIndex});

  final int dayIndex;
  final int hourIndex;

  /// Whether [listIndex] is the anchored "today" row.
  bool isToday(int listIndex) => listIndex == dayIndex;

  /// Weather code for a row (hourly for today, daily aggregate otherwise).
  int? weatherCode(WeatherCard card, int listIndex) =>
      DailyDisplayHelper.weatherCodeForDay(
        card: card,
        dayIndex: dayIndex,
        hourIndex: hourIndex,
        listIndex: listIndex,
      );

  /// Icon for the 7-day preview strip (day/night today, 7-day asset otherwise).
  String? previewImagePath(
    StatusWeather statusWeather,
    WeatherCard card,
    int listIndex,
  ) => DailyDisplayHelper.forecastImagePath(
    statusWeather: statusWeather,
    card: card,
    dayIndex: dayIndex,
    hourIndex: hourIndex,
    listIndex: listIndex,
  );

  /// Initial hour in [DailyCardInfo] when opening [listIndex].
  int detailInitialHour(int listIndex) =>
      DailyDisplayHelper.dailyCardInitialHour(
        dayIndex: dayIndex,
        hourIndex: hourIndex,
        listIndex: listIndex,
      );

  /// Pushes [DailyCardInfo] for [listIndex] with the correct initial hour.
  void openDetail(BuildContext context, WeatherCard card, int listIndex) {
    NavigationHelper.toDownToUp(
      context,
      () => DailyCardInfo(
        weatherData: card,
        index: listIndex,
        initialHourOfDay: detailInitialHour(listIndex),
      ),
    );
  }
}

/// Resolves daily-forecast display values shared by preview rows and list cards.
///
/// For [dayIndex] (today), uses the current hourly slot so the summary matches
/// the main "now" header; other days use Open-Meteo daily codes.
///
/// The 12-day [DailyCard] list uses [StatusWeather.getImageNowDaily] for icons;
/// the home-screen preview uses [forecastImagePath] (smaller day/night assets).
class DailyDisplayHelper {
  DailyDisplayHelper._();

  /// Hourly weather code for [listIndex], or null when unavailable.
  static int? weatherCodeForDay({
    required WeatherCard card,
    required int dayIndex,
    required int hourIndex,
    required int listIndex,
  }) {
    if (listIndex == dayIndex) {
      final hourly = card.weathercode;
      if (hourly != null && hourIndex >= 0 && hourIndex < hourly.length) {
        return hourly[hourIndex];
      }
    }
    return card.weathercodeDaily?[listIndex];
  }

  /// Icon path for the home-screen daily preview (not the 12-day list).
  static String? forecastImagePath({
    required StatusWeather statusWeather,
    required WeatherCard card,
    required int dayIndex,
    required int hourIndex,
    required int listIndex,
  }) {
    final code = weatherCodeForDay(
      card: card,
      dayIndex: dayIndex,
      hourIndex: hourIndex,
      listIndex: listIndex,
    );
    if (code == null) return null;

    if (listIndex == dayIndex) {
      return statusWeather.getImageToday(
        code,
        card.time![hourIndex],
        card.sunrise![listIndex],
        card.sunset![listIndex],
      );
    }
    return statusWeather.getImage7Day(code);
  }

  /// Initial hour selector when opening [DailyCardInfo] for [listIndex].
  static int dailyCardInitialHour({
    required int dayIndex,
    required int hourIndex,
    required int listIndex,
  }) => listIndex == dayIndex ? hourWithinDay(dayIndex, hourIndex) : 0;

  /// Hour-of-day index (0–23) within [dayIndex] for [hourIndex].
  static int hourWithinDay(int dayIndex, int hourIndex) =>
      (hourIndex - dayIndex * 24).clamp(0, 23);
}
