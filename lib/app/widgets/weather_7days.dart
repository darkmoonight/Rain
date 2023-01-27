import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Weather7Days extends StatelessWidget {
  const Weather7Days({
    super.key,
    required this.locale,
    required this.image,
    required this.weather,
    required this.minDegree,
    required this.maxDegree,
  });
  final Locale locale;
  final String image;
  final String weather;
  final String minDegree;
  final String maxDegree;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat.EEEE(locale.languageCode).format(DateTime.now()),
            style: context.theme.textTheme.labelLarge,
          ),
          Row(
            children: [
              Image.asset(
                image,
                scale: 5,
              ),
              const SizedBox(width: 5),
              Text(
                weather,
                style: context.theme.textTheme.labelLarge,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                minDegree,
                style: context.theme.textTheme.labelLarge,
              ),
              const SizedBox(width: 5),
              Text(
                minDegree,
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
