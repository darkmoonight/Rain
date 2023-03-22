import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/widgets/status.dart';
import 'package:timezone/standalone.dart' as tz;

class CardDescWeather extends StatefulWidget {
  const CardDescWeather({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
    required this.district,
    required this.city,
    required this.timeNow,
  });
  final List<String> time;
  final String district;
  final String city;
  final List<int> weather;
  final List<double> degree;
  final String timeNow;

  @override
  State<CardDescWeather> createState() => _CardDescWeatherState();
}

class _CardDescWeatherState extends State<CardDescWeather> {
  final status = Status();
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.theme.colorScheme.primaryContainer,
      ),
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
                      '${widget.degree[locationController.getTime(widget.time, widget.timeNow)].round().toInt()}°C',
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      status.getText(widget.weather[locationController.getTime(
                          widget.time, widget.timeNow)]),
                      style: context.theme.textTheme.titleMedium?.copyWith(
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
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Text(
                        '${'time'.tr}: ${DateFormat('HH:mm').format(tz.TZDateTime.now(tz.getLocation(widget.timeNow)))}',
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Image.asset(
            status.getImageNow(
                widget.weather[
                    locationController.getTime(widget.time, widget.timeNow)],
                widget.time[
                    locationController.getTime(widget.time, widget.timeNow)]),
            scale: 6.5,
          ),
        ],
      ),
    );
  }
}