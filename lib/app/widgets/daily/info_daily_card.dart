import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/desc/desc.dart';
import 'package:rain/app/widgets/desc/message.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/app/widgets/status/status_data.dart';
import 'package:rain/app/widgets/sun_moon/sunset_sunrise.dart';
import 'package:rain/main.dart';

class InfoDailyCard extends StatefulWidget {
  const InfoDailyCard({
    super.key,
    required this.weatherData,
    required this.index,
  });
  final Map<String, dynamic> weatherData;
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
              .format(widget.weatherData['timeDaily'][pageIndex]),
          style: context.textTheme.titleMedium?.copyWith(
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
          itemCount: widget.weatherData['timeDaily'].length,
          itemBuilder: (context, index) {
            return widget.weatherData['weathercodeDaily']?[index] == null
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
                              image: AssetImage(statusWeather.getImageNowDaily(
                                  widget.weatherData['weathercodeDaily']
                                      ?[index],
                                  widget.weatherData['timeDaily'][index])),
                              fit: BoxFit.fill,
                              height: 200,
                            ),
                            const SizedBox(height: 10),
                            GlowText(
                              '${widget.weatherData['temperature2MMin']?[index]?.round()} / ${widget.weatherData['temperature2MMax']?[index]?.round()}',
                              style: context.textTheme.titleLarge?.copyWith(
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                              ),
                              blurRadius: 4,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              statusWeather.getText(widget
                                  .weatherData['weathercodeDaily']?[index]),
                              style: context.textTheme.titleLarge,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              DateFormat.MMMMEEEEd(locale.languageCode).format(
                                  widget.weatherData['timeDaily'][index]),
                              style: context.textTheme.labelLarge?.copyWith(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SunsetSunrise(
                            timeSunrise: widget.weatherData['sunrise'][index],
                            timeSunset: widget.weatherData['sunset'][index],
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
                                widget.weatherData['apparentTemperatureMin']
                                            ?[index] ==
                                        null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/cold.png',
                                        value: statusData.getDegree(widget
                                            .weatherData[
                                                'apparentTemperatureMin']
                                                ?[index]
                                            ?.round()),
                                        desc: 'apparentTemperatureMin'.tr,
                                      ),
                                widget.weatherData['apparentTemperatureMax']
                                            ?[index] ==
                                        null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/hot.png',
                                        value: statusData.getDegree(widget
                                            .weatherData[
                                                'apparentTemperatureMax']
                                                ?[index]
                                            ?.round()),
                                        desc: 'apparentTemperatureMax'.tr,
                                      ),
                                widget.weatherData['uvIndexMax']?[index] == null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/uv.png',
                                        value:
                                            '${widget.weatherData['uvIndexMax']?[index]?.round()}',
                                        desc: 'uvIndex'.tr,
                                        message: message.getUvIndex(widget
                                            .weatherData['uvIndexMax']?[index]
                                            ?.round()),
                                      ),
                                widget.weatherData['winddirection10MDominant']
                                            ?[index] ==
                                        null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/windsock.png',
                                        value:
                                            '${widget.weatherData['winddirection10MDominant']?[index]}°',
                                        desc: 'direction'.tr,
                                        message: message.getDirection(
                                            widget.weatherData[
                                                    'winddirection10MDominant']
                                                ?[index]),
                                      ),
                                widget.weatherData['windspeed10MMax']?[index] ==
                                        null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/wind.png',
                                        value: statusData.getSpeed(widget
                                            .weatherData['windspeed10MMax']
                                                ?[index]
                                            ?.round()),
                                        desc: 'wind'.tr,
                                      ),
                                widget.weatherData['windgusts10MMax']?[index] ==
                                        null
                                    ? Container()
                                    : DescWeather(
                                        imageName:
                                            'assets/images/windgusts.png',
                                        value: statusData.getSpeed(widget
                                            .weatherData['windgusts10MMax']
                                                ?[index]
                                            ?.round()),
                                        desc: 'windgusts'.tr,
                                      ),
                                widget.weatherData[
                                                'precipitationProbabilityMax']
                                            ?[index] ==
                                        null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/humidity.png',
                                        value:
                                            '${widget.weatherData['precipitationProbabilityMax']?[index]}%',
                                        desc: 'precipitationProbabilit'.tr,
                                      ),
                                widget.weatherData['rainSum']?[index] == null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/water.png',
                                        value: statusData.getPrecipitation(
                                            widget.weatherData['rainSum']
                                                ?[index]),
                                        desc: 'rain'.tr,
                                      ),
                                widget.weatherData['precipitationSum']
                                            ?[index] ==
                                        null
                                    ? Container()
                                    : DescWeather(
                                        imageName: 'assets/images/rainfall.png',
                                        value: statusData.getPrecipitation(
                                            widget.weatherData[
                                                'precipitationSum']?[index]),
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
