import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/desc/desc_container.dart';
import 'package:rain/app/widgets/sun_moon/sunset_sunrise.dart';
import 'package:rain/app/widgets/daily/weather_daily.dart';
import 'package:rain/app/widgets/daily/weather_more.dart';
import 'package:rain/app/widgets/now/weather_now.dart';
import 'package:rain/app/widgets/hourly/weather_hourly.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class InfoWeatherCard extends StatefulWidget {
  const InfoWeatherCard({
    super.key,
    required this.weatherCard,
  });
  final WeatherCard weatherCard;

  @override
  State<InfoWeatherCard> createState() => _InfoWeatherCardState();
}

class _InfoWeatherCardState extends State<InfoWeatherCard> {
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
    timeNow = weatherController.getTime(
        widget.weatherCard.time!, widget.weatherCard.timezone!);
    dayNow = weatherController.getDay(
        widget.weatherCard.timeDaily!, widget.weatherCard.timezone!);
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
    return RefreshIndicator(
      onRefresh: () async {
        await weatherController.updateCard(widget.weatherCard);
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
              Iconsax.arrow_left_1,
              size: 20,
            ),
          ),
          title: Text(
            widget.weatherCard.district!.isNotEmpty
                ? '${widget.weatherCard.city}'
                    ', ${widget.weatherCard.district}'
                : '${widget.weatherCard.city}',
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
                WeatherNow(
                  time: widget.weatherCard.time![timeNow],
                  weather: widget.weatherCard.weathercode![timeNow],
                  degree: widget.weatherCard.temperature2M![timeNow],
                  timeDay: widget.weatherCard.sunrise![dayNow],
                  timeNight: widget.weatherCard.sunset![dayNow],
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ScrollablePositionedList.separated(
                        key: const PageStorageKey(1),
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return const VerticalDivider(
                            width: 10,
                            indent: 40,
                            endIndent: 40,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemScrollController: itemScrollController,
                        itemCount: widget.weatherCard.time!.length,
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
                                  ? context.theme.colorScheme.primaryContainer
                                  : Colors.transparent,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: WeatherHourly(
                              time: widget.weatherCard.time![i],
                              weather: widget.weatherCard.weathercode![i],
                              degree: widget.weatherCard.temperature2M![i],
                              timeDay:
                                  widget.weatherCard.sunrise![(i / 24).floor()],
                              timeNight:
                                  widget.weatherCard.sunset![(i / 24).floor()],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SunsetSunrise(
                  timeSunrise: widget.weatherCard.sunrise![dayNow],
                  timeSunset: widget.weatherCard.sunset![dayNow],
                ),
                DescContainer(
                  humidity: widget.weatherCard.relativehumidity2M?[timeNow],
                  wind: widget.weatherCard.windspeed10M?[timeNow],
                  visibility: widget.weatherCard.visibility?[timeNow],
                  feels: widget.weatherCard.apparentTemperature?[timeNow],
                  evaporation: widget.weatherCard.evapotranspiration?[timeNow],
                  precipitation: widget.weatherCard.precipitation?[timeNow],
                  direction: widget.weatherCard.winddirection10M?[timeNow],
                  pressure: widget.weatherCard.surfacePressure?[timeNow],
                  rain: widget.weatherCard.rain?[timeNow],
                  cloudcover: widget.weatherCard.cloudcover?[timeNow],
                  windgusts: widget.weatherCard.windgusts10M?[timeNow],
                  uvIndex: widget.weatherCard.uvIndex?[timeNow],
                ),
                WeatherDaily(
                  weatherData: widget.weatherCard.toJson(),
                  onTap: () => Get.to(
                    () => WeatherMore(
                      weatherData: widget.weatherCard.toJson(),
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
