import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/daily_card.dart';

class WeatherMore extends StatefulWidget {
  const WeatherMore({
    super.key,
    this.mainWeatherCache,
    this.weatherCard,
  });
  final MainWeatherCache? mainWeatherCache;
  final WeatherCard? weatherCard;

  @override
  State<WeatherMore> createState() => _WeatherMoreState();
}

class _WeatherMoreState extends State<WeatherMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.theme.scaffoldBackgroundColor,
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
          'weatherMore'.tr,
          style: context.theme.textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.mainWeatherCache?.timeDaily!.length ??
            widget.weatherCard?.timeDaily!.length,
        itemBuilder: (context, index) => DailyCard(
          timeDaily: widget.mainWeatherCache?.timeDaily![index] ??
              widget.weatherCard?.timeDaily![index],
          weathercodeDaily: widget.mainWeatherCache?.weathercodeDaily![index] ??
              widget.weatherCard?.weathercodeDaily![index],
          temperature2MMax: widget.mainWeatherCache?.temperature2MMax![index] ??
              widget.weatherCard?.temperature2MMax![index],
          temperature2MMin: widget.mainWeatherCache?.temperature2MMin![index] ??
              widget.weatherCard?.temperature2MMin![index],
          apparentTemperatureMax:
              widget.mainWeatherCache?.apparentTemperatureMax![index] ??
                  widget.weatherCard?.apparentTemperatureMax![index],
          apparentTemperatureMin:
              widget.mainWeatherCache?.apparentTemperatureMin![index] ??
                  widget.weatherCard?.apparentTemperatureMin![index],
          sunrise: widget.mainWeatherCache?.sunrise![index] ??
              widget.weatherCard?.sunrise![index],
          sunset: widget.mainWeatherCache?.sunset![index] ??
              widget.weatherCard?.sunset![index],
          precipitationSum: widget.mainWeatherCache?.precipitationSum![index] ??
              widget.weatherCard?.precipitationSum![index],
          precipitationProbabilityMax:
              widget.mainWeatherCache?.precipitationProbabilityMax![index] ??
                  widget.weatherCard?.precipitationProbabilityMax![index],
          windspeed10MMax: widget.mainWeatherCache?.windspeed10MMax![index] ??
              widget.weatherCard?.windspeed10MMax![index],
          windgusts10MMax: widget.mainWeatherCache?.windgusts10MMax![index] ??
              widget.weatherCard?.windgusts10MMax![index],
        ),
      ),
    );
  }
}
