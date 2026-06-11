import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/aqi_pollutant_bar.dart';

/// Vertical list of pollutant concentration bars for one forecast hour.
class AqiPollutantList extends StatelessWidget {
  const AqiPollutantList({
    super.key,
    required this.weatherCard,
    required this.hourIndex,
    required this.labelStyle,
    this.rowGap = 6,
  });

  final WeatherCard weatherCard;
  final int hourIndex;
  final TextStyle? labelStyle;
  final double rowGap;

  @override
  Widget build(BuildContext context) {
    final keys = AqiHelper.pollutantKeys;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < keys.length; i++) ...[
          if (i > 0) Gap(rowGap),
          AqiPollutantBar(
            pollutantKey: keys[i],
            value: AqiHelper.pollutantValue(weatherCard, hourIndex, keys[i]),
            labelStyle: labelStyle,
          ),
        ],
      ],
    );
  }
}
