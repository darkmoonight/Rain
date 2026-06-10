import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/status_weather.dart';

/// Single hour column in the horizontal hourly forecast strip.
class Hourly extends ConsumerWidget {
  const Hourly({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
    required this.timeDay,
    required this.timeNight,
  });

  final String time;
  final String timeDay;
  final String timeNight;
  final int weather;
  final double degree;

  /// Builds the time, icon, and temperature column for one forecast hour.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusWeather = StatusWeather();
    final statusData = StatusData(settings: ref.watch(settingsProvider));
    final locale = ref.watch(localeProvider);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTimeText(textTheme, statusData, locale),
        _buildWeatherImage(statusWeather),
        _buildTemperatureText(textTheme, statusData),
      ],
    );
  }

  /// Displays the formatted hour and weekday abbreviation for [time].
  Widget _buildTimeText(
    TextTheme textTheme,
    StatusData statusData,
    Locale locale,
  ) {
    final date = TimeIndexHelper.parseForecastDate(time);

    return Column(
      children: [
        Text(statusData.getTimeFormat(time), style: textTheme.labelLarge),
        Text(
          DateFormat('E', locale.languageCode).format(date),
          style: textTheme.labelLarge?.copyWith(
            color: textTheme.bodySmall?.color,
          ),
        ),
      ],
    );
  }

  /// Renders the weather icon for this hour using [statusWeather].
  Widget _buildWeatherImage(StatusWeather statusWeather) => Image.asset(
    statusWeather.getImageToday(weather, time, timeDay, timeNight),
    scale: 3,
  );

  /// Displays the formatted temperature for this hour.
  Widget _buildTemperatureText(TextTheme textTheme, StatusData statusData) =>
      Text(
        statusData.getDegree(degree),
        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      );
}
