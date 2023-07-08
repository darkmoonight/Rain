import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/widgets/desc_container.dart';
import 'package:rain/app/widgets/shimmer.dart';
import 'package:rain/app/widgets/sunset_sunrise.dart';
import 'package:rain/app/widgets/weather_daily.dart';
import 'package:rain/app/widgets/weather_more.dart';
import 'package:rain/app/widgets/weather_now.dart';
import 'package:rain/app/widgets/weather_hourly.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await flutterLocalNotificationsPlugin.cancelAll();
        await locationController.deleteAll(false);
        await locationController.setLocation();
        setState(() {});
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: ListView(
            children: [
              Obx(
                () => locationController.isLoading.isFalse
                    ? WeatherNow(
                        time: locationController.mainWeather
                            .time![locationController.hourOfDay.value],
                        weather: locationController.mainWeather
                            .weathercode![locationController.hourOfDay.value],
                        degree: locationController.mainWeather
                            .temperature2M![locationController.hourOfDay.value],
                        timeDay: locationController.mainWeather
                            .sunrise![locationController.dayOfNow.value],
                        timeNight: locationController.mainWeather
                            .sunset![locationController.dayOfNow.value],
                      )
                    : const MyShimmer(hight: 350),
              ),
              Obx(
                () => locationController.isLoading.isFalse
                    ? Container(
                        height: 135,
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
                          key: const PageStorageKey(0),
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
                          itemScrollController:
                              locationController.itemScrollController,
                          itemCount:
                              locationController.mainWeather.time!.length,
                          itemBuilder: (ctx, i) => GestureDetector(
                            onTap: () {
                              locationController.hourOfDay.value = i;
                              locationController.dayOfNow.value =
                                  (i / 24).floor();
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: i == locationController.hourOfDay.value
                                    ? Get.isDarkMode
                                        ? Colors.indigo
                                        : Colors.amberAccent
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: WeatherHourly(
                                time: locationController.mainWeather.time![i],
                                weather: locationController
                                    .mainWeather.weathercode![i],
                                degree: locationController
                                    .mainWeather.temperature2M![i],
                                timeDay: locationController
                                    .mainWeather.sunrise![(i / 24).floor()],
                                timeNight: locationController
                                    .mainWeather.sunset![(i / 24).floor()],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const MyShimmer(
                        hight: 130,
                        edgeInsetsMargin: EdgeInsets.symmetric(vertical: 15),
                      ),
              ),
              Obx(
                () => locationController.isLoading.isFalse
                    ? SunsetSunrise(
                        timeSunrise: locationController.mainWeather
                            .sunrise![locationController.dayOfNow.value],
                        timeSunset: locationController.mainWeather
                            .sunset![locationController.dayOfNow.value],
                      )
                    : const MyShimmer(
                        hight: 90,
                        edgeInsetsMargin: EdgeInsets.only(bottom: 15),
                      ),
              ),
              Obx(
                () => locationController.isLoading.isFalse
                    ? DescContainer(
                        humidity:
                            locationController.mainWeather.relativehumidity2M![
                                locationController.hourOfDay.value],
                        wind: locationController.mainWeather
                            .windspeed10M![locationController.hourOfDay.value],
                        visibility: locationController.mainWeather
                            .visibility![locationController.hourOfDay.value],
                        feels:
                            locationController.mainWeather.apparentTemperature![
                                locationController.hourOfDay.value],
                        evaporation:
                            locationController.mainWeather.evapotranspiration![
                                locationController.hourOfDay.value],
                        precipitation: locationController.mainWeather
                            .precipitation![locationController.hourOfDay.value],
                        direction:
                            locationController.mainWeather.winddirection10M![
                                locationController.hourOfDay.value],
                        pressure:
                            locationController.mainWeather.surfacePressure![
                                locationController.hourOfDay.value],
                        rain: locationController.mainWeather
                            .rain![locationController.hourOfDay.value],
                        cloudcover: locationController.mainWeather
                            .cloudcover![locationController.hourOfDay.value],
                        windgusts: locationController.mainWeather
                            .windgusts10M![locationController.hourOfDay.value],
                        uvIndex: locationController.mainWeather
                            .uvIndex![locationController.hourOfDay.value],
                      )
                    : const MyShimmer(
                        hight: 400,
                        edgeInsetsMargin: EdgeInsets.only(bottom: 15),
                      ),
              ),
              Obx(
                () => locationController.isLoading.isFalse
                    ? WeatherDaily(
                        mainWeatherCache: locationController.mainWeather,
                        onTap: () => Get.to(
                          () => WeatherMore(
                            mainWeatherCache: locationController.mainWeather,
                          ),
                          transition: Transition.downToUp,
                        ),
                      )
                    : const MyShimmer(
                        hight: 455,
                        edgeInsetsMargin: EdgeInsets.only(bottom: 15),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
