import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/message.dart';
import 'package:rain/app/widgets/status_data.dart';

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
    final statusData = StatusData();
    final message = Message();
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 22, bottom: 5),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 5,
          // runSpacing: 5,
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
              value: statusData.getVisibility(visibility),
              desc: 'visibility'.tr,
            ),
            DescWeather(
              imageName: 'assets/images/windsock.png',
              value: '$direction°',
              desc: 'direction'.tr,
              message: message.getDirection(direction),
            ),
            DescWeather(
              imageName: 'assets/images/wind.png',
              value: statusData.getSpeed(wind.round()),
              desc: 'wind'.tr,
            ),
            DescWeather(
              imageName: 'assets/images/windgusts.png',
              value: statusData.getSpeed(windgusts.round()),
              desc: 'windgusts'.tr,
            ),
            DescWeather(
              imageName: 'assets/images/evaporation.png',
              value: statusData.getPrecipitation(evaporation.abs()),
              desc: 'evaporation'.tr,
            ),
            DescWeather(
              imageName: 'assets/images/rainfall.png',
              value: statusData.getPrecipitation(precipitation),
              desc: 'precipitation'.tr,
            ),
            DescWeather(
              imageName: 'assets/images/water.png',
              value: statusData.getPrecipitation(rain),
              desc: 'rain'.tr,
            ),
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
      ),
    );
  }
}
