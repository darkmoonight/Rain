import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/status/status_data.dart';

class SunsetSunrise extends StatefulWidget {
  const SunsetSunrise({
    super.key,
    required this.timeSunrise,
    required this.timeSunset,
  });

  final String timeSunrise;
  final String timeSunset;

  @override
  State<SunsetSunrise> createState() => _SunsetSunriseState();
}

class _SunsetSunriseState extends State<SunsetSunrise> {
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    const crossAxisCenterAlignment = CrossAxisAlignment.center;
    final textTheme = context.textTheme;
    final titleSmall = textTheme.titleSmall;
    final titleLarge = textTheme.titleLarge;

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: crossAxisCenterAlignment,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: crossAxisCenterAlignment,
                      children: [
                        Text(
                          'sunrise'.tr,
                          style: titleSmall,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          statusData.getTimeFormat(widget.timeSunrise),
                          style: titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Image.asset(
                      'assets/images/sunrise.png',
                      scale: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: crossAxisCenterAlignment,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: crossAxisCenterAlignment,
                      children: [
                        Text(
                          'sunset'.tr,
                          style: titleSmall,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          statusData.getTimeFormat(widget.timeSunset),
                          style: titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Image.asset(
                      'assets/images/sunset.png',
                      scale: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
