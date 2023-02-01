import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  String getImage() {
    switch (widget.weather) {
      case 0:
        return 'assets/images/01d.png';
      case 1:
      case 2:
      case 3:
        return 'assets/images/02d.png';
      case 45:
      case 48:
        return 'assets/images/50d.png';
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
        return 'assets/images/10d.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'assets/images/13d.png';
      case 95:
      case 96:
      case 99:
        return 'assets/images/11d.png';
      default:
        return '';
    }
  }

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
          getImage(),
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
