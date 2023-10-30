import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/desc/desc.dart';
import 'package:rain/app/widgets/desc/message.dart';
import 'package:rain/app/widgets/status/status_data.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/app/widgets/sun_moon/sunset_sunrise.dart';
import 'package:rain/main.dart';

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
            });
          },
          itemCount: timeDaily.length,
          itemBuilder: (context, index) {
            final indexedWeatherCodeDaily = weatherCodeDaily[index];
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

            return indexedWeatherCodeDaily == null
                ? null
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 15),
                            Image(
                              image: AssetImage(
                                statusWeather
                                    .getImageNowDaily(indexedWeatherCodeDaily),
                              ),
                              fit: BoxFit.fill,
                              height: 200,
                            ),
                            const SizedBox(height: 10),
                            GlowText(
                              '${weatherData.temperature2MMin![index]?.round()} / ${weatherData.temperature2MMax![index]?.round()}',
                              style: textTheme.titleLarge?.copyWith(
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                              ),
                              blurRadius: 4,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              statusWeather.getText(indexedWeatherCodeDaily),
                              style: textTheme.titleLarge,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              DateFormat.MMMMEEEEd(locale.languageCode)
                                  .format(timeDaily[index]),
                              style: textTheme.labelLarge?.copyWith(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SunsetSunrise(
                            timeSunrise: weatherData.sunrise![index],
                            timeSunset: weatherData.sunset![index],
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 5),
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              spacing: 5,
                              children: [
                                apparentTemperatureMin == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName: 'assets/images/cold.png',
                                        value: statusData.getDegree(
                                            apparentTemperatureMin.round()),
                                        desc: 'apparentTemperatureMin'.tr,
                                      ),
                                apparentTemperatureMax == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName: 'assets/images/hot.png',
                                        value: statusData.getDegree(
                                            apparentTemperatureMax.round()),
                                        desc: 'apparentTemperatureMax'.tr,
                                      ),
                                uvIndexMax == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName: 'assets/images/uv.png',
                                        value: '${uvIndexMax.round()}',
                                        desc: 'uvIndex'.tr,
                                        message: message
                                            .getUvIndex(uvIndexMax.round()),
                                      ),
                                windDirection10MDominant == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName: 'assets/images/windsock.png',
                                        value: '$windDirection10MDominant°',
                                        desc: 'direction'.tr,
                                        message: message.getDirection(
                                            windDirection10MDominant),
                                      ),
                                windSpeed10MMax == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName: 'assets/images/wind.png',
                                        value: statusData
                                            .getSpeed(windSpeed10MMax.round()),
                                        desc: 'wind'.tr,
                                      ),
                                windGusts10MMax == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName:
                                            'assets/images/windgusts.png',
                                        value: statusData
                                            .getSpeed(windGusts10MMax.round()),
                                        desc: 'windgusts'.tr,
                                      ),
                                precipitationProbabilityMax == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName:
                                            'assets/images/precipitation_probability.png',
                                        value: '$precipitationProbabilityMax%',
                                        desc: 'precipitationProbability'.tr,
                                      ),
                                rainSum == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName: 'assets/images/water.png',
                                        value: statusData
                                            .getPrecipitation(rainSum),
                                        desc: 'rain'.tr,
                                      ),
                                precipitationSum == null
                                    ? const Offstage()
                                    : DescWeather(
                                        imageName: 'assets/images/rainfall.png',
                                        value: statusData
                                            .getPrecipitation(precipitationSum),
                                        desc: 'precipitation'.tr,
                                      ),
                              ],
                            ),
                          ),
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
