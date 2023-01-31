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
                const WeatherNow(
                  weather: 61,
                  degree: 3.9,
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
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Center(
                    child: Wrap(
                      spacing: 25,
                      runSpacing: 15,
                      children: const [
                        DescWeather(
                          imageName: 'assets/images/humidity.png',
                          value: '76%',
                          desc: 'Влажность',
                        ),
                        DescWeather(
                          imageName: 'assets/images/wind.png',
                          value: '26.6км/ч',
                          desc: 'Ветер',
                        ),
                        DescWeather(
                          imageName: 'assets/images/foggy.png',
                          value: '24140м',
                          desc: 'Видимость',
                        ),
                        DescWeather(
                          imageName: 'assets/images/temperature.png',
                          value: '-9.4°',
                          desc: 'Ощущается',
                        ),
                        DescWeather(
                          imageName: 'assets/images/evaporation.png',
                          value: '0.02мм',
                          desc: 'Испарения',
                        ),
                        DescWeather(
                          imageName: 'assets/images/rainfall.png',
                          value: '0.01мм',
                          desc: 'Осадки',
                        ),
                        DescWeather(
                          imageName: 'assets/images/wind-direction.png',
                          value: '92°',
                          desc: 'Напрвление',
                        ),
                        DescWeather(
                          imageName: 'assets/images/atmospheric.png',
                          value: '1017ГПа',
                          desc: 'Давление',
                        ),
                        DescWeather(
                          imageName: 'assets/images/water.png',
                          value: '0.1мм',
                          desc: 'Дождь',
                        ),
                      ],
                    ),
                  ),
                ),
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
