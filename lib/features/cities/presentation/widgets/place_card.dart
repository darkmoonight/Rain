import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/weather/time_index_helper.dart';

/// Compact summary card for a complete saved city weather entry.
class PlaceCard extends ConsumerWidget {
  const PlaceCard({super.key, required this.card});

  /// Builds a [PlaceCard] from [card], or null when required data is missing.
  static PlaceCard? tryFromWeatherCard(WeatherCard card) {
    if (!WeatherCardValidator.isComplete(card)) return null;
    return PlaceCard(card: card);
  }

  final WeatherCard card;

  /// Builds the card showing current temperature, conditions, location, and time.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final statusWeather = ref.watch(statusWeatherProvider);
    final statusData = StatusData(settings: settings);
    final clock = LocationClock.fromWeatherCard(
      card,
      settingsClockSkewSeconds: settings.clockSkewSeconds,
    );
    final time = card.time!;
    final timeDaily = card.timeDaily!;
    final currentTimeIndex = TimeIndexHelper.getTime(time, clock);
    final currentDayIndex = TimeIndexHelper.getDay(timeDaily, clock);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        statusData.getDegree(
                          card.temperature2M![currentTimeIndex],
                        ),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(7),
                      Text(
                        statusWeather.getText(
                          card.weathercode![currentTimeIndex],
                        ),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    formatLocationLabel(card.city!, card.district!),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(5),
                  _CityWallClock(clock: clock, statusData: statusData),
                ],
              ),
            ),
            Image.asset(
              statusWeather.getImageNow(
                card.weathercode![currentTimeIndex],
                time[currentTimeIndex],
                card.sunrise![currentDayIndex],
                card.sunset![currentDayIndex],
              ),
              scale: AppConstants.dailyExtendedListIconScale,
            ),
          ],
        ),
      ),
    );
  }
}

/// Live wall-clock label for a city card (ticks every second).
class _CityWallClock extends StatelessWidget {
  const _CityWallClock({required this.clock, required this.statusData});

  final LocationClock clock;
  final StatusData statusData;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, _) => Text(
        '${'time'.tr}: ${statusData.getWallClockFormat(TimeIndexHelper.wallClockNow(clock))}',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
