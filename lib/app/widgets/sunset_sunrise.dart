import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/status_im_fa.dart';

class SunsetSunrise extends StatefulWidget {
  const SunsetSunrise({
    super.key,
    required this.title,
    required this.time,
    required this.image,
  });
  final String title;
  final String time;
  final String image;

  @override
  State<SunsetSunrise> createState() => _SunsetSunriseState();
}

class _SunsetSunriseState extends State<SunsetSunrise> {
  final locale = Get.locale;
  final statusImFa = StatusImFa();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: context.theme.textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                statusImFa.getTimeFormat(widget.time),
                style: context.theme.textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset(
            widget.image,
            scale: 10,
          ),
        ),
      ],
    );
  }
}
