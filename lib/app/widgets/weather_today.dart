import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/controller/controller.dart';

class WeatherToday extends StatefulWidget {
  const WeatherToday({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
  });
  final String time;
  final int weather;
  final double degree;

  @override
  State<WeatherToday> createState() => _WeatherTodayState();
}

class _WeatherTodayState extends State<WeatherToday> {
  @override
  Widget build(BuildContext context) {
    final locale = Get.locale;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              DateFormat('HH:mm', '${locale?.languageCode}')
                  .format(DateTime.tryParse(widget.time)!),
              style: context.theme.textTheme.labelLarge,
            ),
            Text(
              DateFormat('E', '${locale?.languageCode}')
                  .format(DateTime.tryParse(widget.time)!),
              style: context.theme.textTheme.labelLarge?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Image.asset(
          Controller().getImageToday(widget.time, widget.weather),
          scale: 3,
        ),
        Text(
          '${widget.degree.round().toInt()}°C',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
