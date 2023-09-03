import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/widgets/desc/desc_container.dart';
import 'package:rain/app/widgets/shimmer.dart';
import 'package:rain/app/widgets/sun_moon/sunset_sunrise.dart';
import 'package:rain/app/widgets/daily/weather_daily.dart';
import 'package:rain/app/widgets/daily/weather_more.dart';
import 'package:rain/app/widgets/now/weather_now.dart';
import 'package:rain/app/widgets/hourly/weather_hourly.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await flutterLocalNotificationsPlugin.cancelAll();
        await weatherController.deleteAll(false);
        await weatherController.setLocation();
        setState(() {});
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: ListView(
            children: [
              Obx(
                () => weatherController.isLoading.isFalse
                    ? WeatherNow(
                        time: weatherController.mainWeather
                            .time![weatherController.hourOfDay.value],
                        weather: weatherController.mainWeather
                            .weathercode![weatherController.hourOfDay.value],
                        degree: weatherController.mainWeather
                            .temperature2M![weatherController.hourOfDay.value],
                        timeDay: weatherController.mainWeather
                            .sunrise![weatherController.dayOfNow.value],
                        timeNight: weatherController.mainWeather
                            .sunset![weatherController.dayOfNow.value],
                      )
                    : const MyShimmer(hight: 350),
              ),
              Obx(
                () => weatherController.isLoading.isFalse
                    ? Card(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: SizedBox(
                          height: 135,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ScrollablePositionedList.separated(
                              key: const PageStorageKey(0),
                              physics: const AlwaysScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const VerticalDivider(
                                  width: 10,
                                  indent: 40,
                                  endIndent: 40,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemScrollController:
                                  weatherController.itemScrollController,
                              itemCount:
                                  weatherController.mainWeather.time!.length,
                              itemBuilder: (ctx, i) => GestureDetector(
                                onTap: () {
                                  weatherController.hourOfDay.value = i;
                                  weatherController.dayOfNow.value =
                                      (i / 24).floor();
                                  setState(() {});
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        i == weatherController.hourOfDay.value
                                            ? context.theme.colorScheme
                                                .primaryContainer
                                            : Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: WeatherHourly(
                                    time:
                                        weatherController.mainWeather.time![i],
                                    weather: weatherController
                                        .mainWeather.weathercode![i],
                                    degree: weatherController
                                        .mainWeather.temperature2M![i],
                                    timeDay: weatherController
                                        .mainWeather.sunrise![(i / 24).floor()],
                                    timeNight: weatherController
                                        .mainWeather.sunset![(i / 24).floor()],
                                  ),
                                ),
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
                () => weatherController.isLoading.isFalse
                    ? SunsetSunrise(
                        timeSunrise: weatherController.mainWeather
                            .sunrise![weatherController.dayOfNow.value],
                        timeSunset: weatherController.mainWeather
                            .sunset![weatherController.dayOfNow.value],
                      )
                    : const MyShimmer(
                        hight: 90,
                        edgeInsetsMargin: EdgeInsets.only(bottom: 15),
                      ),
              ),
              Obx(
                () => weatherController.isLoading.isFalse
                    ? DescContainer(
                        humidity:
                            weatherController.mainWeather.relativehumidity2M![
                                weatherController.hourOfDay.value],
                        wind: weatherController.mainWeather
                            .windspeed10M![weatherController.hourOfDay.value],
                        visibility: weatherController.mainWeather
                            .visibility![weatherController.hourOfDay.value],
                        feels:
                            weatherController.mainWeather.apparentTemperature![
                                weatherController.hourOfDay.value],
                        evaporation:
                            weatherController.mainWeather.evapotranspiration![
                                weatherController.hourOfDay.value],
                        precipitation: weatherController.mainWeather
                            .precipitation![weatherController.hourOfDay.value],
                        direction:
                            weatherController.mainWeather.winddirection10M![
                                weatherController.hourOfDay.value],
                        pressure:
                            weatherController.mainWeather.surfacePressure![
                                weatherController.hourOfDay.value],
                        rain: weatherController.mainWeather
                            .rain![weatherController.hourOfDay.value],
                        cloudcover: weatherController.mainWeather
                            .cloudcover![weatherController.hourOfDay.value],
                        windgusts: weatherController.mainWeather
                            .windgusts10M![weatherController.hourOfDay.value],
                        uvIndex: weatherController.mainWeather
                            .uvIndex![weatherController.hourOfDay.value],
                      )
                    : const MyShimmer(
                        hight: 400,
                        edgeInsetsMargin: EdgeInsets.only(bottom: 15),
                      ),
              ),
              Obx(
                () => weatherController.isLoading.isFalse
                    ? WeatherDaily(
                        weatherData: weatherController.mainWeather.toJson(),
                        onTap: () => Get.to(
                          () => WeatherMore(
                            weatherData: weatherController.mainWeather.toJson(),
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
