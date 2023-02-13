import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/weather_7days.dart';
import 'package:rain/app/api/weather_day.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/weather_7days.dart';
import 'package:rain/app/widgets/weather_now.dart';
import 'package:rain/app/widgets/weather_today.dart';
import 'package:rain/main.dart';
import 'package:rain/theme/theme_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final locale = Get.locale;
  final themeController = Get.put(ThemeController());
  int? getTime;
  late DateTime nowDate;

  final weatherAPI = WeatherAPI();
  Future<Hourly>? hourly;
  Future<Daily>? daily;

  String? lat, lon, country, city;

  final ItemScrollController itemScrollController = ItemScrollController();

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

  Future<void> updatePosition() async {
    final theme = context.theme;
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    nowDate = alignDateTime(DateTime.now(), const Duration(hours: 1), true);

    if (await isDeviceConnectedNotifier.value) {
      Position pos = await determinePosition();
      List<Placemark> pm =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);
      setState(
        () {
          lat = pos.latitude.toString();
          lon = pos.longitude.toString();
          country = pm[0].country.toString();
          city = pm[0].locality.toString();

          hourly = weatherAPI.getWeatherData(lat, lon);
          daily = weatherAPI.getWeather7Data(lat, lon);

          Future.delayed(Duration.zero, () async {
            final weather = await hourly!;
            for (var i = 0; i < weather.time.length; i++) {
              if (nowDate.isAtSameMomentAs(DateTime.parse(weather.time[i]))) {
                getTime = i;
                Future.delayed(const Duration(milliseconds: 30), () async {
                  itemScrollController.scrollTo(
                    index: getTime!,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOutCubic,
                  );
                });
              }
            }
          });
        },
      );
    } else {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        backgroundColor: theme.snackBarTheme.backgroundColor,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
    }

    if (!serviceEnabled) {
      Get.snackbar(
        'location'.tr,
        'no_location'.tr,
        backgroundColor: theme.snackBarTheme.backgroundColor,
        mainButton: TextButton(
          onPressed: () => Geolocator.openLocationSettings(),
          child: Text(
            'settings'.tr,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blue),
          ),
        ),
        icon: const Icon(Iconsax.location_slash),
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      );
      return Future.error('Location services are disabled.');
    }
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      determinePosition();
      updatePosition();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset(
          'assets/icons/logo.png',
          scale: 20,
        ),
        title: Center(
          child: Text(
            city == null && country == null
                ? 'search'.tr
                : '$city, ' '$country',
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                themeController.changeThemeMode(ThemeMode.light);
                themeController.saveTheme(false);
              } else {
                themeController.changeThemeMode(ThemeMode.dark);
                themeController.saveTheme(true);
              }
            },
            icon: Icon(
              Get.isDarkMode ? Iconsax.sun_1 : Iconsax.moon,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              size: 18,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: updatePosition,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: ListView(
              children: [
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
                              color: context.theme.colorScheme.primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                        ),
                      );
                    }
                    final weather = snapshot.data!;
                    return WeatherNow(
                      time: weather.time[getTime!],
                      weather: weather.weathercode[getTime!],
                      degree: weather.temperature2M[getTime!],
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
                              color: context.theme.colorScheme.primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                        ),
                      );
                    }
                    final weather = snapshot.data!;
                    return Container(
                      height: 130,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                        itemCount: snapshot.data!.time.length,
                        itemBuilder: (ctx, i) => GestureDetector(
                          onTap: () {
                            getTime = i;
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                color: i == getTime
                                    ? Get.isDarkMode
                                        ? Colors.indigo
                                        : Colors.amberAccent
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: WeatherToday(
                              time: weather.time[i],
                              weather: weather.weathercode[i],
                              degree: weather.temperature2M[i],
                            ),
                          ),
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
                              color: context.theme.colorScheme.primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                        ),
                      );
                    }
                    final weather = snapshot.data!;
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
                          spacing: 5,
                          runSpacing: 15,
                          children: [
                            DescWeather(
                              imageName: 'assets/images/humidity.png',
                              value: '${weather.relativehumidity2M[getTime!]}%',
                              desc: 'humidity'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/wind.png',
                              value:
                                  '${weather.windspeed10M[getTime!]} ${'km'.tr}',
                              desc: 'wind'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/foggy.png',
                              value:
                                  '${weather.visibility[getTime!].round().toInt()} ${'m'.tr}',
                              desc: 'visibility'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/temperature.png',
                              value:
                                  '${weather.apparentTemperature[getTime!].round().toInt()}°',
                              desc: 'feels'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/evaporation.png',
                              value:
                                  '${weather.evapotranspiration[getTime!].abs()} ${'mm'.tr}',
                              desc: 'evaporation'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/rainfall.png',
                              value:
                                  '${weather.precipitation[getTime!]} ${'mm'.tr}',
                              desc: 'precipitation'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/wind-direction.png',
                              value: '${weather.winddirection10M[getTime!]}°',
                              desc: 'direction'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/atmospheric.png',
                              value:
                                  '${weather.surfacePressure[getTime!]} ${'hPa'.tr}',
                              desc: 'pressure'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/water.png',
                              value: '${weather.rain[getTime!]} ${'mm'.tr}',
                              desc: 'rain'.tr,
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
                              color: context.theme.colorScheme.primaryContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
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
    );
  }
}
