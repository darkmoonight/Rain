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
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 22, bottom: 5),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 5,
          children: [
            widget.dewpoint2M == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/dew.png',
                    value: statusData.getDegree(widget.dewpoint2M?.round()),
                    desc: 'dewpoint'.tr,
                  ),
            widget.feels == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/temperature.png',
                    value: statusData.getDegree(widget.feels?.round()),
                    desc: 'feels'.tr,
                  ),
            widget.visibility == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/fog.png',
                    value: statusData.getVisibility(widget.visibility),
                    desc: 'visibility'.tr,
                  ),
            widget.direction == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/windsock.png',
                    value: '${widget.direction}°',
                    desc: 'direction'.tr,
                    message: message.getDirection(widget.direction),
                  ),
            widget.wind == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/wind.png',
                    value: statusData.getSpeed(widget.wind?.round()),
                    desc: 'wind'.tr,
                  ),
            widget.windgusts == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/windgusts.png',
                    value: statusData.getSpeed(widget.windgusts?.round()),
                    desc: 'windgusts'.tr,
                  ),
            widget.evaporation == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/evaporation.png',
                    value:
                        statusData.getPrecipitation(widget.evaporation?.abs()),
                    desc: 'evaporation'.tr,
                  ),
            widget.precipitation == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/rainfall.png',
                    value: statusData.getPrecipitation(widget.precipitation),
                    desc: 'precipitation'.tr,
                  ),
            widget.rain == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/water.png',
                    value: statusData.getPrecipitation(widget.rain),
                    desc: 'rain'.tr,
                  ),
            widget.precipitationProbability == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/precipitation_probability.png',
                    value: '${widget.precipitationProbability}%',
                    desc: 'precipitationProbability'.tr,
                  ),
            widget.humidity == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/humidity.png',
                    value: '${widget.humidity}%',
                    desc: 'humidity'.tr,
                  ),
            widget.cloudcover == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/cloudy.png',
                    value: '${widget.cloudcover}%',
                    desc: 'cloudcover'.tr,
                  ),
            widget.pressure == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/atmospheric.png',
                    value: '${widget.pressure?.round()} ${'hPa'.tr}',
                    desc: 'pressure'.tr,
                    message: message.getPressure(widget.pressure?.round()),
                  ),
            widget.uvIndex == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/uv.png',
                    value: '${widget.uvIndex?.round()}',
                    desc: 'uvIndex'.tr,
                    message: message.getUvIndex(widget.uvIndex?.round()),
                  ),
            widget.shortwaveRadiation == null
                ? const Offstage()
                : DescWeather(
                    imageName: 'assets/images/shortwave_radiation.png',
                    value: '${widget.shortwaveRadiation?.round()} ${'W/m2'.tr}',
                    desc: 'shortwaveRadiation'.tr,
                  ),
          ],
        ),
      ),
    );
  }
}
