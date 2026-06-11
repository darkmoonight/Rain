import 'package:flutter/material.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/air_quality_card.dart';
import 'package:rain/features/weather/presentation/widgets/desc/desc_container.dart';
import 'package:rain/i18n/tr.dart';

/// AQI card and hourly weather variables for one forecast hour.
class WeatherHourlySections extends StatelessWidget {
  const WeatherHourlySections({
    super.key,
    required this.weatherCard,
    required this.hourIndex,
    required this.aqiStandard,
    this.hourlyVariablesExpanded = false,
  });

  final WeatherCard weatherCard;
  final int hourIndex;
  final String aqiStandard;
  final bool hourlyVariablesExpanded;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AirQualityCard(
        weatherCard: weatherCard,
        hourIndex: hourIndex,
        aqiStandard: aqiStandard,
      ),
      DescContainer.fromHourlySlot(
        card: weatherCard,
        hourIndex: hourIndex,
        initiallyExpanded: hourlyVariablesExpanded,
        title: 'hourlyVariables'.tr,
      ),
    ],
  );
}
