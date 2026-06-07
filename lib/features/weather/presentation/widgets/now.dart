import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/weather/status_weather.dart';

/// Current conditions header with compact or large-element layout.
class Now extends ConsumerWidget {
  const Now({
    super.key,
    required this.weather,
    required this.degree,
    required this.time,
    required this.timeDay,
    required this.timeNight,
    required this.tempMax,
    required this.tempMin,
    required this.feels,
  });

  final String time;
  final String timeDay;
  final String timeNight;
  final int weather;
  final double degree;
  final double tempMax;
  final double tempMin;
  final double feels;

  /// Builds the current-conditions header using the compact or large layout.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largeElement = ref.watch(settingsProvider).largeElement;
    return largeElement
        ? _buildLargeElementLayout(context, ref)
        : _buildCompactElementLayout(context, ref);
  }

  /// Builds a centered large-icon layout for current conditions.
  Widget _buildLargeElementLayout(BuildContext context, WidgetRef ref) {
    final statusWeather = StatusWeather();
    final statusData = StatusData(settings: ref.watch(settingsProvider));
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(15),
          _buildWeatherImage(statusWeather, 200),
          _buildTemperatureText(context, statusData, degree, 90),
          Text(
            statusWeather.getText(weather),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(5),
          _buildDateText(context, ref),
        ],
      ),
    );
  }

  /// Builds a card-based compact layout for current conditions.
  Widget _buildCompactElementLayout(BuildContext context, WidgetRef ref) {
    final statusWeather = StatusWeather();
    final statusData = StatusData(settings: ref.watch(settingsProvider));
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          bottom: 18,
          left: 25,
          right: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDateText(context, ref),
                  const Gap(5),
                  Text(
                    statusWeather.getText(weather),
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 20),
                  ),
                  _buildFeelsLikeText(context, statusData),
                  const Gap(30),
                  _buildTemperatureCompactText(context, statusData),
                  const Gap(5),
                  _buildMinMaxTemperatureText(context, statusData),
                ],
              ),
            ),
            _buildWeatherImage(statusWeather, 140),
          ],
        ),
      ),
    );
  }

  /// Renders the weather icon for the current hour at [height].
  Widget _buildWeatherImage(StatusWeather statusWeather, double height) =>
      Image(
        image: AssetImage(
          statusWeather.getImageNow(weather, time, timeDay, timeNight),
        ),
        fit: BoxFit.fill,
        height: height,
      );

  /// Formats and displays [value] as a temperature label at [fontSize].
  Widget _buildTemperatureText(
    BuildContext context,
    StatusData statusData,
    double value,
    double fontSize,
  ) {
    return Text(
      statusData.getDegree(value),
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Formats and displays the localized date and time for [time].
  Widget _buildDateText(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final locale = ref.watch(localeProvider);
    final parsed = DateTime.tryParse(time);
    if (parsed == null) return const SizedBox.shrink();
    final formatted =
        '${DateFormat.yMMMEd(locale.languageCode).format(parsed)}, '
        '${TimeIndexHelper.formatDateTime(parsed, settings, locale.languageCode)}';
    return Text(formatted, style: Theme.of(context).textTheme.titleMedium);
  }

  /// Displays the feels-like temperature using [statusData].
  Widget _buildFeelsLikeText(BuildContext context, StatusData statusData) =>
      Text(
        '${'feels'.tr} ${statusData.getDegree(feels)}',
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: Colors.grey),
      );

  /// Displays the current temperature in the compact layout style.
  Widget _buildTemperatureCompactText(
    BuildContext context,
    StatusData statusData,
  ) => Text(
    statusData.getDegree(degree),
    style: Theme.of(
      context,
    ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600),
  );

  /// Displays the daily high and low temperatures for the selected day.
  Widget _buildMinMaxTemperatureText(
    BuildContext context,
    StatusData statusData,
  ) => Text(
    '↑${statusData.getDegree(tempMax)} ↓${statusData.getDegree(tempMin)}',
    style: Theme.of(context).textTheme.titleMedium,
  );
}
