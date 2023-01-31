import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/weather_7days.dart';
import 'package:rain/app/api/weather_day.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/weather_7days.dart';
import 'package:rain/app/widgets/weather_now.dart';
import 'package:rain/app/widgets/weather_today.dart';
import 'package:rain/theme/theme_controller.dart';
import 'package:shimmer/shimmer.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final locale = Get.locale;
  final themeController = Get.put(ThemeController());

  DateTime alignDateTime(DateTime dt, Duration alignment,
      [bool roundUp = false]) {
    assert(alignment >= Duration.zero);
    if (alignment == Duration.zero) return dt;
    final correction = Duration(
        days: 0,
        hours: alignment.inDays > 0
            ? dt.hour
            : alignment.inHours > 0
                ? dt.hour % alignment.inHours
                : 0,
        minutes: alignment.inHours > 0
            ? dt.minute
            : alignment.inMinutes > 0
                ? dt.minute % alignment.inMinutes
                : 0,
        seconds: alignment.inMinutes > 0
            ? dt.second
            : alignment.inSeconds > 0
                ? dt.second % alignment.inSeconds
                : 0,
        milliseconds: alignment.inSeconds > 0
            ? dt.millisecond
            : alignment.inMilliseconds > 0
                ? dt.millisecond % alignment.inMilliseconds
                : 0,
        microseconds: alignment.inMilliseconds > 0 ? dt.microsecond : 0);
    if (correction == Duration.zero) return dt;
    final corrected = dt.subtract(correction);
    final result = roundUp ? corrected.add(alignment) : corrected;
    return result;
  }

  DateTime? nowDate;

  @override
  void initState() {
    super.initState();

    nowDate = alignDateTime(DateTime.now(), const Duration(hours: 1));
  }

  int? getTime;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Iconsax.moon5);
        }
        return const Icon(Iconsax.sun_15);
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScroll) {
              overScroll.disallowIndicator();
              return false;
            },
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/map.png',
                            scale: 35,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Ростов-на-Дону, Россия',
                            style: context.theme.textTheme.labelLarge,
                          ),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      alignment: Alignment.centerRight,
                      scale: 0.7,
                      child: Switch(
                        thumbIcon: thumbIcon,
                        value: Get.isDarkMode,
                        onChanged: (_) {
                          if (Get.isDarkMode) {
                            themeController.changeThemeMode(ThemeMode.light);
                            themeController.saveTheme(false);
                          } else {
                            themeController.changeThemeMode(ThemeMode.dark);
                            themeController.saveTheme(true);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                FutureBuilder<Hourly>(
                  future: WeatherAPI().getWeatherData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Shimmer.fromColors(
                        baseColor: context.theme.colorScheme.primaryContainer,
                        highlightColor: context.theme.unselectedWidgetColor,
                        child: Container(
                          height: 350,
                          decoration: BoxDecoration(
                              color: context.theme.colorScheme.primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                        ),
                      );
                    }
                    for (var i = 0; i < snapshot.data!.time.length; i++) {
                      if (nowDate!.isAtSameMomentAs(
                          DateTime.parse(snapshot.data!.time[i]))) {
                        getTime = i;
                      }
                    }
                    return WeatherNow(
                      weather: snapshot.data!.weathercode[getTime!],
                      degree: snapshot.data!.temperature2M[getTime!],
                    );
                  },
                ),
                FutureBuilder<Hourly>(
                  future: WeatherAPI().getWeatherData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Shimmer.fromColors(
                        baseColor: context.theme.colorScheme.primaryContainer,
                        highlightColor: context.theme.unselectedWidgetColor,
                        child: Container(
                          height: 130,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: context.theme.colorScheme.primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                        ),
                      );
                    }
                    return Container(
                      height: 130,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: context.theme.colorScheme.primaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return VerticalDivider(
                            width: 30,
                            color: context.theme.unselectedWidgetColor,
                            indent: 40,
                            endIndent: 40,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.time.length,
                        itemBuilder: (ctx, i) => WeatherToday(
                          time: snapshot.data!.time[i],
                          weather: snapshot.data!.weathercode[i],
                          degree: snapshot.data!.temperature2M[i],
                        ),
                      ),
                    );
                  },
                ),
                FutureBuilder<Hourly>(
                    future: WeatherAPI().getWeatherData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Shimmer.fromColors(
                          baseColor: context.theme.colorScheme.primaryContainer,
                          highlightColor: context.theme.unselectedWidgetColor,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            decoration: BoxDecoration(
                                color:
                                    context.theme.colorScheme.primaryContainer,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25))),
                          ),
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            color: context.theme.colorScheme.primaryContainer,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25))),
                        child: Center(
                          child: Wrap(
                            spacing: 25,
                            runSpacing: 15,
                            children: [
                              DescWeather(
                                imageName: 'assets/images/humidity.png',
                                value:
                                    '${snapshot.data!.relativehumidity2M[getTime!]}%',
                                desc: 'Влажность',
                              ),
                              DescWeather(
                                imageName: 'assets/images/wind.png',
                                value:
                                    '${snapshot.data!.windspeed10M[getTime!]}км/ч',
                                desc: 'Ветер',
                              ),
                              DescWeather(
                                imageName: 'assets/images/foggy.png',
                                value:
                                    '${snapshot.data!.visibility[getTime!]}м',
                                desc: 'Видимость',
                              ),
                              DescWeather(
                                imageName: 'assets/images/temperature.png',
                                value:
                                    '${snapshot.data!.apparentTemperature[getTime!]}°',
                                desc: 'Ощущается',
                              ),
                              DescWeather(
                                imageName: 'assets/images/evaporation.png',
                                value:
                                    '${snapshot.data!.evapotranspiration[getTime!]}мм',
                                desc: 'Испарения',
                              ),
                              DescWeather(
                                imageName: 'assets/images/rainfall.png',
                                value:
                                    '${snapshot.data!.precipitation[getTime!]}мм',
                                desc: 'Осадки',
                              ),
                              DescWeather(
                                imageName: 'assets/images/wind-direction.png',
                                value:
                                    '${snapshot.data!.winddirection10M[getTime!]}°',
                                desc: 'Напрвление',
                              ),
                              DescWeather(
                                imageName: 'assets/images/atmospheric.png',
                                value:
                                    '${snapshot.data!.surfacePressure[getTime!]}ГПа',
                                desc: 'Давление',
                              ),
                              DescWeather(
                                imageName: 'assets/images/water.png',
                                value: '${snapshot.data!.rain[getTime!]}мм',
                                desc: 'Дождь',
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                FutureBuilder<Daily>(
                  future: WeatherAPI().getWeather7Data(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Shimmer.fromColors(
                        baseColor: context.theme.colorScheme.primaryContainer,
                        highlightColor: context.theme.unselectedWidgetColor,
                        child: Container(
                          height: 405,
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: context.theme.colorScheme.primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                        ),
                      );
                    }
                    return Container(
                      height: 405,
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: context.theme.colorScheme.primaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.time.length,
                        itemBuilder: (ctx, i) => Weather7Days(
                          date: DateFormat.EEEE(locale?.languageCode)
                              .format(snapshot.data!.time[i]),
                          weather: snapshot.data!.weathercode[i],
                          minDegree: snapshot.data!.temperature2MMin[i],
                          maxDegree: snapshot.data!.temperature2MMax[i],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
