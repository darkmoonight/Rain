import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/weather_7days.dart';
import 'package:rain/app/api/weather_day.dart';
import 'package:rain/app/services/location_service.dart';
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
  late int getTime;
  late DateTime nowDate;

  String? lat, long, country, locality;

  late ScrollController controller;
  bool fabIsVisible = true;
  final duration = const Duration(milliseconds: 300);

  Future<Hourly>? hourly;
  Future<Daily>? daily;

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

  Future<void> getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      final placeMark = await service.getPlaceMark(locationData: locationData);

      setState(() {
        lat = locationData.latitude!.toStringAsFixed(2);
        long = locationData.longitude!.toStringAsFixed(2);

        country = placeMark?.country ?? '';
        locality = placeMark?.locality ?? '';
      });

      hourly = WeatherAPI().getWeatherData('$lat', '$long');
      daily = WeatherAPI().getWeather7Data('$lat', '$long');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getLocation();
    });
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        fabIsVisible =
            controller.position.userScrollDirection == ScrollDirection.forward;
      });
    });
    nowDate = alignDateTime(DateTime.now(), const Duration(hours: 1), true);
  }

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
      body: RefreshIndicator(
        onRefresh: getLocation,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overScroll) {
                overScroll.disallowIndicator();
                return false;
              },
              child: ListView(
                controller: controller,
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
                              '${locality ?? 'Поиск'}, ${country ?? 'выполняется сканирование'}',
                              style: context.theme.textTheme.labelLarge,
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
                    future: hourly,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Shimmer.fromColors(
                          baseColor: context.theme.colorScheme.primaryContainer,
                          highlightColor: context.theme.unselectedWidgetColor,
                          child: Container(
                            height: 350,
                            decoration: BoxDecoration(
                                color:
                                    context.theme.colorScheme.primaryContainer,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                          ),
                        );
                      }
                      final weather = snapshot.data;
                      for (var i = 0; i < weather!.time.length; i++) {
                        if (nowDate.isAtSameMomentAs(
                            DateTime.parse(weather.time[i]))) {
                          getTime = i;
                        }
                      }
                      return WeatherNow(
                        weather: weather.weathercode[getTime],
                        degree: weather.temperature2M[getTime],
                      );
                    },
                  ),
                  FutureBuilder<Hourly>(
                    future: hourly,
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
                                color:
                                    context.theme.colorScheme.primaryContainer,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
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
                    future: hourly,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Shimmer.fromColors(
                          baseColor: context.theme.colorScheme.primaryContainer,
                          highlightColor: context.theme.unselectedWidgetColor,
                          child: Container(
                            height: 350,
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
                      final weather = snapshot.data;
                      for (var i = 0; i < weather!.time.length; i++) {
                        if (nowDate.isAtSameMomentAs(
                            DateTime.parse(weather.time[i]))) {
                          getTime = i;
                        }
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
                                    '${weather.relativehumidity2M[getTime]}%',
                                desc: 'Влажность',
                              ),
                              DescWeather(
                                imageName: 'assets/images/wind.png',
                                value: '${weather.windspeed10M[getTime]} км/ч',
                                desc: 'Ветер',
                              ),
                              DescWeather(
                                imageName: 'assets/images/foggy.png',
                                value:
                                    '${weather.visibility[getTime].round().toInt()} м',
                                desc: 'Видимость',
                              ),
                              DescWeather(
                                imageName: 'assets/images/temperature.png',
                                value:
                                    '${weather.apparentTemperature[getTime].round().toInt()}°',
                                desc: 'Ощущается',
                              ),
                              DescWeather(
                                imageName: 'assets/images/evaporation.png',
                                value:
                                    '${weather.evapotranspiration[getTime].abs()} мм',
                                desc: 'Испарения',
                              ),
                              DescWeather(
                                imageName: 'assets/images/rainfall.png',
                                value: '${weather.precipitation[getTime]} мм',
                                desc: 'Осадки',
                              ),
                              DescWeather(
                                imageName: 'assets/images/wind-direction.png',
                                value: '${weather.winddirection10M[getTime]}°',
                                desc: 'Напрвление',
                              ),
                              DescWeather(
                                imageName: 'assets/images/atmospheric.png',
                                value:
                                    '${weather.surfacePressure[getTime]} ГПа',
                                desc: 'Давление',
                              ),
                              DescWeather(
                                imageName: 'assets/images/water.png',
                                value: '${weather.rain[getTime]} мм',
                                desc: 'Дождь',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  FutureBuilder<Daily>(
                    future: daily,
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
                                color:
                                    context.theme.colorScheme.primaryContainer,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                          ),
                        );
                      }
                      final weather = snapshot.data!;
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
                            date: snapshot.data!.time[i],
                            weather: weather.weathercode[i],
                            minDegree: weather.temperature2MMin[i],
                            maxDegree: weather.temperature2MMax[i],
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
      ),
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: fabIsVisible ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: fabIsVisible ? 1 : 0,
          child: FloatingActionButton(
            onPressed: getLocation,
            child: const Icon(Iconsax.gps),
          ),
        ),
      ),
    );
  }
}
