import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/controller/controller.dart';

class WeatherNow extends StatefulWidget {
  const WeatherNow({
    super.key,
    required this.weather,
    required this.degree,
  });
  final int weather;
  final double degree;

  @override
  State<WeatherNow> createState() => _WeatherNowState();
}

class _WeatherNowState extends State<WeatherNow> {
  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Controller().getImageNow(widget.weather)),
                fit: BoxFit.fill,
                height: 200,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: Column(
                children: [
                  GlowText(
                    '${widget.degree.round().toInt()}',
                    style: context.theme.textTheme.displayLarge?.copyWith(
                      fontSize: 90,
                      fontWeight: FontWeight.w800,
                      height: 0.7,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    Controller().getText(widget.weather),
                    style: context.theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat.MMMMEEEEd('${locale?.languageCode}').format(
                      DateTime.now(),
                    ),
                    style: context.theme.textTheme.labelLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
