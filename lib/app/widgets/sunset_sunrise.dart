import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/status_im_fa.dart';

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
  final locale = Get.locale;
  final statusImFa = StatusImFa();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'sunrise'.tr,
                        style: context.theme.textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        statusImFa.getTimeFormat(widget.timeSunrise),
                        style: context.theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Expanded(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'sunset'.tr,
                        style: context.theme.textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        statusImFa.getTimeFormat(widget.timeSunset),
                        style: context.theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Expanded(
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
    );
  }
}
