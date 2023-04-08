import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status.dart';
import 'package:rain/app/widgets/status_im_fa.dart';

class WeatherHourly extends StatefulWidget {
  const WeatherHourly({
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
  State<WeatherHourly> createState() => _WeatherHourlyState();
}

class _WeatherHourlyState extends State<WeatherHourly> {
  final status = Status();
  final statusImFa = StatusImFa();

  @override
  Widget build(BuildContext context) {
    final locale = Get.locale;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              statusImFa.getTimeFormat(widget.time),
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
          status.getImageToday(
              widget.time, widget.weather, widget.timeDay, widget.timeNight),
          scale: 3,
        ),
        Text(
          statusImFa.getDegree(widget.degree.round().toInt()),
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
