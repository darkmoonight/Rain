import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/widgets/collapsible_section.dart';
import 'package:rain/core/weather/desc_metrics_catalog.dart';
import 'package:rain/core/weather/message.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/desc/desc.dart';

/// Expandable grid of hourly or daily weather variables.
class DescContainer extends ConsumerWidget {
  const DescContainer({
    super.key,
    this.humidity,
    this.wind,
    this.visibility,
    this.feels,
    this.evaporation,
    this.precipitation,
    this.direction,
    this.pressure,
    this.rain,
    this.cloudcover,
    this.windgusts,
    this.uvIndex,
    this.dewpoint2M,
    this.precipitationProbability,
    this.shortwaveRadiation,
    this.apparentTemperatureMin,
    this.apparentTemperatureMax,
    this.uvIndexMax,
    this.windDirection10MDominant,
    this.windSpeed10MMax,
    this.windGusts10MMax,
    this.precipitationProbabilityMax,
    this.rainSum,
    this.precipitationSum,
    required this.initiallyExpanded,
    required this.title,
  });

  final int? humidity;
  final double? wind;
  final double? visibility;
  final double? feels;
  final double? evaporation;
  final double? precipitation;
  final int? direction;
  final double? pressure;
  final double? rain;
  final int? cloudcover;
  final double? windgusts;
  final double? uvIndex;
  final double? dewpoint2M;
  final int? precipitationProbability;
  final double? shortwaveRadiation;
  final double? apparentTemperatureMin;
  final double? apparentTemperatureMax;
  final double? uvIndexMax;
  final int? windDirection10MDominant;
  final double? windSpeed10MMax;
  final double? windGusts10MMax;
  final int? precipitationProbabilityMax;
  final double? rainSum;
  final double? precipitationSum;
  final bool initiallyExpanded;
  final String title;

  /// Hourly variable grid for one slot in [card].time.
  factory DescContainer.fromHourlySlot({
    Key? key,
    required WeatherCard card,
    required int hourIndex,
    required bool initiallyExpanded,
    required String title,
  }) => DescContainer(
    key: key,
    humidity: card.relativehumidity2M?[hourIndex],
    wind: card.windspeed10M?[hourIndex],
    visibility: card.visibility?[hourIndex],
    feels: card.apparentTemperature?[hourIndex],
    evaporation: card.evapotranspiration?[hourIndex],
    precipitation: card.precipitation?[hourIndex],
    direction: card.winddirection10M?[hourIndex],
    pressure: card.surfacePressure?[hourIndex],
    rain: card.rain?[hourIndex],
    cloudcover: card.cloudcover?[hourIndex],
    windgusts: card.windgusts10M?[hourIndex],
    uvIndex: card.uvIndex?[hourIndex],
    dewpoint2M: card.dewpoint2M?[hourIndex],
    precipitationProbability: card.precipitationProbability?[hourIndex],
    shortwaveRadiation: card.shortwaveRadiation?[hourIndex],
    initiallyExpanded: initiallyExpanded,
    title: title,
  );

  /// Daily aggregate variable grid for one slot in [card].timeDaily.
  factory DescContainer.fromDailySlot({
    Key? key,
    required WeatherCard card,
    required int dayIndex,
    required bool initiallyExpanded,
    required String title,
  }) => DescContainer(
    key: key,
    apparentTemperatureMin: card.apparentTemperatureMin?[dayIndex],
    apparentTemperatureMax: card.apparentTemperatureMax?[dayIndex],
    uvIndexMax: card.uvIndexMax?[dayIndex],
    windDirection10MDominant: card.winddirection10MDominant?[dayIndex],
    windSpeed10MMax: card.windspeed10MMax?[dayIndex],
    windGusts10MMax: card.windgusts10MMax?[dayIndex],
    precipitationProbabilityMax: card.precipitationProbabilityMax?[dayIndex],
    rainSum: card.rainSum?[dayIndex],
    precipitationSum: card.precipitationSum?[dayIndex],
    initiallyExpanded: initiallyExpanded,
    title: title,
  );

  /// Builds the expandable grid of available hourly or daily weather metrics.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final statusData = StatusData(settings: settings);
    final metrics = DescMetricsCatalog.build(
      input: DescMetricsInput(
        humidity: humidity,
        wind: wind,
        visibility: visibility,
        feels: feels,
        evaporation: evaporation,
        precipitation: precipitation,
        direction: direction,
        pressure: pressure,
        rain: rain,
        cloudcover: cloudcover,
        windgusts: windgusts,
        uvIndex: uvIndex,
        dewpoint2M: dewpoint2M,
        precipitationProbability: precipitationProbability,
        shortwaveRadiation: shortwaveRadiation,
        apparentTemperatureMin: apparentTemperatureMin,
        apparentTemperatureMax: apparentTemperatureMax,
        uvIndexMax: uvIndexMax,
        windDirection10MDominant: windDirection10MDominant,
        windSpeed10MMax: windSpeed10MMax,
        windGusts10MMax: windGusts10MMax,
        precipitationProbabilityMax: precipitationProbabilityMax,
        rainSum: rainSum,
        precipitationSum: precipitationSum,
      ),
      statusData: statusData,
      message: Message(),
      themeId: settings.weatherIconTheme,
    ).where((m) => m.hasValue).toList();

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.cardBottomMargin),
      child: CollapsibleSection(
        initiallyExpanded: initiallyExpanded,
        title: Text(title, style: Theme.of(context).textTheme.labelLarge),
        child: Padding(
          padding: CollapsibleSection.cardBodyPadding,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final spacing = AppConstants.descGridSpacing;
              final crossAxisCount =
                  ((constraints.maxWidth + spacing) /
                          (AppConstants.descGridItemWidth + spacing))
                      .floor()
                      .clamp(1, 8);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: metrics.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent: AppConstants.descGridRowHeight,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                ),
                itemBuilder: (context, index) {
                  final metric = metrics.elementAt(index);
                  return DescWeather(
                    imageName: metric.imageAsset,
                    value: metric.displayValue,
                    desc: metric.label,
                    message: metric.helpText,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
