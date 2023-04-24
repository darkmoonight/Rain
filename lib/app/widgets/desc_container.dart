import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/message.dart';
import 'package:rain/app/widgets/status_im_fa.dart';

class DescContainer extends StatelessWidget {
  const DescContainer({
    super.key,
    required this.humidity,
    required this.wind,
    required this.visibility,
    required this.feels,
    required this.evaporation,
    required this.precipitation,
    required this.direction,
    required this.pressure,
    required this.rain,
    required this.cloudcover,
    required this.windgusts,
    required this.uvIndex,
  });
  final int humidity;
  final double wind;
  final double visibility;
  final double feels;
  final double evaporation;
  final double precipitation;
  final int direction;
  final double pressure;
  final double rain;
  final int cloudcover;
  final double windgusts;
  final double uvIndex;

  @override
  Widget build(BuildContext context) {
    final statusImFa = StatusImFa();
    final message = Message();
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(top: 22, bottom: 5),
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
                value: '$humidity%',
                desc: 'humidity'.tr,
              ),
              DescWeather(
                imageName: 'assets/images/temperature.png',
                value: '${feels.round()}°',
                desc: 'feels'.tr,
              ),
              DescWeather(
                imageName: 'assets/images/fog.png',
                value: statusImFa.getVisibility(visibility),
                desc: 'visibility'.tr,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DescWeather(
                imageName: 'assets/images/windsock.png',
                value: '$direction°',
                desc: 'direction'.tr,
                message: message.getDirection(direction),
              ),
              DescWeather(
                imageName: 'assets/images/wind.png',
                value: statusImFa.getSpeed(wind.round()),
                desc: 'wind'.tr,
              ),
              DescWeather(
                imageName: 'assets/images/windgusts.png',
                value: statusImFa.getSpeed(windgusts.round()),
                desc: 'windgusts'.tr,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DescWeather(
                imageName: 'assets/images/evaporation.png',
                value: statusImFa.getPrecipitation(evaporation.abs()),
                desc: 'evaporation'.tr,
              ),
              DescWeather(
                imageName: 'assets/images/rainfall.png',
                value: statusImFa.getPrecipitation(precipitation),
                desc: 'precipitation'.tr,
              ),
              DescWeather(
                imageName: 'assets/images/water.png',
                value: statusImFa.getPrecipitation(rain),
                desc: 'rain'.tr,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DescWeather(
                imageName: 'assets/images/cloudy.png',
                value: '$cloudcover%',
                desc: 'cloudcover'.tr,
              ),
              DescWeather(
                imageName: 'assets/images/atmospheric.png',
                value: '${pressure.round()} ${'hPa'.tr}',
                desc: 'pressure'.tr,
                message: message.getPressure(pressure.round()),
              ),
              DescWeather(
                imageName: 'assets/images/uv.png',
                value: '${uvIndex.round()}',
                desc: 'uvIndex'.tr,
                message: message.getUvIndex(uvIndex.round()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
