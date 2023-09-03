import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/daily/info_daily_card.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/app/widgets/status/status_data.dart';
import 'package:rain/main.dart';

class WeatherDaily extends StatefulWidget {
  const WeatherDaily({
    super.key,
    required this.weatherData,
    required this.onTap,
  });
  final Map<String, dynamic> weatherData;
  final Function() onTap;

  @override
  State<WeatherDaily> createState() => _WeatherDailyState();
}

class _WeatherDailyState extends State<WeatherDaily> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 455,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () => Get.to(
                          () => InfoDailyCard(
                                weatherData: widget.weatherData,
                                index: index,
                              ),
                          transition: Transition.downToUp),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                DateFormat.EEEE(locale.languageCode).format(
                                    widget.weatherData['timeDaily'][index]),
                                style: context.textTheme.labelLarge,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    statusWeather.getImage7Day(
                                        widget.weatherData['weathercodeDaily']
                                            [index]),
                                    scale: 3,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      statusWeather.getText(
                                          widget.weatherData['weathercodeDaily']
                                              [index]),
                                      style: context.textTheme.labelLarge,
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
                                    statusData.getDegree(widget
                                        .weatherData['temperature2MMin'][index]
                                        .round()),
                                    style: context.textTheme.labelLarge,
                                  ),
                                  Text(
                                    ' / ',
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    statusData.getDegree(widget
                                        .weatherData['temperature2MMax'][index]
                                        .round()),
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      color: Colors.grey,
                                    ),
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
              ),
              const Divider(),
              InkWell(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'weatherMore'.tr,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
