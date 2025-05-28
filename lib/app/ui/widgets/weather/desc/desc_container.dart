import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/ui/widgets/weather/desc/desc.dart';
import 'package:rain/app/ui/widgets/weather/desc/message.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';

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
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(widget.title, style: context.textTheme.labelLarge),
        initiallyExpanded: widget.initiallyExpanded,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 5,
              children: _buildWeatherDescriptions(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildWeatherDescriptions(BuildContext context) {
    final List<Widget> descriptions = [];

    void addDescriptionIfNotNull({
      required dynamic value,
      required String imageName,
      required String desc,
      String? message,
    }) {
      if (value != null &&
          value != '' &&
          value != 'null°C' &&
          value != 'null°F' &&
          value != 'null°' &&
          value != 'null%' &&
          value != 'null ${'W/m2'.tr}') {
        descriptions.add(
          DescWeather(
            imageName: imageName,
            value: value.toString(),
            desc: desc,
            message: message ?? '',
          ),
        );
      } else {
        descriptions.add(Container());
      }
    }

    final weatherData = [
      {
        'value': statusData.getDegree(widget.apparentTemperatureMin?.round()),
        'imageName': 'assets/images/cold.png',
        'desc': 'apparentTemperatureMin'.tr,
      },
      {
        'value': statusData.getDegree(widget.apparentTemperatureMax?.round()),
        'imageName': 'assets/images/hot.png',
        'desc': 'apparentTemperatureMax'.tr,
      },
      {
        'value': widget.uvIndexMax?.round(),
        'imageName': 'assets/images/uv.png',
        'desc': 'uvIndex'.tr,
        'message': message.getUvIndex(widget.uvIndexMax?.round()),
      },
      {
        'value': '${widget.windDirection10MDominant}°',
        'imageName': 'assets/images/windsock.png',
        'desc': 'direction'.tr,
        'message': message.getDirection(widget.windDirection10MDominant),
      },
      {
        'value': statusData.getSpeed(widget.windSpeed10MMax?.round()),
        'imageName': 'assets/images/wind.png',
        'desc': 'wind'.tr,
      },
      {
        'value': statusData.getSpeed(widget.windGusts10MMax?.round()),
        'imageName': 'assets/images/windgusts.png',
        'desc': 'windgusts'.tr,
      },
      {
        'value': '${widget.precipitationProbabilityMax}%',
        'imageName': 'assets/images/precipitation_probability.png',
        'desc': 'precipitationProbability'.tr,
      },
      {
        'value': statusData.getPrecipitation(widget.rainSum),
        'imageName': 'assets/images/water.png',
        'desc': 'rain'.tr,
      },
      {
        'value': statusData.getPrecipitation(widget.precipitationSum),
        'imageName': 'assets/images/rainfall.png',
        'desc': 'precipitation'.tr,
      },
      {
        'value': statusData.getDegree(widget.dewpoint2M?.round()),
        'imageName': 'assets/images/dew.png',
        'desc': 'dewpoint'.tr,
      },
      {
        'value': statusData.getDegree(widget.feels?.round()),
        'imageName': 'assets/images/temperature.png',
        'desc': 'feels'.tr,
      },
      {
        'value': statusData.getVisibility(widget.visibility),
        'imageName': 'assets/images/fog.png',
        'desc': 'visibility'.tr,
      },
      {
        'value': '${widget.direction}°',
        'imageName': 'assets/images/windsock.png',
        'desc': 'direction'.tr,
        'message': message.getDirection(widget.direction),
      },
      {
        'value': statusData.getSpeed(widget.wind?.round()),
        'imageName': 'assets/images/wind.png',
        'desc': 'wind'.tr,
      },
      {
        'value': statusData.getSpeed(widget.windgusts?.round()),
        'imageName': 'assets/images/windgusts.png',
        'desc': 'windgusts'.tr,
      },
      {
        'value': statusData.getPrecipitation(widget.evaporation?.abs()),
        'imageName': 'assets/images/evaporation.png',
        'desc': 'evaporation'.tr,
      },
      {
        'value': statusData.getPrecipitation(widget.precipitation),
        'imageName': 'assets/images/rainfall.png',
        'desc': 'precipitation'.tr,
      },
      {
        'value': statusData.getPrecipitation(widget.rain),
        'imageName': 'assets/images/water.png',
        'desc': 'rain'.tr,
      },
      {
        'value': '${widget.precipitationProbability}%',
        'imageName': 'assets/images/precipitation_probability.png',
        'desc': 'precipitationProbability'.tr,
      },
      {
        'value': '${widget.humidity}%',
        'imageName': 'assets/images/humidity.png',
        'desc': 'humidity'.tr,
      },
      {
        'value': '${widget.cloudcover}%',
        'imageName': 'assets/images/cloudy.png',
        'desc': 'cloudcover'.tr,
      },
      {
        'value': statusData.getPressure(widget.pressure?.round()),
        'imageName': 'assets/images/atmospheric.png',
        'desc': 'pressure'.tr,
        'message': message.getPressure(widget.pressure?.round()),
      },
      {
        'value': widget.uvIndex?.round(),
        'imageName': 'assets/images/uv.png',
        'desc': 'uvIndex'.tr,
        'message': message.getUvIndex(widget.uvIndex?.round()),
      },
      {
        'value': '${widget.shortwaveRadiation?.round()} ${'W/m2'.tr}',
        'imageName': 'assets/images/shortwave_radiation.png',
        'desc': 'shortwaveRadiation'.tr,
      },
    ];

    for (var data in weatherData) {
      addDescriptionIfNotNull(
        value: data['value'],
        imageName: '${data['imageName']}',
        desc: '${data['desc']}',
        message: '${data['message']}',
      );
    }

    return descriptions;
  }
}
