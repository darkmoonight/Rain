import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Сегодня, ${DateFormat.yMMMd('${locale?.languageCode}').format(
                          DateTime.now(),
                        )}',
                        style: context.theme.primaryTextTheme.subtitle1,
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.location,
                              size: 18,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Ростов-на-Дону, Россия',
                              style: context.theme.textTheme.headline6,
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Iconsax.arrow_down_1,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.gps),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Image.asset(
              'assets/images/raining.png',
              scale: 2.4,
            ),
            const SizedBox(height: 15),
            Text(
              'Дождь',
              style: context.theme.textTheme.subtitle2?.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 15),
            Text(
              '23°',
              style: context.theme.textTheme.headline1
                  ?.copyWith(fontSize: 48, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Wrap(
                spacing: 30,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(WeatherIcons.raindrop),
                      const SizedBox(height: 5),
                      Text(
                        '62%',
                        style: context.theme.textTheme.headline3,
                      ),
                      Text(
                        'Влажность',
                        style: context.theme.primaryTextTheme.subtitle1,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(WeatherIcons.strong_wind),
                      const SizedBox(height: 5),
                      Text(
                        '7км/ч',
                        style: context.theme.textTheme.headline3,
                      ),
                      Text(
                        'Ветер',
                        style: context.theme.primaryTextTheme.subtitle1,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(WeatherIcons.rain),
                      const SizedBox(height: 5),
                      Text(
                        '30%',
                        style: context.theme.textTheme.headline3,
                      ),
                      Text(
                        'Дождь',
                        style: context.theme.primaryTextTheme.subtitle1,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(WeatherIcons.windy),
                      const SizedBox(height: 5),
                      Text(
                        '50%',
                        style: context.theme.textTheme.headline3,
                      ),
                      Text(
                        'Видимость',
                        style: context.theme.primaryTextTheme.subtitle1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Сегодня',
                    style: context.theme.textTheme.headline3,
                  ),
                  GestureDetector(
                    onTap: () {},
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
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (ctx, i) => Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '10:00',
                        style: context.theme.primaryTextTheme.headline4,
                      ),
                      const SizedBox(height: 5),
                      Image.asset(
                        'assets/images/raining.png',
                        scale: 15,
                      ),
                      const SizedBox(height: 5),
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
