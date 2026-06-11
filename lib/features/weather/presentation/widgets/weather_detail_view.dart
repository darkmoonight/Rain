import 'package:flutter/material.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_container.dart';
import 'package:rain/features/weather/presentation/widgets/weather_hourly_sections.dart';
import 'package:rain/features/weather/presentation/widgets/hourly.dart';
import 'package:rain/features/weather/presentation/widgets/hourly_strip.dart';
import 'package:rain/features/weather/presentation/widgets/now.dart';
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
          updatedAt: weatherCard.timestamp,
        ),
        HourlyStripCard(
          child: ScrollablePositionedList.separated(
            key: const PageStorageKey('hourly'),
            separatorBuilder: (_, _) => const HourlyStripSeparator(),
            scrollDirection: Axis.horizontal,
            itemScrollController: itemScrollController,
            itemCount: weatherCard.time!.length,
            itemBuilder: (ctx, i) {
              final day = (i / 24).floor();
              return HourlyStripTile(
                key: ValueKey('hour-$i-$hourIndex'),
                selected: i == hourIndex,
                onTap: () => onHourSelected(i, day),
                child: Hourly(
                  time: weatherCard.time![i],
                  weather: weatherCard.weathercode![i],
                  degree: weatherCard.temperature2M![i],
                  timeDay: weatherCard.sunrise![day],
                  timeNight: weatherCard.sunset![day],
                ),
              );
            },
          ),
        ),
        SunsetSunrise(timeSunrise: sunrise, timeSunset: sunset),
        WeatherHourlySections(
          weatherCard: weatherCard,
          hourIndex: hourIndex,
          aqiStandard: aqiStandard,
        ),
        DailyContainer(
          weatherData: weatherCard,
          dayIndex: dayIndex,
          hourIndex: hourIndex,
          onTap: showDailyTap ?? () {},
        ),
      ],
    );
  }
}
