import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/weather/daily_display_helper.dart';
import 'package:rain/core/widgets/app_back_button.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card.dart';

/// Scrollable list of all daily forecast summary cards.
class DailyCardList extends StatefulWidget {
  const DailyCardList({
    super.key,
    required this.weatherData,
    this.dayIndex = 0,
    this.hourIndex = 0,
  });

  final WeatherCard weatherData;
  final int dayIndex;
  final int hourIndex;

  /// Creates the [State] for [DailyCardList].
  @override
  State<DailyCardList> createState() => _DailyCardListState();
}

/// Builds the scrollable list of tappable [DailyCard] rows.
class _DailyCardListState extends State<DailyCardList> {
  late final DailyForecastAnchor _anchor = DailyForecastAnchor(
    dayIndex: widget.dayIndex,
    hourIndex: widget.hourIndex,
  );

  /// Builds the daily forecast list scaffold with back navigation.
  @override
  Widget build(BuildContext context) {
    final timeDaily = widget.weatherData.timeDaily ?? [];

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: ListView.builder(
          itemCount: timeDaily.length,
          itemBuilder: (context, index) =>
              _buildDailyCardItem(context, widget.weatherData, index),
        ),
      ),
    );
  }

  /// Builds the app bar with a back button and extended forecast title.
  AppBar _buildAppBar(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: const AppBackButton(),
    title: Text(
      'weatherMore'.tr,
      style: ThemeText.appBarTitle(Theme.of(context)),
    ),
  );

  /// Builds one tappable [DailyCard] that opens [DailyCardInfo] at [index].
  Widget _buildDailyCardItem(
    BuildContext context,
    WeatherCard weatherData,
    int index,
  ) {
    final timeDaily = weatherData.timeDaily?[index];
    final temperature2MMax = weatherData.temperature2MMax?[index];
    final temperature2MMin = weatherData.temperature2MMin?[index];
    final weathercodeDaily = _anchor.weatherCode(weatherData, index);

    if (timeDaily == null ||
        weathercodeDaily == null ||
        temperature2MMax == null ||
        temperature2MMin == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () => _anchor.openDetail(context, weatherData, index),
      child: DailyCard(
        timeDaily: timeDaily,
        weathercodeDaily: weathercodeDaily,
        temperature2MMax: temperature2MMax,
        temperature2MMin: temperature2MMin,
      ),
    );
  }
}
