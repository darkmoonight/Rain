import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/i18n/locale_format_helper.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/widgets/app_back_button.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/desc/desc_container.dart';
import 'package:rain/features/weather/presentation/widgets/weather_hourly_sections.dart';
import 'package:rain/features/weather/presentation/widgets/hourly.dart';
import 'package:rain/features/weather/presentation/widgets/hourly_strip.dart';
import 'package:rain/features/weather/presentation/widgets/now.dart';
import 'package:rain/features/weather/presentation/widgets/sunset_sunrise.dart';
import 'package:rain/i18n/tr.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// Paged full-day weather detail opened from the daily forecast list or preview.
class DailyCardInfo extends ConsumerStatefulWidget {
  const DailyCardInfo({
    super.key,
    required this.weatherData,
    required this.index,
    this.initialHourOfDay = 0,
  });

  final WeatherCard weatherData;
  final int index;
  final int initialHourOfDay;

  @override
  ConsumerState<DailyCardInfo> createState() => _DailyCardInfoState();
}

/// Manages paging across all daily forecasts, hour selection, and detail sections.
class _DailyCardInfoState extends ConsumerState<DailyCardInfo> {
  late PageController pageController;
  int pageIndex = 0;
  int hourOfDay = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.index);
    pageIndex = widget.index;
    hourOfDay = widget.initialHourOfDay;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final timeDaily = widget.weatherData.timeDaily ?? [];

    return Scaffold(
      appBar: _buildAppBar(context, timeDaily, locale),
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (index) => setState(() {
            pageIndex = index;
            hourOfDay = 0;
          }),
          itemCount: timeDaily.length,
          itemBuilder: (context, index) =>
              _buildPageContent(widget.weatherData, index),
        ),
      ),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    List<DateTime> timeDaily,
    Locale locale,
  ) => AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: const AppBackButton(),
    title: Text(
      LocaleFormatHelper.fullDateWithWeekday(
        timeDaily[pageIndex],
        locale.languageCode,
      ),
      style: ThemeText.appBarTitle(Theme.of(context)),
    ),
  );

  /// One day: now header, hourly strip, sun times, AQI, variable grids.
  Widget _buildPageContent(WeatherCard weatherData, int dayIndex) {
    final weatherCodeDaily = weatherData.weathercodeDaily?[dayIndex];
    final sunrise = weatherData.sunrise?[dayIndex];
    final sunset = weatherData.sunset?[dayIndex];
    if (weatherCodeDaily == null || sunrise == null || sunset == null) {
      return const SizedBox.shrink();
    }

    final startIndex = dayIndex * 24;
    final hourlyIndex = startIndex + hourOfDay;
    final aqiStandard = ref.watch(settingsProvider).aqiStandard;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          _buildNowWidget(
            weatherData,
            dayIndex,
            startIndex,
            hourOfDay,
            sunrise,
            sunset,
          ),
          _buildHourlyList(weatherData, startIndex, sunrise, sunset),
          SunsetSunrise(timeSunrise: sunrise, timeSunset: sunset),
          WeatherHourlySections(
            weatherCard: weatherData,
            hourIndex: hourlyIndex,
            aqiStandard: aqiStandard,
            hourlyVariablesExpanded: true,
          ),
          DescContainer.fromDailySlot(
            card: weatherData,
            dayIndex: dayIndex,
            initiallyExpanded: true,
            title: 'dailyVariables'.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildNowWidget(
    WeatherCard weatherData,
    int dayIndex,
    int startIndex,
    int hourOfDay,
    String sunrise,
    String sunset,
  ) {
    final slot = startIndex + hourOfDay;
    final weatherCode = weatherData.weathercode?[slot];
    final temperature = weatherData.temperature2M?[slot];
    final feels = weatherData.apparentTemperature?[slot];
    final time = weatherData.time?[slot];
    final tempMax = weatherData.temperature2MMax?[dayIndex];
    final tempMin = weatherData.temperature2MMin?[dayIndex];

    if (weatherCode == null ||
        temperature == null ||
        feels == null ||
        time == null ||
        tempMax == null ||
        tempMin == null) {
      return const SizedBox.shrink();
    }

    return Now(
      weather: weatherCode,
      degree: temperature,
      feels: feels,
      time: time,
      timeDay: sunrise,
      timeNight: sunset,
      tempMax: tempMax,
      tempMin: tempMin,
      updatedAt: weatherData.timestamp,
    );
  }

  /// 24-hour strip for the current page; updates [hourOfDay] on tap.
  Widget _buildHourlyList(
    WeatherCard weatherData,
    int startIndex,
    String sunrise,
    String sunset,
  ) => HourlyStripCard(
    child: ScrollablePositionedList.separated(
      separatorBuilder: (_, _) => const HourlyStripSeparator(),
      scrollDirection: Axis.horizontal,
      itemCount: 24,
      itemBuilder: (_, i) =>
          _buildHourlyItem(weatherData, startIndex, i, sunrise, sunset),
    ),
  );

  Widget _buildHourlyItem(
    WeatherCard weatherData,
    int startIndex,
    int i,
    String sunrise,
    String sunset,
  ) {
    final hourlyIndex = startIndex + i;
    final time = weatherData.time?[hourlyIndex];
    final weatherCode = weatherData.weathercode?[hourlyIndex];
    final temperature = weatherData.temperature2M?[hourlyIndex];

    if (time == null || weatherCode == null || temperature == null) {
      return const SizedBox.shrink();
    }

    return HourlyStripTile(
      key: ValueKey('hour-$i-$hourOfDay'),
      selected: i == hourOfDay,
      onTap: () => setState(() => hourOfDay = i),
      child: Hourly(
        time: time,
        weather: weatherCode,
        degree: temperature,
        timeDay: sunrise,
        timeNight: sunset,
      ),
    );
  }
}
