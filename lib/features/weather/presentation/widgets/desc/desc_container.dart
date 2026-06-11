import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/weather/desc_metrics_catalog.dart';
import 'package:rain/core/weather/message.dart';
import 'package:rain/core/weather/status_data.dart';
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

  static const _itemWidth = 100.0;
  static const _spacing = 8.0;
  static const _rowHeight = 90.0;

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

  /// Builds the expandable grid of available hourly or daily weather metrics.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusData = StatusData(settings: ref.watch(settingsProvider));
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
    ).where((m) => m.hasValue).toList();

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(title, style: Theme.of(context).textTheme.labelLarge),
        initiallyExpanded: initiallyExpanded,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 5,
              left: 8,
              right: 8,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount =
                    ((constraints.maxWidth + _spacing) /
                            (_itemWidth + _spacing))
                        .floor()
                        .clamp(1, 8);

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: metrics.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisExtent: _rowHeight,
                    crossAxisSpacing: _spacing,
                    mainAxisSpacing: _spacing,
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
        ],
      ),
    );
  }
}
