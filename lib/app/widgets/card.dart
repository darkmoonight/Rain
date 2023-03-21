import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/status.dart';

class CardDescWeather extends StatefulWidget {
  const CardDescWeather({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
    required this.administrativeArea,
    required this.city,
  });
  final String time;
  final String administrativeArea;
  final String city;
  final int weather;
  final double degree;

  @override
  State<CardDescWeather> createState() => _CardDescWeatherState();
}

class _CardDescWeatherState extends State<CardDescWeather> {
  final status = Status();

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
                      '${widget.degree.round().toInt()}°C',
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      status.getText(widget.weather),
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.administrativeArea.isEmpty
                      ? widget.city
                      : widget.city.isEmpty
                          ? widget.administrativeArea
                          : widget.city == widget.administrativeArea
                              ? widget.city
                              : '${widget.city}'
                                  ', ${widget.administrativeArea}',
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            status.getImageNow(widget.weather, widget.time),
            scale: 6.5,
          ),
        ],
      ),
    );
  }
}