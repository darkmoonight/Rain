import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_info.dart';
import 'package:rain/i18n/tr.dart';

/// Resolves day/hour context for preview rows and navigation into [DailyCardInfo].
class DailyForecastAnchor {
  const DailyForecastAnchor({required this.dayIndex, required this.hourIndex});

  final int dayIndex;
  final int hourIndex;

  /// Open-Meteo daily weather code for [listIndex].
  int? weatherCode(WeatherCard card, int listIndex) =>
      DailyDisplayHelper.dailyWeatherCode(card, listIndex);

  /// Preview-row icon path for [listIndex].
  String? previewImagePath(
    StatusWeather statusWeather,
    WeatherCard card,
    int listIndex,
  ) => DailyDisplayHelper.previewImagePath(
    statusWeather: statusWeather,
    card: card,
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
/// Preview rows use Open-Meteo daily weather codes and [StatusWeather.getImage7Day]
/// for every day, including today.
///
/// The 12-day [DailyCard] list uses [StatusWeather.getImageNowDaily] for icons.
class DailyDisplayHelper {
  DailyDisplayHelper._();

  /// Open-Meteo daily weather code for [listIndex].
  static int? dailyWeatherCode(WeatherCard card, int listIndex) =>
      card.weathercodeDaily?[listIndex];

  /// Preview-row icon path (day variant) for [listIndex].
  static String? previewImagePath({
    required StatusWeather statusWeather,
    required WeatherCard card,
    required int listIndex,
  }) {
    final code = dailyWeatherCode(card, listIndex);
    if (code == null) return null;
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

  /// Day label for the home-screen preview: today, tomorrow, then weekday name.
  static String previewDayLabel({
    required int listIndex,
    required int dayIndex,
    required DateTime date,
    required String languageCode,
  }) {
    switch (listIndex - dayIndex) {
      case 0:
        return 'today'.tr;
      case 1:
        return 'tomorrow'.tr;
      default:
        return DateFormat.EEEE(languageCode).format(date);
    }
  }
}
