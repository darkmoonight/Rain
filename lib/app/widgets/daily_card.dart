import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/message.dart';
import 'package:rain/app/widgets/status.dart';
import 'package:rain/app/widgets/status_im_fa.dart';
import 'package:rain/app/widgets/sunset_sunrise.dart';

class DailyCard extends StatefulWidget {
  const DailyCard({
    super.key,
    required this.timeDaily,
    required this.weathercodeDaily,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.sunrise,
    required this.sunset,
    required this.precipitationSum,
    required this.precipitationProbabilityMax,
    required this.windspeed10MMax,
    required this.windgusts10MMax,
    required this.uvIndexMax,
    required this.rainSum,
    required this.winddirection10MDominant,
    required this.index,
  });
  final List<DateTime> timeDaily;
  final List<int> weathercodeDaily;
  final List<double> temperature2MMax;
  final List<double> temperature2MMin;
  final List<double> apparentTemperatureMax;
  final List<double> apparentTemperatureMin;
  final List<String> sunrise;
  final List<String> sunset;
  final List<double> precipitationSum;
  final List<int> precipitationProbabilityMax;
  final List<double> windspeed10MMax;
  final List<double> windgusts10MMax;
  final List<double> uvIndexMax;
  final List<double> rainSum;
  final List<int> winddirection10MDominant;
  final int index;

  @override
  State<DailyCard> createState() => _DailyCardState();
}

class _DailyCardState extends State<DailyCard> {
  final locale = Get.locale;
  final status = Status();
  final statusImFa = StatusImFa();
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
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
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
          DateFormat.MMMMEEEEd(locale?.languageCode)
              .format(widget.timeDaily[pageIndex]),
          style: context.theme.textTheme.titleLarge,
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
          itemCount: widget.timeDaily.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Image(
                        image: AssetImage(status.getImageNowDaily(
                            widget.weathercodeDaily[index],
                            widget.timeDaily[index])),
                        fit: BoxFit.fill,
                        height: 200,
                      ),
                      const SizedBox(height: 10),
                      GlowText(
                        '${statusImFa.getDegree(widget.temperature2MMin[index].round())} / ${statusImFa.getDegree(widget.temperature2MMax[index].round())}',
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        status.getText(widget.weathercodeDaily[index]),
                        style: context.theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DateFormat.MMMMEEEEd(locale?.languageCode)
                            .format(widget.timeDaily[index]),
                        style: context.theme.textTheme.labelLarge?.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SunsetSunrise(
                      timeSunrise: widget.sunrise[index],
                      timeSunset: widget.sunset[index],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DescWeather(
                              imageName: 'assets/images/cold.png',
                              value: statusImFa.getDegree(
                                  widget.apparentTemperatureMin[index].round()),
                              desc: 'apparentTemperatureMin'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/hot.png',
                              value: statusImFa.getDegree(
                                  widget.apparentTemperatureMax[index].round()),
                              desc: 'apparentTemperatureMax'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/uv.png',
                              value: '${widget.uvIndexMax[index].round()}',
                              desc: 'uvIndex'.tr,
                              message: message
                                  .getUvIndex(widget.uvIndexMax[index].round()),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DescWeather(
                              imageName: 'assets/images/windsock.png',
                              value:
                                  '${widget.winddirection10MDominant[index]}°',
                              desc: 'direction'.tr,
                              message: message.getDirection(
                                  widget.winddirection10MDominant[index]),
                            ),
                            DescWeather(
                              imageName: 'assets/images/wind.png',
                              value: statusImFa.getSpeed(
                                  widget.windspeed10MMax[index].round()),
                              desc: 'wind'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/windgusts.png',
                              value: statusImFa.getSpeed(
                                  widget.windgusts10MMax[index].round()),
                              desc: 'windgusts'.tr,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DescWeather(
                              imageName: 'assets/images/humidity.png',
                              value:
                                  '${widget.precipitationProbabilityMax[index]}%',
                              desc: 'precipitationProbabilit'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/water.png',
                              value: statusImFa
                                  .getPrecipitation(widget.rainSum[index]),
                              desc: 'rain'.tr,
                            ),
                            DescWeather(
                              imageName: 'assets/images/rainfall.png',
                              value: statusImFa.getPrecipitation(
                                  widget.precipitationSum[index]),
                              desc: 'precipitation'.tr,
                            ),
                          ],
                        ),
                      ],
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
