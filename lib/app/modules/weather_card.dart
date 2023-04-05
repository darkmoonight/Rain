import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/status_im_fa.dart';
import 'package:rain/app/widgets/sunset_sunrise.dart';
import 'package:rain/app/widgets/weather_daily.dart';
import 'package:rain/app/widgets/weather_now.dart';
import 'package:rain/app/widgets/weather_hourly.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WeatherCardPage extends StatefulWidget {
  const WeatherCardPage({super.key, required this.weatherCard});
  final WeatherCard weatherCard;

  @override
  State<WeatherCardPage> createState() => _WeatherCardPageState();
}

class _WeatherCardPageState extends State<WeatherCardPage> {
  final locale = Get.locale;
  final statusImFa = StatusImFa();
  final locationController = Get.put(LocationController());
  final ItemScrollController itemScrollController = ItemScrollController();
  int timeNow = 0;
  int dayNow = 0;

  @override
  void initState() {
    getTime();
    super.initState();
  }

  void getTime() {
    timeNow = locationController.getTime(
        widget.weatherCard.time!, widget.weatherCard.timezone!);
    dayNow = locationController.getDay(
        widget.weatherCard.timeDaily!, widget.weatherCard.timezone!);
    Future.delayed(const Duration(milliseconds: 30), () async {
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
        await locationController.updateCard(widget.weatherCard);
        getTime();
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Iconsax.arrow_left_1,
                size: 20,
                color: context.theme.iconTheme.color,
              )),
          title: Text(
            '${widget.weatherCard.city}'
            ', ${widget.weatherCard.district}',
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: ListView(
              children: [
                WeatherNow(
                  time: widget.weatherCard.time![timeNow],
                  weather: widget.weatherCard.weathercode![timeNow],
                  degree: widget.weatherCard.temperature2M![timeNow],
                  timeDay: widget.weatherCard.sunrise![dayNow],
                  timeNight: widget.weatherCard.sunset![dayNow],
                ),
                Container(
                  height: 130,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: ScrollablePositionedList.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return VerticalDivider(
                        width: 10,
                        color: context.theme.unselectedWidgetColor,
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
                                ? Get.isDarkMode
                                    ? Colors.indigo
                                    : Colors.amberAccent
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
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
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      Expanded(
                        child: SunsetSunrise(
                          title: 'sunrise'.tr,
                          time: widget.weatherCard.sunrise![dayNow],
                          image: 'assets/images/sunrise.png',
                        ),
                      ),
                      Expanded(
                        child: SunsetSunrise(
                          title: 'sunset'.tr,
                          time: widget.weatherCard.sunset![dayNow],
                          image: 'assets/images/sunset.png',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.only(top: 22, bottom: 5),
                  decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DescWeather(
                            imageName: 'assets/images/humidity.png',
                            value:
                                '${widget.weatherCard.relativehumidity2M![timeNow]}%',
                            desc: 'humidity'.tr,
                          ),
                          DescWeather(
                            imageName: 'assets/images/wind.png',
                            value: statusImFa.getSpeed(widget
                                .weatherCard.windspeed10M![timeNow]
                                .round()),
                            desc: 'wind'.tr,
                          ),
                          DescWeather(
                            imageName: 'assets/images/foggy.png',
                            value: statusImFa.getVisibility(
                                widget.weatherCard.visibility![timeNow]),
                            desc: 'visibility'.tr,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DescWeather(
                            imageName: 'assets/images/temperature.png',
                            value:
                                '${widget.weatherCard.apparentTemperature![timeNow].round()}°',
                            desc: 'feels'.tr,
                          ),
                          DescWeather(
                            imageName: 'assets/images/evaporation.png',
                            value: statusImFa.getPrecipitation(widget
                                .weatherCard.evapotranspiration![timeNow]
                                .abs()),
                            desc: 'evaporation'.tr,
                          ),
                          DescWeather(
                            imageName: 'assets/images/rainfall.png',
                            value: statusImFa.getPrecipitation(
                                widget.weatherCard.precipitation![timeNow]),
                            desc: 'precipitation'.tr,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DescWeather(
                            imageName: 'assets/images/wind-direction.png',
                            value:
                                '${widget.weatherCard.winddirection10M![timeNow]}°',
                            desc: 'direction'.tr,
                          ),
                          DescWeather(
                            imageName: 'assets/images/atmospheric.png',
                            value:
                                '${widget.weatherCard.surfacePressure![timeNow].round()} ${'hPa'.tr}',
                            desc: 'pressure'.tr,
                            message: widget
                                        .weatherCard.surfacePressure![timeNow]
                                        .round() <
                                    1000
                                ? 'low'.tr
                                : widget.weatherCard.surfacePressure![timeNow]
                                            .round() >
                                        1020
                                    ? 'high'.tr
                                    : 'normal'.tr,
                          ),
                          DescWeather(
                            imageName: 'assets/images/water.png',
                            value: statusImFa.getPrecipitation(
                                widget.weatherCard.rain![timeNow]),
                            desc: 'rain'.tr,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 405,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.weatherCard.timeDaily!.length,
                    itemBuilder: (ctx, i) => WeatherDaily(
                      date: widget.weatherCard.timeDaily![i],
                      weather: widget.weatherCard.weathercodeDaily![i],
                      minDegree: widget.weatherCard.temperature2MMin![i],
                      maxDegree: widget.weatherCard.temperature2MMax![i],
                    ),
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
