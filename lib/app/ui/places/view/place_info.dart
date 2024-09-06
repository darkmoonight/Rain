import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_card_list.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_container.dart';
import 'package:rain/app/ui/widgets/weather/desc/desc_container.dart';
import 'package:rain/app/ui/widgets/weather/hourly.dart';
import 'package:rain/app/ui/widgets/weather/now.dart';
import 'package:rain/app/ui/widgets/weather/sunset_sunrise.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PlaceInfo extends StatefulWidget {
  const PlaceInfo({
    super.key,
    required this.weatherCard,
  });
  final WeatherCard weatherCard;

  @override
  State<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo> {
  int timeNow = 0;
  int dayNow = 0;
  final weatherController = Get.put(WeatherController());
  final itemScrollController = ItemScrollController();

  @override
  void initState() {
    getTime();
    super.initState();
  }

  void getTime() {
    final weatherCard = widget.weatherCard;

    timeNow =
        weatherController.getTime(weatherCard.time!, weatherCard.timezone!);
    dayNow =
        weatherController.getDay(weatherCard.timeDaily!, weatherCard.timezone!);
    Future.delayed(const Duration(milliseconds: 30), () {
      itemScrollController.scrollTo(
        index: timeNow,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherCard = widget.weatherCard;

    return RefreshIndicator(
      onRefresh: () async {
        await weatherController.updateCard(weatherCard);
        getTime();
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              IconsaxPlusLinear.arrow_left_3,
              size: 20,
            ),
          ),
          title: Text(
            weatherCard.district!.isNotEmpty
                ? '${weatherCard.city}'
                    ', ${weatherCard.district}'
                : '${weatherCard.city}',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Now(
                  time: weatherCard.time![timeNow],
                  weather: weatherCard.weathercode![timeNow],
                  degree: weatherCard.temperature2M![timeNow],
                  feels: weatherCard.apparentTemperature![timeNow]!,
                  timeDay: weatherCard.sunrise![dayNow],
                  timeNight: weatherCard.sunset![dayNow],
                  tempMax: weatherCard.temperature2MMax![dayNow]!,
                  tempMin: weatherCard.temperature2MMin![dayNow]!,
                ),
                Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: SizedBox(
                      height: 135,
                      child: ScrollablePositionedList.separated(
                        key: const PageStorageKey(1),
                        separatorBuilder: (BuildContext context, int index) {
                          return const VerticalDivider(
                            width: 10,
                            indent: 40,
                            endIndent: 40,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemScrollController: itemScrollController,
                        itemCount: weatherCard.time!.length,
                        itemBuilder: (ctx, i) => GestureDetector(
                          onTap: () {
                            timeNow = i;
                            dayNow = (i / 24).floor();
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: i == timeNow
                                  ? context.theme.colorScheme.secondaryContainer
                                  : Colors.transparent,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Hourly(
                              time: weatherCard.time![i],
                              weather: weatherCard.weathercode![i],
                              degree: weatherCard.temperature2M![i],
                              timeDay: weatherCard.sunrise![(i / 24).floor()],
                              timeNight: weatherCard.sunset![(i / 24).floor()],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SunsetSunrise(
                  timeSunrise: weatherCard.sunrise![dayNow],
                  timeSunset: weatherCard.sunset![dayNow],
                ),
                DescContainer(
                  humidity: weatherCard.relativehumidity2M?[timeNow],
                  wind: weatherCard.windspeed10M?[timeNow],
                  visibility: weatherCard.visibility?[timeNow],
                  feels: weatherCard.apparentTemperature?[timeNow],
                  evaporation: weatherCard.evapotranspiration?[timeNow],
                  precipitation: weatherCard.precipitation?[timeNow],
                  direction: weatherCard.winddirection10M?[timeNow],
                  pressure: weatherCard.surfacePressure?[timeNow],
                  rain: weatherCard.rain?[timeNow],
                  cloudcover: weatherCard.cloudcover?[timeNow],
                  windgusts: weatherCard.windgusts10M?[timeNow],
                  uvIndex: weatherCard.uvIndex?[timeNow],
                  dewpoint2M: weatherCard.dewpoint2M?[timeNow],
                  precipitationProbability:
                      weatherCard.precipitationProbability?[timeNow],
                  shortwaveRadiation: weatherCard.shortwaveRadiation?[timeNow],
                  initiallyExpanded: false,
                  title: 'hourlyVariables'.tr,
                ),
                DailyContainer(
                  weatherData: weatherCard,
                  onTap: () => Get.to(
                    () => DailyCardList(
                      weatherData: weatherCard,
                    ),
                    transition: Transition.downToUp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
