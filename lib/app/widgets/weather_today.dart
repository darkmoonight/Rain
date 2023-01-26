import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
  });
  final String time;
  final String weather;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          time,
          style: context.theme.textTheme.labelLarge,
        ),
        Image.asset(
          weather,
          scale: 5,
        ),
        Text(
          degree,
          style: context.theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
