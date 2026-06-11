import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/core/weather/daily_display_helper.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/i18n/tr.dart';

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

  @override
  ConsumerState<DailyContainer> createState() => _DailyContainerState();
}

/// Renders the seven-day preview list and more-info action for [DailyContainer].
class _DailyContainerState extends ConsumerState<DailyContainer> {
  static const _previewDayCount = 7;
  static const _inkWellBorderRadius = BorderRadius.all(Radius.circular(16));

  late final StatusWeather _statusWeather = StatusWeather();
  late final DailyForecastAnchor _anchor = DailyForecastAnchor(
    dayIndex: widget.dayIndex,
    hourIndex: widget.hourIndex,
  );

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final statusData = StatusData(settings: ref.watch(settingsProvider));
    final labelLarge = Theme.of(context).textTheme.labelLarge;
    final weatherData = widget.weatherData;
    final previewDays =
        (weatherData.weathercodeDaily?.length ?? 0) - widget.dayIndex;

    if (previewDays <= 0) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.cardBottomMargin),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingL,
          vertical: AppConstants.spacingS,
        ),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: previewDays.clamp(0, _previewDayCount),
              itemBuilder: (_, offset) => _buildDailyItem(
                weatherData,
                widget.dayIndex + offset,
                locale.languageCode,
                statusData,
                labelLarge,
              ),
            ),
            const Divider(),
            _buildMoreInfoButton(context),
          ],
        ),
      ),
    );
  }

  /// Builds one tappable daily row that opens [DailyCardInfo] at [index].
  Widget _buildDailyItem(
    WeatherCard weatherData,
    int index,
    String languageCode,
    StatusData statusData,
    TextStyle? labelLarge,
  ) => InkWell(
    borderRadius: _inkWellBorderRadius,
    onTap: () => _anchor.openDetail(context, weatherData, index),
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppConstants.dailyCardMarginVertical,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              DailyDisplayHelper.previewDayLabel(
                listIndex: index,
                dayIndex: widget.dayIndex,
                date: (weatherData.timeDaily ?? [])[index],
                languageCode: languageCode,
              ),
              style: labelLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 4,
            child: _buildWeatherInfo(weatherData, index, labelLarge),
          ),
          const Gap(AppConstants.spacingXS),
          _buildTemperatureRange(weatherData, index, statusData, labelLarge),
        ],
      ),
    ),
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
        const Gap(AppConstants.spacingS),
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
    StatusData statusData,
    TextStyle? labelLarge,
  ) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        statusData.getDegree((weatherData.temperature2MMax ?? [])[index]),
        style: labelLarge,
      ),
      Text(' / ', style: labelLarge),
      Text(
        statusData.getDegree((weatherData.temperature2MMin ?? [])[index]),
        style: labelLarge,
      ),
    ],
  );

  /// Builds the tappable footer that opens the full daily forecast list.
  Widget _buildMoreInfoButton(BuildContext context) => InkWell(
    borderRadius: _inkWellBorderRadius,
    onTap: widget.onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.spacingS),
      child: Text(
        'weatherMore'.tr,
        style: Theme.of(context).textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
