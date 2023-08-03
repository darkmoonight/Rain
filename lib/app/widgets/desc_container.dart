import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/desc.dart';
import 'package:rain/app/widgets/message.dart';
import 'package:rain/app/widgets/status_data.dart';

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
            widget.humidity == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/humidity.png',
                    value: '${widget.humidity}%',
                    desc: 'humidity'.tr,
                  ),
            widget.feels == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/temperature.png',
                    value: statusData.getDegree(widget.feels?.round()),
                    desc: 'feels'.tr,
                  ),
            widget.visibility == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/fog.png',
                    value: statusData.getVisibility(widget.visibility),
                    desc: 'visibility'.tr,
                  ),
            widget.direction == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/windsock.png',
                    value: '${widget.direction}°',
                    desc: 'direction'.tr,
                    message: message.getDirection(widget.direction),
                  ),
            widget.wind == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/wind.png',
                    value: statusData.getSpeed(widget.wind?.round()),
                    desc: 'wind'.tr,
                  ),
            widget.windgusts == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/windgusts.png',
                    value: statusData.getSpeed(widget.windgusts?.round()),
                    desc: 'windgusts'.tr,
                  ),
            widget.evaporation == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/evaporation.png',
                    value:
                        statusData.getPrecipitation(widget.evaporation?.abs()),
                    desc: 'evaporation'.tr,
                  ),
            widget.precipitation == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/rainfall.png',
                    value: statusData.getPrecipitation(widget.precipitation),
                    desc: 'precipitation'.tr,
                  ),
            widget.rain == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/water.png',
                    value: statusData.getPrecipitation(widget.rain),
                    desc: 'rain'.tr,
                  ),
            widget.cloudcover == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/cloudy.png',
                    value: '${widget.cloudcover}%',
                    desc: 'cloudcover'.tr,
                  ),
            widget.pressure == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/atmospheric.png',
                    value: '${widget.pressure?.round()} ${'hPa'.tr}',
                    desc: 'pressure'.tr,
                    message: message.getPressure(widget.pressure?.round()),
                  ),
            widget.uvIndex == null
                ? Container()
                : DescWeather(
                    imageName: 'assets/images/uv.png',
                    value: '${widget.uvIndex?.round()}',
                    desc: 'uvIndex'.tr,
                    message: message.getUvIndex(widget.uvIndex?.round()),
                  ),
          ],
        ),
      ),
    );
  }
}
