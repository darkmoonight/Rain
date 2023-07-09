import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/daily_card.dart';
import 'package:rain/app/widgets/list_daily_card.dart';

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
          'weatherMore'.tr,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.mainWeatherCache?.timeDaily!.length ??
            widget.weatherCard?.timeDaily!.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.to(
            () => DailyCard(
              timeDaily: widget.mainWeatherCache?.timeDaily ??
                  widget.weatherCard!.timeDaily!,
              weathercodeDaily: widget.mainWeatherCache?.weathercodeDaily ??
                  widget.weatherCard!.weathercodeDaily!,
              temperature2MMax: widget.mainWeatherCache?.temperature2MMax ??
                  widget.weatherCard!.temperature2MMax!,
              temperature2MMin: widget.mainWeatherCache?.temperature2MMin ??
                  widget.weatherCard!.temperature2MMin!,
              apparentTemperatureMax:
                  widget.mainWeatherCache?.apparentTemperatureMax ??
                      widget.weatherCard!.apparentTemperatureMax!,
              apparentTemperatureMin:
                  widget.mainWeatherCache?.apparentTemperatureMin ??
                      widget.weatherCard!.apparentTemperatureMin!,
              sunrise: widget.mainWeatherCache?.sunrise ??
                  widget.weatherCard!.sunrise!,
              sunset: widget.mainWeatherCache?.sunset ??
                  widget.weatherCard!.sunset!,
              precipitationSum: widget.mainWeatherCache?.precipitationSum ??
                  widget.weatherCard!.precipitationSum!,
              precipitationProbabilityMax:
                  widget.mainWeatherCache?.precipitationProbabilityMax ??
                      widget.weatherCard!.precipitationProbabilityMax!,
              windspeed10MMax: widget.mainWeatherCache?.windspeed10MMax ??
                  widget.weatherCard!.windspeed10MMax!,
              windgusts10MMax: widget.mainWeatherCache?.windgusts10MMax ??
                  widget.weatherCard!.windgusts10MMax!,
              uvIndexMax: widget.mainWeatherCache?.uvIndexMax ??
                  widget.weatherCard!.uvIndexMax!,
              rainSum: widget.mainWeatherCache?.rainSum ??
                  widget.weatherCard!.rainSum!,
              winddirection10MDominant:
                  widget.mainWeatherCache?.winddirection10MDominant ??
                      widget.weatherCard!.winddirection10MDominant!,
              index: index,
            ),
            transition: Transition.downToUp,
          ),
          child: ListCardDaily(
            timeDaily: widget.mainWeatherCache?.timeDaily![index] ??
                widget.weatherCard!.timeDaily![index],
            weathercodeDaily:
                widget.mainWeatherCache?.weathercodeDaily![index] ??
                    widget.weatherCard!.weathercodeDaily![index],
            temperature2MMax:
                widget.mainWeatherCache?.temperature2MMax![index] ??
                    widget.weatherCard!.temperature2MMax![index],
            temperature2MMin:
                widget.mainWeatherCache?.temperature2MMin![index] ??
                    widget.weatherCard!.temperature2MMin![index],
          ),
        ),
      ),
    );
  }
}
