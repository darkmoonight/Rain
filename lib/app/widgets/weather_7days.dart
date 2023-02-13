import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status.dart';

class Weather7Days extends StatefulWidget {
  const Weather7Days({
    super.key,
    required this.date,
    required this.weather,
    required this.minDegree,
    required this.maxDegree,
  });
  final DateTime date;
  final int weather;
  final double minDegree;
  final double maxDegree;

  @override
  State<Weather7Days> createState() => _Weather7DaysState();
}

class _Weather7DaysState extends State<Weather7Days> {
  final locale = Get.locale;
  final status = Status();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              DateFormat.EEEE(locale?.languageCode).format(widget.date),
              style: context.theme.textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  status.getImage7Day(widget.weather),
                  scale: 3,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    status.getText(widget.weather),
                    style: context.theme.textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${widget.minDegree.round().toInt()}°C',
                  style: context.theme.textTheme.labelLarge,
                ),
                Text(
                  ' / ',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${widget.maxDegree.round().toInt()}°C',
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
