import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status/status_data.dart';
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
    required this.tempMax,
    required this.tempMin,
  });
  final String time;
  final String timeDay;
  final String timeNight;
  final int weather;
  final double degree;
  final double tempMax;
  final double tempMin;

  @override
  State<WeatherNow> createState() => _WeatherNowState();
}

class _WeatherNowState extends State<WeatherNow> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18, bottom: 18, left: 25, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.MMMMEEEEd(locale.languageCode).format(
                      DateTime.parse(widget.time),
                    ),
                    style: context.textTheme.labelLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    statusWeather.getText(widget.weather),
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    statusData.getDegree(
                        roundDegree ? widget.degree.round() : widget.degree),
                    style: context.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(statusData.getDegree((widget.tempMin.round())),
                          style: context.textTheme.labelLarge),
                      Text(' / ',
                          style: context.textTheme.labelLarge
                              ?.copyWith(color: Colors.grey)),
                      Text(statusData.getDegree((widget.tempMax.round())),
                          style: context.textTheme.labelLarge),
                    ],
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage(statusWeather.getImageNow(widget.weather,
                  widget.time, widget.timeDay, widget.timeNight)),
              fit: BoxFit.fill,
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
