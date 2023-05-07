import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/daily_card.dart';
import 'package:rain/app/widgets/status.dart';
import 'package:rain/app/widgets/status_im_fa.dart';

class WeatherDaily extends StatefulWidget {
  const WeatherDaily({
    super.key,
    this.mainWeatherCache,
    this.weatherCard,
    required this.onTap,
  });
  final MainWeatherCache? mainWeatherCache;
  final WeatherCard? weatherCard;
  final Function() onTap;

  @override
  State<WeatherDaily> createState() => _WeatherDailyState();
}

class _WeatherDailyState extends State<WeatherDaily> {
  final locale = Get.locale;
  final status = Status();
  final statusImFa = StatusImFa();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 455,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (ctx, i) {
                return InkWell(
                  onTap: () => Get.to(
                      () => DailyCard(
                            timeDaily: widget.mainWeatherCache?.timeDaily ??
                                widget.weatherCard?.timeDaily,
                            weathercodeDaily:
                                widget.mainWeatherCache?.weathercodeDaily ??
                                    widget.weatherCard?.weathercodeDaily,
                            temperature2MMax:
                                widget.mainWeatherCache?.temperature2MMax ??
                                    widget.weatherCard?.temperature2MMax,
                            temperature2MMin:
                                widget.mainWeatherCache?.temperature2MMin ??
                                    widget.weatherCard?.temperature2MMin,
                            apparentTemperatureMax: widget
                                    .mainWeatherCache?.apparentTemperatureMax ??
                                widget.weatherCard?.apparentTemperatureMax,
                            apparentTemperatureMin: widget
                                    .mainWeatherCache?.apparentTemperatureMin ??
                                widget.weatherCard?.apparentTemperatureMin,
                            sunrise: widget.mainWeatherCache?.sunrise ??
                                widget.weatherCard?.sunrise,
                            sunset: widget.mainWeatherCache?.sunset ??
                                widget.weatherCard?.sunset,
                            precipitationSum:
                                widget.mainWeatherCache?.precipitationSum ??
                                    widget.weatherCard?.precipitationSum,
                            precipitationProbabilityMax: widget.mainWeatherCache
                                    ?.precipitationProbabilityMax ??
                                widget.weatherCard?.precipitationProbabilityMax,
                            windspeed10MMax:
                                widget.mainWeatherCache?.windspeed10MMax ??
                                    widget.weatherCard?.windspeed10MMax,
                            windgusts10MMax:
                                widget.mainWeatherCache?.windgusts10MMax ??
                                    widget.weatherCard?.windgusts10MMax,
                            uvIndexMax: widget.mainWeatherCache?.uvIndexMax ??
                                widget.weatherCard?.uvIndexMax,
                            rainSum: widget.mainWeatherCache?.rainSum! ??
                                widget.weatherCard?.rainSum,
                            winddirection10MDominant: widget.mainWeatherCache
                                    ?.winddirection10MDominant ??
                                widget.weatherCard?.winddirection10MDominant,
                            index: i,
                          ),
                      transition: Transition.downToUp),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            DateFormat.EEEE(locale?.languageCode).format(
                                widget.mainWeatherCache?.timeDaily![i] ??
                                    widget.weatherCard!.timeDaily![i]),
                            style: context.theme.textTheme.labelLarge,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                status.getImage7Day(widget.mainWeatherCache
                                        ?.weathercodeDaily![i] ??
                                    widget.weatherCard!.weathercodeDaily![i]),
                                scale: 3,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  status.getText(widget.mainWeatherCache
                                          ?.weathercodeDaily![i] ??
                                      widget.weatherCard!.weathercodeDaily![i]),
                                  style: context.theme.textTheme.labelLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                statusImFa.getDegree(widget
                                        .mainWeatherCache?.temperature2MMin![i]
                                        .round() ??
                                    widget.weatherCard!.temperature2MMin![i]
                                        .round()),
                                style: context.theme.textTheme.labelLarge,
                              ),
                              Text(
                                ' / ',
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                statusImFa.getDegree(widget
                                        .mainWeatherCache?.temperature2MMax![i]
                                        .round() ??
                                    widget.weatherCard!.temperature2MMax![i]
                                        .round()),
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'weatherMore'.tr,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
