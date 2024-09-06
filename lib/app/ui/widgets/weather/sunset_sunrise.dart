import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sunrise'.tr,
                          style: titleSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(2),
                        Text(
                          statusData.getTimeFormat(widget.timeSunrise),
                          style: titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const Gap(5),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sunset'.tr,
                          style: titleSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(2),
                        Text(
                          statusData.getTimeFormat(widget.timeSunset),
                          style: titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const Gap(5),
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
