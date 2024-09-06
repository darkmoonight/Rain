import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_card_info.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/main.dart';

class DailyContainer extends StatefulWidget {
  const DailyContainer({
    super.key,
    required this.weatherData,
    required this.onTap,
  });

  final WeatherCard weatherData;
  final VoidCallback onTap;

  @override
  State<DailyContainer> createState() => _DailyContainerState();
}

class _DailyContainerState extends State<DailyContainer> {
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
                    () => DailyCardInfo(
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
                              const Gap(5),
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
                                style: labelLarge,
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
