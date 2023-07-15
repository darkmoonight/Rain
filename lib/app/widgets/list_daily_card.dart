import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status_weather.dart';
import 'package:rain/app/widgets/status_data.dart';

class ListDailyCard extends StatelessWidget {
  const ListDailyCard({
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
    final statusWeather = StatusWeather();
    final statusData = StatusData();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${statusData.getDegree(temperature2MMin.round())} / ${statusData.getDegree(temperature2MMax.round())}',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat.MMMMEEEEd(locale?.languageCode)
                        .format(timeDaily),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    statusWeather.getText(weathercodeDaily),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Image.asset(
              statusWeather.getImageNowDaily(weathercodeDaily, timeDaily),
              scale: 6.5,
            ),
          ],
        ),
      ),
    );
  }
}
