import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/app/widgets/status/status_data.dart';
import 'package:timezone/standalone.dart' as tz;

class WeatherCardContainer extends StatefulWidget {
  const WeatherCardContainer({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
    required this.district,
    required this.city,
    required this.timezone,
    required this.timeDay,
    required this.timeNight,
    required this.timeDaily,
  });
  final List<String> time;
  final List<String> timeDay;
  final List<String> timeNight;
  final List<DateTime> timeDaily;
  final String district;
  final String city;
  final List<int> weather;
  final List<double> degree;
  final String timezone;

  @override
  State<WeatherCardContainer> createState() => _WeatherCardContainerState();
}

class _WeatherCardContainerState extends State<WeatherCardContainer> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();
  final weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        statusData.getDegree(widget.degree[weatherController
                                .getTime(widget.time, widget.timezone)]
                            .round()
                            .toInt()),
                        style: context.textTheme.titleLarge?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        statusWeather.getText(widget.weather[weatherController
                            .getTime(widget.time, widget.timezone)]),
                        style: context.textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.district.isEmpty
                        ? widget.city
                        : widget.city.isEmpty
                            ? widget.district
                            : widget.city == widget.district
                                ? widget.city
                                : '${widget.city}'
                                    ', ${widget.district}',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Text(
                        '${'time'.tr}: ${statusData.getTimeFormatTz(tz.TZDateTime.now(tz.getLocation(widget.timezone)))}',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Image.asset(
              statusWeather.getImageNow(
                  widget.weather[
                      weatherController.getTime(widget.time, widget.timezone)],
                  widget.time[
                      weatherController.getTime(widget.time, widget.timezone)],
                  widget.timeDay[weatherController.getDay(
                      widget.timeDaily, widget.timezone)],
                  widget.timeNight[weatherController.getDay(
                      widget.timeDaily, widget.timezone)]),
              scale: 6.5,
            ),
          ],
        ),
      ),
    );
  }
}
