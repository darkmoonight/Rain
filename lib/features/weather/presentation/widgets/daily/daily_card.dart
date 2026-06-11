import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';

/// Summary row for one day in the extended daily forecast list.
class DailyCard extends ConsumerStatefulWidget {
  const DailyCard({
    super.key,
    required this.timeDaily,
    required this.weathercodeDaily,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  final DateTime timeDaily;
  final int? weathercodeDaily;
  final double? temperature2MMax;
  final double? temperature2MMin;

  /// Creates the [ConsumerState] for [DailyCard].
  @override
  ConsumerState<DailyCard> createState() => _DailyCardState();
}

/// Manages locale-aware rendering for a single [DailyCard] row.
class _DailyCardState extends ConsumerState<DailyCard> {
  final statusWeather = StatusWeather();
  late Locale _locale;

  /// Builds the daily summary card or an empty placeholder when the weather code is missing.
  @override
  Widget build(BuildContext context) {
    _locale = ref.watch(localeProvider);
    final statusData = StatusData(settings: ref.watch(settingsProvider));
    if (widget.weathercodeDaily == null) {
      return Container();
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          spacing: 5,
          children: [
            _buildTemperatureInfo(context, statusData),
            _buildWeatherImage(),
          ],
        ),
      ),
    );
  }

  /// Builds the temperature, date, and description column for this day.
  Widget _buildTemperatureInfo(
    BuildContext context,
    StatusData statusData,
  ) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          '${statusData.getDegree(widget.temperature2MMin)} / ${statusData.getDegree(widget.temperature2MMax)}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        _buildDateText(context),
        _buildWeatherDescription(context),
      ],
    ),
  );

  /// Formats and displays the localized date for [timeDaily].
  Widget _buildDateText(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      DateFormat.MMMMEEEEd(_locale.languageCode).format(widget.timeDaily),
      style: ThemeText.muted(
        theme,
        theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }

  /// Displays the localized weather description for this day.
  Widget _buildWeatherDescription(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      statusWeather.getText(widget.weathercodeDaily),
      style: ThemeText.muted(
        theme,
        theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }

  /// Large list icons ([StatusWeather.getImageNowDaily], not preview day/night assets).
  Widget _buildWeatherImage() => Image.asset(
    statusWeather.getImageNowDaily(widget.weathercodeDaily),
    scale: AppConstants.dailyExtendedListIconScale,
  );
}
