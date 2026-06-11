import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/weather/daily_display_helper.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';

/// Seven-day forecast preview embedded in the main weather detail view.
class DailyContainer extends ConsumerStatefulWidget {
  const DailyContainer({
    super.key,
    required this.weatherData,
    required this.dayIndex,
    required this.hourIndex,
    required this.onTap,
  });

  final WeatherCard weatherData;
  final int dayIndex;
  final int hourIndex;
  final VoidCallback onTap;

  /// Creates the [ConsumerState] for [DailyContainer].
  @override
  ConsumerState<DailyContainer> createState() => _DailyContainerState();
}

/// Renders the seven-day preview list and more-info action for [DailyContainer].
class _DailyContainerState extends ConsumerState<DailyContainer> {
  late final StatusWeather _statusWeather = StatusWeather();
  late final DailyForecastAnchor _anchor = DailyForecastAnchor(
    dayIndex: widget.dayIndex,
    hourIndex: widget.hourIndex,
  );
  late Locale _locale;
  late StatusData _statusData;

  /// Builds the seven-day forecast preview card with a more-info button.
  @override
  Widget build(BuildContext context) {
    _locale = ref.watch(localeProvider);
    _statusData = StatusData(settings: ref.watch(settingsProvider));
    const inkWellBorderRadius = BorderRadius.all(Radius.circular(16));

    final weatherData = widget.weatherData;
    final weatherCodeDaily = weatherData.weathercodeDaily ?? [];
    final previewDays = weatherCodeDaily.length - widget.dayIndex;
    final textTheme = Theme.of(context).textTheme;
    final labelLarge = textTheme.labelLarge;

    if (previewDays <= 0) {
      return const SizedBox.shrink();
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            _buildDailyListView(
              context,
              weatherData,
              previewDays.clamp(0, 7),
              labelLarge,
            ),
            const Divider(),
            _buildMoreInfoButton(context, inkWellBorderRadius),
          ],
        ),
      ),
    );
  }

  /// Builds a non-scrollable list of the first seven daily forecast rows.
  Widget _buildDailyListView(
    BuildContext context,
    WeatherCard weatherData,
    int itemCount,
    TextStyle? labelLarge,
  ) => ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: itemCount,
    itemBuilder: (ctx, offset) => _buildDailyItem(
      context,
      weatherData,
      widget.dayIndex + offset,
      labelLarge,
    ),
  );

  /// Builds one tappable daily row that opens [DailyCardInfo] at [index].
  Widget _buildDailyItem(
    BuildContext context,
    WeatherCard weatherData,
    int index,
    TextStyle? labelLarge,
  ) => InkWell(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    onTap: () => _anchor.openDetail(context, weatherData, index),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: _buildDayText(weatherData, index, labelLarge),
          ),
          Expanded(
            flex: 4,
            child: _buildWeatherInfo(weatherData, index, labelLarge),
          ),
          const Gap(4),
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
  ) => Text(
    DateFormat.EEEE(
      _locale.languageCode,
    ).format((weatherData.timeDaily ?? [])[index]),
    style: labelLarge,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  /// Displays the weather icon and description for the day at [index].
  Widget _buildWeatherInfo(
    WeatherCard weatherData,
    int index,
    TextStyle? labelLarge,
  ) {
    final weatherCode = _anchor.weatherCode(weatherData, index);
    final imagePath = _anchor.previewImagePath(
      _statusWeather,
      weatherData,
      index,
    );
    if (weatherCode == null || imagePath == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Image.asset(imagePath, scale: AppConstants.dailyPreviewIconScale),
        const Gap(5),
        Expanded(
          child: Text(
            _statusWeather.getText(weatherCode),
            style: labelLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// Displays the formatted high and low temperatures for the day at [index].
  Widget _buildTemperatureRange(
    WeatherCard weatherData,
    int index,
    TextStyle? labelLarge,
  ) => Row(
    mainAxisSize: MainAxisSize.min,
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
  );

  /// Builds the tappable footer that invokes [widget.onTap].
  Widget _buildMoreInfoButton(
    BuildContext context,
    BorderRadius inkWellBorderRadius,
  ) => InkWell(
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
