import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status.dart';
import 'package:rain/app/widgets/status_im_fa.dart';

class ListCardDaily extends StatelessWidget {
  const ListCardDaily({
    super.key,
    required this.timeDaily,
    required this.weathercodeDaily,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });
  final DateTime timeDaily;
  final int weathercodeDaily;
  final double temperature2MMax;
  final double temperature2MMin;

  @override
  Widget build(BuildContext context) {
    final locale = Get.locale;
    final status = Status();
    final statusImFa = StatusImFa();

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
                Text(
                  '${statusImFa.getDegree(temperature2MMin.round())} / ${statusImFa.getDegree(temperature2MMax.round())}',
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  DateFormat.MMMMEEEEd(locale?.languageCode).format(timeDaily),
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  status.getText(weathercodeDaily),
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Image.asset(
            status.getImageNowDaily(weathercodeDaily, timeDaily),
            scale: 6.5,
          ),
        ],
      ),
    );
  }
}
