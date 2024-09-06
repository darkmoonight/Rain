import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/main.dart';

class Hourly extends StatefulWidget {
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

  @override
  State<Hourly> createState() => _HourlyState();
}

class _HourlyState extends State<Hourly> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final time = widget.time;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              statusData.getTimeFormat(time),
              style: textTheme.labelLarge,
            ),
            Text(
              DateFormat('E', locale.languageCode)
                  .format(DateTime.tryParse(time)!),
              style: textTheme.labelLarge?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Image.asset(
          statusWeather.getImageToday(
            widget.weather,
            time,
            widget.timeDay,
            widget.timeNight,
          ),
          scale: 3,
        ),
        Text(
          statusData.getDegree(widget.degree.round()),
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
