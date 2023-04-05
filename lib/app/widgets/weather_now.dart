import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status.dart';

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
  final locale = Get.locale;
  final status = Status();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Image(
          image: AssetImage(status.getImageNow(
              widget.weather, widget.time, widget.timeDay, widget.timeNight)),
          fit: BoxFit.fill,
          height: 200,
        ),
        GlowText(
          '${widget.degree.round().toInt()}',
          style: context.theme.textTheme.displayLarge?.copyWith(
            fontSize: 90,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          status.getText(widget.weather),
          style: context.theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 5),
        Text(
          DateFormat.MMMMEEEEd('${locale?.languageCode}').format(
            DateTime.parse(widget.time),
          ),
          style: context.theme.textTheme.labelLarge?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
