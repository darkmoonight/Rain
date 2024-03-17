import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/desc/desc.dart';
import 'package:rain/app/widgets/desc/message.dart';
import 'package:rain/app/widgets/status/status_data.dart';

class DescContainer extends StatefulWidget {
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
    required this.dewpoint2M,
    required this.precipitationProbability,
    required this.shortwaveRadiation,
  });
  final int? humidity;
  final double? wind;
  final double? visibility;
  final double? feels;
  final double? evaporation;
  final double? precipitation;
  final int? direction;
  final double? pressure;
  final double? rain;
  final int? cloudcover;
  final double? windgusts;
  final double? uvIndex;
  final double? dewpoint2M;
  final int? precipitationProbability;
  final double? shortwaveRadiation;

  @override
  State<DescContainer> createState() => _DescContainerState();
}

class _DescContainerState extends State<DescContainer> {
  final statusData = StatusData();
  final message = Message();

  @override
  Widget build(BuildContext context) {
    final dewpoint2M = widget.dewpoint2M?.round();
    final feels = widget.feels;
    final visibility = widget.visibility;
    final direction = widget.direction;
    final wind = widget.wind;
    final windgusts = widget.windgusts;
    final evaporation = widget.evaporation;
    final precipitation = widget.precipitation;
    final rain = widget.rain;
    final precipitationProbability = widget.precipitationProbability;
    final humidity = widget.humidity;
    final cloudcover = widget.cloudcover;
    final pressure = widget.pressure;
    final uvIndex = widget.uvIndex;
    final shortwaveRadiation = widget.shortwaveRadiation;

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 22, bottom: 5),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 5,
          children: [
            dewpoint2M == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/dew.png',
                    value: statusData.getDegree(dewpoint2M.round()),
                    desc: 'dewpoint'.tr,
                  ),
            feels == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/temperature.png',
                    value: statusData.getDegree(feels.round()),
                    desc: 'feels'.tr,
                  ),
            visibility == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/fog.png',
                    value: statusData.getVisibility(visibility),
                    desc: 'visibility'.tr,
                  ),
            direction == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/windsock.png',
                    value: '$direction°',
                    desc: 'direction'.tr,
                    message: message.getDirection(direction),
                  ),
            wind == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/wind.png',
                    value: statusData.getSpeed(wind.round()),
                    desc: 'wind'.tr,
                  ),
            windgusts == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/windgusts.png',
                    value: statusData.getSpeed(windgusts.round()),
                    desc: 'windgusts'.tr,
                  ),
            evaporation == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/evaporation.png',
                    value: statusData.getPrecipitation(evaporation.abs()),
                    desc: 'evaporation'.tr,
                  ),
            precipitation == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/rainfall.png',
                    value: statusData.getPrecipitation(precipitation),
                    desc: 'precipitation'.tr,
                  ),
            rain == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/water.png',
                    value: statusData.getPrecipitation(rain),
                    desc: 'rain'.tr,
                  ),
            precipitationProbability == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/precipitation_probability.png',
                    value: '$precipitationProbability%',
                    desc: 'precipitationProbability'.tr,
                  ),
            humidity == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/humidity.png',
                    value: '$humidity%',
                    desc: 'humidity'.tr,
                  ),
            cloudcover == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/cloudy.png',
                    value: '$cloudcover%',
                    desc: 'cloudcover'.tr,
                  ),
            pressure == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/atmospheric.png',
                    value: '${pressure.round()} ${'hPa'.tr}',
                    desc: 'pressure'.tr,
                    message: message.getPressure(pressure.round()),
                  ),
            uvIndex == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/uv.png',
                    value: '${uvIndex.round()}',
                    desc: 'uvIndex'.tr,
                    message: message.getUvIndex(uvIndex.round()),
                  ),
            shortwaveRadiation == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/shortwave_radiation.png',
                    value: '${shortwaveRadiation.round()} ${'W/m2'.tr}',
                    desc: 'shortwaveRadiation'.tr,
                  ),
          ],
        ),
      ),
    );
  }
}
