import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/modules/all_days.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
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
                    image: AssetImage('assets/images/rainy.png'),
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
                            '23',
                            style: context.theme.textTheme.headline1?.copyWith(
                              fontSize: 90,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                            blurRadius: 2,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Дождь',
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
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.theme.backgroundColor,
                      context.theme.primaryColor
                    ],
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DescWeather(
                    imageName: 'assets/images/humidity.png',
                    value: '62%',
                    desc: 'Влажность',
                  ),
                  DescWeather(
                    imageName: 'assets/images/wind.png',
                    value: '7 км/ч',
                    desc: 'Ветер',
                  ),
                  DescWeather(
                    imageName: 'assets/images/foggy.png',
                    value: '14 км',
                    desc: 'Видимость',
                  ),
                  DescWeather(
                    imageName: 'assets/images/hot.png',
                    value: '19°',
                    desc: 'Ощущается',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Сегодня',
                    style: context.theme.textTheme.headline3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const AllDaysPage(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              context.theme.backgroundColor,
                              context.theme.primaryColor
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Text(
                            '7 дней',
                            style: context.theme.primaryTextTheme.subtitle1
                                ?.copyWith(fontSize: 16),
                          ),
                          Icon(
                            Iconsax.arrow_right_3,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 12);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (ctx, i) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '10:00',
                        style: context.theme.primaryTextTheme.subtitle1,
                      ),
                      Image.asset(
                        'assets/images/snow_2d.png',
                        scale: 5,
                      ),
                      Text(
                        '19°',
                        style: context.theme.textTheme.headline3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
