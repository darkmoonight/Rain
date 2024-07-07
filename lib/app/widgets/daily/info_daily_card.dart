import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/desc/desc_container.dart';
import 'package:rain/app/widgets/desc/message.dart';
import 'package:rain/app/widgets/hourly/weather_hourly.dart';
import 'package:rain/app/widgets/now/weather_now.dart';
import 'package:rain/app/widgets/status/status_data.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/app/widgets/sun_moon/sunset_sunrise.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class InfoDailyCard extends StatefulWidget {
  const InfoDailyCard({
    super.key,
    required this.weatherData,
    required this.index,
  });

  final WeatherCard weatherData;
  final int index;

  @override
  State<InfoDailyCard> createState() => _InfoDailyCardState();
}

class _InfoDailyCardState extends State<InfoDailyCard> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();
  final message = Message();
  late PageController pageController;
  int pageIndex = 0;
  int hourOfDay = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    pageIndex = widget.index;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = widget.weatherData;
    final timeDaily = weatherData.timeDaily ?? [];
    final weatherCodeDaily = weatherData.weathercodeDaily ?? [];

    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Iconsax.arrow_left_1,
            size: 20,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        title: Text(
          DateFormat.MMMMEEEEd(locale.languageCode)
              .format(timeDaily[pageIndex]),
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
              hourOfDay = 0;
            });
          },
          itemCount: timeDaily.length,
          itemBuilder: (context, index) {
            final indexedWeatherCodeDaily = weatherCodeDaily[index];
            final temperature2MMin = weatherData.temperature2MMin?[index];
            final temperature2MMax = weatherData.temperature2MMax?[index];
            final apparentTemperatureMin =
                weatherData.apparentTemperatureMin?[index];
            final apparentTemperatureMax =
                weatherData.apparentTemperatureMax?[index];
            final uvIndexMax = weatherData.uvIndexMax?[index];
            final windDirection10MDominant =
                weatherData.winddirection10MDominant?[index];
            final windSpeed10MMax = weatherData.windspeed10MMax?[index];
            final windGusts10MMax = weatherData.windgusts10MMax?[index];
            final precipitationProbabilityMax =
                weatherData.precipitationProbabilityMax?[index];
            final rainSum = weatherData.rainSum?[index];
            final precipitationSum = weatherData.precipitationSum?[index];
            final sunrise = weatherData.sunrise![index];
            final sunset = weatherData.sunset![index];

            final startIndex = index * 24;

            return indexedWeatherCodeDaily == null
                ? null
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        WeatherNow(
                          weather:
                              weatherData.weathercode![startIndex + hourOfDay],
                          degree: weatherData
                              .temperature2M![startIndex + hourOfDay],
                          time: weatherData.time![startIndex + hourOfDay],
                          timeDay: sunrise,
                          timeNight: sunset,
                          tempMax: temperature2MMax!,
                          tempMin: temperature2MMin!,
                        ),
                        Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: SizedBox(
                              height: 135,
                              child: ScrollablePositionedList.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const VerticalDivider(
                                    width: 10,
                                    indent: 40,
                                    endIndent: 40,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: 24,
                                itemBuilder: (ctx, i) {
                                  int hourlyIndex = startIndex + i;
                                  return GestureDetector(
                                    onTap: () {
                                      hourOfDay = i;
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: i == hourOfDay
                                            ? context.theme.colorScheme
                                                .secondaryContainer
                                            : Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: WeatherHourly(
                                        time: weatherData.time![hourlyIndex],
                                        weather: weatherData
                                            .weathercode![hourlyIndex],
                                        degree: weatherData
                                            .temperature2M![hourlyIndex],
                                        timeDay: sunrise,
                                        timeNight: sunset,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SunsetSunrise(
                          timeSunrise: sunrise,
                          timeSunset: sunset,
                        ),
                        DescContainer(
                          humidity: weatherData
                              .relativehumidity2M?[startIndex + hourOfDay],
                          wind:
                              weatherData.windspeed10M?[startIndex + hourOfDay],
                          visibility:
                              weatherData.visibility?[startIndex + hourOfDay],
                          feels: weatherData
                              .apparentTemperature?[startIndex + hourOfDay],
                          evaporation: weatherData
                              .evapotranspiration?[startIndex + hourOfDay],
                          precipitation: weatherData
                              .precipitation?[startIndex + hourOfDay],
                          direction: weatherData
                              .winddirection10M?[startIndex + hourOfDay],
                          pressure: weatherData
                              .surfacePressure?[startIndex + hourOfDay],
                          rain: weatherData.rain?[startIndex + hourOfDay],
                          cloudcover:
                              weatherData.cloudcover?[startIndex + hourOfDay],
                          windgusts:
                              weatherData.windgusts10M?[startIndex + hourOfDay],
                          uvIndex: weatherData.uvIndex?[startIndex + hourOfDay],
                          dewpoint2M:
                              weatherData.dewpoint2M?[startIndex + hourOfDay],
                          precipitationProbability:
                              weatherData.precipitationProbability?[
                                  startIndex + hourOfDay],
                          shortwaveRadiation: weatherData
                              .shortwaveRadiation?[startIndex + hourOfDay],
                          initiallyExpanded: true,
                          title: 'hourlyVariables'.tr,
                        ),
                        DescContainer(
                          apparentTemperatureMin: apparentTemperatureMin,
                          apparentTemperatureMax: apparentTemperatureMax,
                          uvIndexMax: uvIndexMax,
                          windDirection10MDominant: windDirection10MDominant,
                          windSpeed10MMax: windSpeed10MMax,
                          windGusts10MMax: windGusts10MMax,
                          precipitationProbabilityMax:
                              precipitationProbabilityMax,
                          rainSum: rainSum,
                          precipitationSum: precipitationSum,
                          initiallyExpanded: true,
                          title: 'dailyVariables'.tr,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
