import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_info.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';

/// Seven-day forecast preview embedded in the main weather detail view.
class DailyContainer extends ConsumerStatefulWidget {
  const DailyContainer({
    super.key,
    required this.weatherData,
    required this.onTap,
  });

  final WeatherCard weatherData;
  final VoidCallback onTap;

  /// Creates the [ConsumerState] for [DailyContainer].
  @override
  ConsumerState<DailyContainer> createState() => _DailyContainerState();
}

/// Renders the seven-day preview list and more-info action for [DailyContainer].
class _DailyContainerState extends ConsumerState<DailyContainer> {
  late final StatusWeather _statusWeather = StatusWeather();
  late Locale _locale;
  late StatusData _statusData;

  /// Builds the seven-day forecast preview card with a more-info button.
  @override
  Widget build(BuildContext context) {
    _locale = ref.watch(localeProvider);
    _statusData = StatusData(settings: ref.watch(settingsProvider));
    final splashColor = Theme.of(
      context,
    ).colorScheme.primary.withValues(alpha: 0.4);
    const inkWellBorderRadius = BorderRadius.all(Radius.circular(16));

    final weatherData = widget.weatherData;
    final weatherCodeDaily = weatherData.weathercodeDaily ?? [];
    final textTheme = Theme.of(context).textTheme;
    final labelLarge = textTheme.labelLarge;

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            _buildDailyListView(
              context,
              weatherData,
              weatherCodeDaily,
              labelLarge,
            ),
            const Divider(),
            _buildMoreInfoButton(context, splashColor, inkWellBorderRadius),
          ],
        ),
      ),
    );
  }

  /// Builds a non-scrollable list of the first seven daily forecast rows.
  Widget _buildDailyListView(
    BuildContext context,
    WeatherCard weatherData,
    List<int?> weatherCodeDaily,
    TextStyle? labelLarge,
  ) => ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 7,
    itemBuilder: (ctx, index) => _buildDailyItem(
      context,
      weatherData,
      weatherCodeDaily,
      index,
      labelLarge,
    ),
  );

  /// Builds one tappable daily row that opens [DailyCardInfo] at [index].
  Widget _buildDailyItem(
    BuildContext context,
    WeatherCard weatherData,
    List<int?> weatherCodeDaily,
    int index,
    TextStyle? labelLarge,
  ) => InkWell(
    splashColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
    borderRadius: BorderRadius.all(Radius.circular(16)),
    onTap: () => NavigationHelper.toDownToUp(
      context,
      () => DailyCardInfo(weatherData: weatherData, index: index),
    ),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDayText(weatherData, index, labelLarge),
          _buildWeatherInfo(weatherCodeDaily, index, labelLarge),
          _buildTemperatureRange(weatherData, index, labelLarge),
        ],
      ),
    ),
  );

  /// Displays the localized weekday name for the day at [index].
  Widget _buildDayText(
    WeatherCard weatherData,
    int index,
    TextStyle? labelLarge,
  ) => Expanded(
    child: Text(
      DateFormat.EEEE(
        _locale.languageCode,
      ).format((weatherData.timeDaily ?? [])[index]),
      style: labelLarge,
      overflow: TextOverflow.ellipsis,
    ),
  );

  /// Displays the weather icon and description for the day at [index].
  Widget _buildWeatherInfo(
    List<int?> weatherCodeDaily,
    int index,
    TextStyle? labelLarge,
  ) {
    final weatherCode = weatherCodeDaily[index];
    if (weatherCode == null) {
      return const Expanded(child: SizedBox.shrink());
    }

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(_statusWeather.getImage7Day(weatherCode), scale: 3),
          const Gap(5),
          Expanded(
            child: Text(
              _statusWeather.getText(weatherCode),
              style: labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Displays the formatted high and low temperatures for the day at [index].
  Widget _buildTemperatureRange(
    WeatherCard weatherData,
    int index,
    TextStyle? labelLarge,
  ) => Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          _statusData.getDegree((weatherData.temperature2MMax ?? [])[index]),
          style: labelLarge,
        ),
        Text(' / ', style: labelLarge),
        Text(
          _statusData.getDegree((weatherData.temperature2MMin ?? [])[index]),
          style: labelLarge,
        ),
      ],
    ),
  );

  /// Builds the tappable footer that invokes [widget.onTap].
  Widget _buildMoreInfoButton(
    BuildContext context,
    Color splashColor,
    BorderRadius inkWellBorderRadius,
  ) => InkWell(
    splashColor: splashColor,
    borderRadius: inkWellBorderRadius,
    onTap: widget.onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'weatherMore'.tr,
        style: Theme.of(context).textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
