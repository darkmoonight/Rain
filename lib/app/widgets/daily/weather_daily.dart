import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/daily/info_daily_card.dart';
import 'package:rain/app/widgets/status/status_data.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/main.dart';

class WeatherDaily extends StatefulWidget {
  const WeatherDaily({
    super.key,
    required this.weatherData,
    required this.onTap,
  });

  final WeatherCard weatherData;
  final VoidCallback onTap;

  @override
  State<WeatherDaily> createState() => _WeatherDailyState();
}

class _WeatherDailyState extends State<WeatherDaily> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    final splashColor = context.theme.colorScheme.primary.withOpacity(0.4);
    const inkWellBorderRadius = BorderRadius.all(
      Radius.circular(16),
    );

    final weatherData = widget.weatherData;
    final weatherCodeDaily = weatherData.weathercodeDaily ?? [];
    final textTheme = context.textTheme;
    final labelLarge = textTheme.labelLarge;
    final bodyMediumGrey = textTheme.bodyMedium?.copyWith(
      color: Colors.grey,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (ctx, index) {
                return InkWell(
                  splashColor: splashColor,
                  borderRadius: inkWellBorderRadius,
                  onTap: () => Get.to(
                    () => InfoDailyCard(
                      weatherData: weatherData,
                      index: index,
                    ),
                    transition: Transition.downToUp,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            DateFormat.EEEE(locale.languageCode)
                                .format((weatherData.timeDaily ?? [])[index]),
                            style: labelLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                statusWeather
                                    .getImage7Day(weatherCodeDaily[index]),
                                scale: 3,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  statusWeather
                                      .getText(weatherCodeDaily[index]),
                                  style: labelLarge,
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
                                statusData.getDegree(
                                    (weatherData.temperature2MMin ?? [])[index]
                                        ?.round()),
                                style: labelLarge,
                              ),
                              Text(
                                ' / ',
                                style: bodyMediumGrey,
                              ),
                              Text(
                                statusData.getDegree(
                                    (weatherData.temperature2MMax ?? [])[index]
                                        ?.round()),
                                style: labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Divider(),
            InkWell(
              splashColor: splashColor,
              borderRadius: inkWellBorderRadius,
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'weatherMore'.tr,
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
