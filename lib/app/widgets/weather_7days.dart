import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Weather7Days extends StatelessWidget {
  const Weather7Days({
    super.key,
    required this.locale,
    required this.image,
    required this.date,
    required this.weather,
    required this.minDegree,
    required this.maxDegree,
  });
  final Locale locale;
  final String date;
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
          SizedBox(
            width: 80,
            child: Text(
              date,
              style: context.theme.textTheme.labelLarge,
            ),
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  scale: 5,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    weather,
                    style: context.theme.textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  minDegree,
                  style: context.theme.textTheme.labelLarge,
                ),
                const SizedBox(width: 5),
                Text(
                  maxDegree,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
