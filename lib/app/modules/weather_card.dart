import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/desc_container.dart';
import 'package:rain/app/widgets/sunset_sunrise.dart';
import 'package:rain/app/widgets/weather_daily.dart';
import 'package:rain/app/widgets/weather_now.dart';
import 'package:rain/app/widgets/weather_hourly.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WeatherCardPage extends StatefulWidget {
  const WeatherCardPage({
    super.key,
    required this.weatherCard,
  });
  final WeatherCard weatherCard;

  @override
  State<WeatherCardPage> createState() => _WeatherCardPageState();
}

class _WeatherCardPageState extends State<WeatherCardPage> {
  int timeNow = 0;
  int dayNow = 0;
  final locationController = Get.put(LocationController());
  final ItemScrollController itemScrollController = ItemScrollController();

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
            ),
          ),
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
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
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
                SunsetSunrise(
                  timeSunrise: widget.weatherCard.sunrise![dayNow],
                  timeSunset: widget.weatherCard.sunset![dayNow],
                ),
                DescContainer(
                  humidity: widget.weatherCard.relativehumidity2M![timeNow],
                  wind: widget.weatherCard.windspeed10M![timeNow],
                  visibility: widget.weatherCard.visibility![timeNow],
                  feels: widget.weatherCard.apparentTemperature![timeNow],
                  evaporation: widget.weatherCard.evapotranspiration![timeNow],
                  precipitation: widget.weatherCard.precipitation![timeNow],
                  direction: widget.weatherCard.winddirection10M![timeNow],
                  pressure: widget.weatherCard.surfacePressure![timeNow],
                  rain: widget.weatherCard.rain![timeNow],
                  cloudcover: widget.weatherCard.cloudcover![timeNow],
                  windgusts: widget.weatherCard.windgusts10M![timeNow],
                  uvIndex: widget.weatherCard.uvIndex![timeNow],
                ),
                WeatherDaily(
                  date: widget.weatherCard.timeDaily!,
                  weather: widget.weatherCard.weathercodeDaily!,
                  minDegree: widget.weatherCard.temperature2MMin!,
                  maxDegree: widget.weatherCard.temperature2MMax!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
