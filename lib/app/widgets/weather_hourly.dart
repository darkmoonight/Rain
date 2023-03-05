import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status.dart';

class WeatherHourly extends StatefulWidget {
  const WeatherHourly({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
  });
  final String time;
  final int weather;
  final double degree;

  @override
  State<WeatherHourly> createState() => _WeatherHourlyState();
}

class _WeatherHourlyState extends State<WeatherHourly> {
  final status = Status();
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
          status.getImageToday(widget.time, widget.weather),
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
