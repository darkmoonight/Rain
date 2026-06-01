import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:timezone/standalone.dart' as tz;

class PlaceCard extends ConsumerWidget {
  const PlaceCard({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
    required this.district,
    required this.city,
    required this.timezone,
    required this.timeDay,
    required this.timeNight,
    required this.timeDaily,
  });

  final List<String> time;
  final List<String> timeDay;
  final List<String> timeNight;
  final List<DateTime> timeDaily;
  final String district;
  final String city;
  final List<int> weather;
  final List<double> degree;
  final String timezone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusWeather = StatusWeather();
    final statusData = StatusData(settings: ref.watch(settingsProvider));
    final currentTimeIndex = TimeIndexHelper.getTime(time, timezone);
    final currentDayIndex = TimeIndexHelper.getDay(timeDaily, timezone);

    String locationText;
    if (district.isEmpty) {
      locationText = city;
    } else if (city.isEmpty) {
      locationText = district;
    } else if (city == district) {
      locationText = city;
    } else {
      locationText = '$city, $district';
    }

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
                  Row(
                    children: [
                      Text(
                        statusData.getDegree(degree[currentTimeIndex]),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(7),
                      Text(
                        statusWeather.getText(weather[currentTimeIndex]),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    locationText,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(5),
                  StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, _) => Text(
                      '${'time'.tr}: ${statusData.getTimeFormatTz(tz.TZDateTime.now(tz.getLocation(timezone)))}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              statusWeather.getImageNow(
                weather[currentTimeIndex],
                time[currentTimeIndex],
                timeDay[currentDayIndex],
                timeNight[currentDayIndex],
              ),
              scale: 6.5,
            ),
          ],
        ),
      ),
    );
  }
}
