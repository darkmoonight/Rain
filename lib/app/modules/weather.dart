import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/desc.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final locale = Get.locale;
  @override
  Widget build(BuildContext context) {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.location,
                            size: 16,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            'Ростов-на-Дону, Россия',
                            style: context.theme.textTheme.headline6,
                          ),
                          const SizedBox(width: 3),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Icon(Iconsax.sun_1),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ],
                ),
                SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/sunny.png'),
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Column(
                            children: [
                              GlowText(
                                '-2.6',
                                style:
                                    context.theme.textTheme.headline1?.copyWith(
                                  fontSize: 90,
                                  fontWeight: FontWeight.w800,
                                  height: 0.1,
                                ),
                                blurRadius: 2,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Солнечно',
                                style: context.theme.textTheme.headline6
                                    ?.copyWith(fontSize: 20),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                DateFormat.MMMMEEEEd('${locale?.languageCode}')
                                    .format(
                                  DateTime.now(),
                                ),
                                style: context.theme.primaryTextTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.theme.backgroundColor,
                          context.theme.primaryColor
                        ],
                      ),
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
                    itemCount: 10,
                    itemBuilder: (ctx, i) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '00:00',
                          style: context.theme.primaryTextTheme.subtitle1,
                        ),
                        Image.asset(
                          'assets/images/snow_2d.png',
                          scale: 5,
                        ),
                        Text(
                          '-2.6°',
                          style: context.theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 355,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.theme.backgroundColor,
                          context.theme.primaryColor
                        ],
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (ctx, i) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat.EEEE('${locale?.languageCode}')
                                .format(DateTime.now()),
                            style: context.theme.primaryTextTheme.subtitle1
                                ?.copyWith(fontSize: 16),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/sunny_2d.png',
                                scale: 5,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Солнечно',
                                style: context.theme.primaryTextTheme.subtitle1
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '1.4°',
                                style: context.theme.textTheme.headline3
                                    ?.copyWith(fontSize: 16),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '-5.6°',
                                style: context.theme.primaryTextTheme.subtitle1
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.theme.backgroundColor,
                          context.theme.primaryColor
                        ],
                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
