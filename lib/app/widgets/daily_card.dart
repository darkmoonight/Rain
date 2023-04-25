import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/status.dart';
import 'package:rain/app/widgets/status_im_fa.dart';
import 'package:rain/app/widgets/sunset_sunrise.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({
    super.key,
    this.timeDaily,
    this.weathercodeDaily,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.precipitationSum,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
  });
  final DateTime? timeDaily;
  final int? weathercodeDaily;
  final double? temperature2MMax;
  final double? temperature2MMin;
  final double? apparentTemperatureMax;
  final double? apparentTemperatureMin;
  final String? sunrise;
  final String? sunset;
  final double? precipitationSum;
  final int? precipitationProbabilityMax;
  final double? windspeed10MMax;
  final double? windgusts10MMax;

  @override
  Widget build(BuildContext context) {
    final locale = Get.locale;
    final status = Status();
    final statusImFa = StatusImFa();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Image(
                image: AssetImage(
                    status.getImageNowDaily(weathercodeDaily!, timeDaily!)),
                fit: BoxFit.fill,
                height: 200,
              ),
              const SizedBox(height: 10),
              GlowText(
                '${statusImFa.getDegree(temperature2MMin!.round())} / ${statusImFa.getDegree(temperature2MMax!.round())}',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                status.getText(weathercodeDaily!),
                style: context.theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 5),
              Text(
                DateFormat.MMMMEEEEd(locale?.languageCode).format(timeDaily!),
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
              timeSunrise: sunrise!,
              timeSunset: sunset!,
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
                      imageName: 'assets/images/humidity.png',
                      value: '$precipitationProbabilityMax%',
                      desc: 'precipitationProbabilit'.tr,
                    ),
                    DescWeather(
                      imageName: 'assets/images/wind.png',
                      value: statusImFa.getSpeed(windspeed10MMax!.round()),
                      desc: 'wind'.tr,
                    ),
                    DescWeather(
                      imageName: 'assets/images/windgusts.png',
                      value: statusImFa.getSpeed(windgusts10MMax!.round()),
                      desc: 'windgusts'.tr,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DescWeather(
                      imageName: 'assets/images/rainfall.png',
                      value: statusImFa.getPrecipitation(precipitationSum!),
                      desc: 'precipitation'.tr,
                    ),
                    DescWeather(
                      imageName: 'assets/images/cold.png',
                      value:
                          statusImFa.getDegree(apparentTemperatureMin!.round()),
                      desc: 'apparentTemperatureMin'.tr,
                    ),
                    DescWeather(
                      imageName: 'assets/images/hot.png',
                      value:
                          statusImFa.getDegree(apparentTemperatureMax!.round()),
                      desc: 'apparentTemperatureMax'.tr,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
