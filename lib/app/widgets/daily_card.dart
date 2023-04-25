import 'package:flutter/material.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({
    super.key,
    this.timeDaily,
    this.weathercodeDaily,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.precipitationSum,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
  });
  final DateTime? timeDaily;
  final int? weathercodeDaily;
  final double? temperature2MMax;
  final double? temperature2MMin;
  final double? apparentTemperatureMax;
  final double? apparentTemperatureMin;
  final String? sunrise;
  final String? sunset;
  final double? precipitationSum;
  final int? precipitationProbabilityMax;
  final double? windspeed10MMax;
  final double? windgusts10MMax;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
