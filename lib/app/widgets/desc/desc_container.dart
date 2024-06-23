import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/widgets/desc/desc.dart';
import 'package:rain/app/widgets/desc/message.dart';
import 'package:rain/app/widgets/status/status_data.dart';

class DescContainer extends StatefulWidget {
  const DescContainer({
    super.key,
    this.humidity,
    this.wind,
    this.visibility,
    this.feels,
    this.evaporation,
    this.precipitation,
    this.direction,
    this.pressure,
    this.rain,
    this.cloudcover,
    this.windgusts,
    this.uvIndex,
    this.dewpoint2M,
    this.precipitationProbability,
    this.shortwaveRadiation,
    this.apparentTemperatureMin,
    this.apparentTemperatureMax,
    this.uvIndexMax,
    this.windDirection10MDominant,
    this.windSpeed10MMax,
    this.windGusts10MMax,
    this.precipitationProbabilityMax,
    this.rainSum,
    this.precipitationSum,
    required this.initiallyExpanded,
    required this.title,
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

  final double? apparentTemperatureMin;
  final double? apparentTemperatureMax;
  final double? uvIndexMax;
  final int? windDirection10MDominant;
  final double? windSpeed10MMax;
  final double? windGusts10MMax;
  final int? precipitationProbabilityMax;
  final double? rainSum;
  final double? precipitationSum;

  final bool initiallyExpanded;
  final String title;

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

    final apparentTemperatureMin = widget.apparentTemperatureMin;
    final apparentTemperatureMax = widget.apparentTemperatureMax;
    final uvIndexMax = widget.uvIndexMax;
    final windDirection10MDominant = widget.windDirection10MDominant;
    final windSpeed10MMax = widget.windSpeed10MMax;
    final windGusts10MMax = widget.windGusts10MMax;
    final precipitationProbabilityMax = widget.precipitationProbabilityMax;
    final rainSum = widget.rainSum;
    final precipitationSum = widget.precipitationSum;

    final initiallyExpanded = widget.initiallyExpanded;
    final title = widget.title;

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(
          title,
          style: context.textTheme.labelLarge,
        ),
        initiallyExpanded: initiallyExpanded,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 5,
              children: [
                apparentTemperatureMin == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/cold.png',
                        value: statusData
                            .getDegree(apparentTemperatureMin.round()),
                        desc: 'apparentTemperatureMin'.tr,
                      ),
                apparentTemperatureMax == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/hot.png',
                        value: statusData
                            .getDegree(apparentTemperatureMax.round()),
                        desc: 'apparentTemperatureMax'.tr,
                      ),
                uvIndexMax == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/uv.png',
                        value: '${uvIndexMax.round()}',
                        desc: 'uvIndex'.tr,
                        message: message.getUvIndex(uvIndexMax.round()),
                      ),
                windDirection10MDominant == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/windsock.png',
                        value: '$windDirection10MDominant°',
                        desc: 'direction'.tr,
                        message: message.getDirection(windDirection10MDominant),
                      ),
                windSpeed10MMax == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/wind.png',
                        value: statusData.getSpeed(windSpeed10MMax.round()),
                        desc: 'wind'.tr,
                      ),
                windGusts10MMax == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/windgusts.png',
                        value: statusData.getSpeed(windGusts10MMax.round()),
                        desc: 'windgusts'.tr,
                      ),
                precipitationProbabilityMax == null
                    ? Container()
                    : DescWeather(
                        imageName:
                            'assets/images/precipitation_probability.png',
                        value: '$precipitationProbabilityMax%',
                        desc: 'precipitationProbability'.tr,
                      ),
                rainSum == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/water.png',
                        value: statusData.getPrecipitation(rainSum),
                        desc: 'rain'.tr,
                      ),
                precipitationSum == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/rainfall.png',
                        value: statusData.getPrecipitation(precipitationSum),
                        desc: 'precipitation'.tr,
                      ),
                dewpoint2M == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/dew.png',
                        value: statusData.getDegree(dewpoint2M.round()),
                        desc: 'dewpoint'.tr,
                      ),
                feels == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/temperature.png',
                        value: statusData.getDegree(feels.round()),
                        desc: 'feels'.tr,
                      ),
                visibility == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/fog.png',
                        value: statusData.getVisibility(visibility),
                        desc: 'visibility'.tr,
                      ),
                direction == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/windsock.png',
                        value: '$direction°',
                        desc: 'direction'.tr,
                        message: message.getDirection(direction),
                      ),
                wind == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/wind.png',
                        value: statusData.getSpeed(wind.round()),
                        desc: 'wind'.tr,
                      ),
                windgusts == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/windgusts.png',
                        value: statusData.getSpeed(windgusts.round()),
                        desc: 'windgusts'.tr,
                      ),
                evaporation == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/evaporation.png',
                        value: statusData.getPrecipitation(evaporation.abs()),
                        desc: 'evaporation'.tr,
                      ),
                precipitation == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/rainfall.png',
                        value: statusData.getPrecipitation(precipitation),
                        desc: 'precipitation'.tr,
                      ),
                rain == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/water.png',
                        value: statusData.getPrecipitation(rain),
                        desc: 'rain'.tr,
                      ),
                precipitationProbability == null
                    ? Container()
                    : DescWeather(
                        imageName:
                            'assets/images/precipitation_probability.png',
                        value: '$precipitationProbability%',
                        desc: 'precipitationProbability'.tr,
                      ),
                humidity == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/humidity.png',
                        value: '$humidity%',
                        desc: 'humidity'.tr,
                      ),
                cloudcover == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/cloudy.png',
                        value: '$cloudcover%',
                        desc: 'cloudcover'.tr,
                      ),
                pressure == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/atmospheric.png',
                        value: '${pressure.round()} ${'hPa'.tr}',
                        desc: 'pressure'.tr,
                        message: message.getPressure(pressure.round()),
                      ),
                uvIndex == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/uv.png',
                        value: '${uvIndex.round()}',
                        desc: 'uvIndex'.tr,
                        message: message.getUvIndex(uvIndex.round()),
                      ),
                shortwaveRadiation == null
                    ? Container()
                    : DescWeather(
                        imageName: 'assets/images/shortwave_radiation.png',
                        value: '${shortwaveRadiation.round()} ${'W/m2'.tr}',
                        desc: 'shortwaveRadiation'.tr,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
