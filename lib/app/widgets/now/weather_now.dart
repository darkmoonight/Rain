import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/main.dart';

class WeatherNow extends StatefulWidget {
  const WeatherNow({
    super.key,
    required this.weather,
    required this.degree,
    required this.time,
    required this.timeDay,
    required this.timeNight,
  });
  final String time;
  final String timeDay;
  final String timeNight;
  final int weather;
  final double degree;

  @override
  State<WeatherNow> createState() => _WeatherNowState();
}

class _WeatherNowState extends State<WeatherNow> {
  final statusWeather = StatusWeather();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Image(
          image: AssetImage(statusWeather.getImageNow(
              widget.weather, widget.time, widget.timeDay, widget.timeNight)),
          fit: BoxFit.fill,
          height: 200,
        ),
        GlowText(
          '${roundDegree ? widget.degree.round() : widget.degree}',
          style: context.textTheme.displayLarge?.copyWith(
            fontSize: 90,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          statusWeather.getText(widget.weather),
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: 5),
        Text(
          DateFormat.MMMMEEEEd(locale.languageCode).format(
            DateTime.parse(widget.time),
          ),
          style: context.textTheme.labelLarge?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
