import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_container.dart';
import 'package:rain/features/weather/presentation/widgets/desc/desc_container.dart';
import 'package:rain/features/weather/presentation/widgets/hourly.dart';
import 'package:rain/features/weather/presentation/widgets/now.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/air_quality_card.dart';
import 'package:rain/features/weather/presentation/widgets/sunset_sunrise.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// Scrollable weather detail layout shared by the main and city detail screens.
class WeatherDetailView extends StatelessWidget {
  const WeatherDetailView({
    super.key,
    required this.weatherCard,
    required this.hourIndex,
    required this.dayIndex,
    required this.aqiStandard,
    required this.itemScrollController,
    required this.onHourSelected,
    this.showDailyTap,
  });

  final WeatherCard weatherCard;
  final int hourIndex;
  final int dayIndex;
  final String aqiStandard;
  final ItemScrollController itemScrollController;
  final void Function(int hour, int day) onHourSelected;
  final VoidCallback? showDailyTap;

  /// Builds the scrollable now, hourly, sunrise, hourly-variables, and daily forecast sections.
  @override
  Widget build(BuildContext context) {
    final sunrise = weatherCard.sunrise![dayIndex];
    final sunset = weatherCard.sunset![dayIndex];
    final tempMax = weatherCard.temperature2MMax![dayIndex]!;
    final tempMin = weatherCard.temperature2MMin![dayIndex]!;

    return ListView(
      children: [
        Now(
          time: weatherCard.time![hourIndex],
          weather: weatherCard.weathercode![hourIndex],
          degree: weatherCard.temperature2M![hourIndex],
          feels: weatherCard.apparentTemperature![hourIndex]!,
          timeDay: sunrise,
          timeNight: sunset,
          tempMax: tempMax,
          tempMin: tempMin,
        ),
        Card(
          margin: const EdgeInsets.only(bottom: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              height: 135,
              child: ScrollablePositionedList.separated(
                key: const PageStorageKey('hourly'),
                separatorBuilder: (_, _) =>
                    const VerticalDivider(width: 10, indent: 40, endIndent: 40),
                scrollDirection: Axis.horizontal,
                itemScrollController: itemScrollController,
                itemCount: weatherCard.time!.length,
                itemBuilder: (ctx, i) {
                  final i24 = (i / 24).floor();
                  return GestureDetector(
                    onTap: () => onHourSelected(i, i24),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: i == hourIndex
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Hourly(
                        time: weatherCard.time![i],
                        weather: weatherCard.weathercode![i],
                        degree: weatherCard.temperature2M![i],
                        timeDay: weatherCard.sunrise![i24],
                        timeNight: weatherCard.sunset![i24],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SunsetSunrise(timeSunrise: sunrise, timeSunset: sunset),
        AirQualityCard(
          weatherCard: weatherCard,
          hourIndex: hourIndex,
          aqiStandard: aqiStandard,
        ),
        DescContainer(
          humidity: weatherCard.relativehumidity2M?[hourIndex],
          wind: weatherCard.windspeed10M?[hourIndex],
          visibility: weatherCard.visibility?[hourIndex],
          feels: weatherCard.apparentTemperature?[hourIndex],
          evaporation: weatherCard.evapotranspiration?[hourIndex],
          precipitation: weatherCard.precipitation?[hourIndex],
          direction: weatherCard.winddirection10M?[hourIndex],
          pressure: weatherCard.surfacePressure?[hourIndex],
          rain: weatherCard.rain?[hourIndex],
          cloudcover: weatherCard.cloudcover?[hourIndex],
          windgusts: weatherCard.windgusts10M?[hourIndex],
          uvIndex: weatherCard.uvIndex?[hourIndex],
          dewpoint2M: weatherCard.dewpoint2M?[hourIndex],
          precipitationProbability:
              weatherCard.precipitationProbability?[hourIndex],
          shortwaveRadiation: weatherCard.shortwaveRadiation?[hourIndex],
          initiallyExpanded: false,
          title: 'hourlyVariables'.tr,
        ),
        DailyContainer(weatherData: weatherCard, onTap: showDailyTap ?? () {}),
      ],
    );
  }
}
