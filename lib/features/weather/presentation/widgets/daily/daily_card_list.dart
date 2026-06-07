import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_info.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card.dart';
import 'package:rain/core/utils/navigation_helper.dart';

/// Scrollable list of all daily forecast summary cards.
class DailyCardList extends StatefulWidget {
  const DailyCardList({super.key, required this.weatherData});
  final WeatherCard weatherData;

  /// Creates the [State] for [DailyCardList].
  @override
  State<DailyCardList> createState() => _DailyCardListState();
}

/// Builds the scrollable list of tappable [DailyCard] rows.
class _DailyCardListState extends State<DailyCardList> {
  /// Builds the daily forecast list scaffold with back navigation.
  @override
  Widget build(BuildContext context) {
    final weatherData = widget.weatherData;
    final timeDaily = weatherData.timeDaily ?? [];

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: ListView.builder(
          itemCount: timeDaily.length,
          itemBuilder: (context, index) =>
              _buildDailyCardItem(context, weatherData, index),
        ),
      ),
    );
  }

  /// Builds the app bar with a back button and extended forecast title.
  AppBar _buildAppBar(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => NavigationHelper.back(context),
      icon: const Icon(IconsaxPlusLinear.arrow_left_3, size: 20),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    title: Text(
      'weatherMore'.tr,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
  );

  /// Builds one tappable [DailyCard] that opens [DailyCardInfo] at [index].
  Widget _buildDailyCardItem(
    BuildContext context,
    WeatherCard weatherData,
    int index,
  ) {
    final timeDaily = weatherData.timeDaily?[index];
    final weathercodeDaily = weatherData.weathercodeDaily?[index];
    final temperature2MMax = weatherData.temperature2MMax?[index];
    final temperature2MMin = weatherData.temperature2MMin?[index];

    if (timeDaily == null ||
        weathercodeDaily == null ||
        temperature2MMax == null ||
        temperature2MMin == null) {
      return Container();
    }

    return GestureDetector(
      onTap: () => NavigationHelper.toDownToUp(
        context,
        () => DailyCardInfo(weatherData: weatherData, index: index),
      ),
      child: DailyCard(
        timeDaily: timeDaily,
        weathercodeDaily: weathercodeDaily,
        temperature2MMax: temperature2MMax,
        temperature2MMin: temperature2MMin,
      ),
    );
  }
}
