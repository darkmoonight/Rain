import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/widgets/weather/desc/desc_container.dart';
import 'package:rain/app/ui/widgets/weather/desc/message.dart';
import 'package:rain/app/ui/widgets/weather/hourly.dart';
import 'package:rain/app/ui/widgets/weather/now.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/app/ui/widgets/weather/sunset_sunrise.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DailyCardInfo extends StatefulWidget {
  const DailyCardInfo({
    super.key,
    required this.weatherData,
    required this.index,
  });

  final WeatherCard weatherData;
  final int index;

  @override
  State<DailyCardInfo> createState() => _DailyCardInfoState();
}

class _DailyCardInfoState extends State<DailyCardInfo> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();
  final message = Message();
  late PageController pageController;
  int pageIndex = 0;
  int hourOfDay = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    pageIndex = widget.index;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = widget.weatherData;
    final timeDaily = weatherData.timeDaily ?? [];

    final textTheme = context.textTheme;

    return Scaffold(
      appBar: _buildAppBar(context, textTheme, timeDaily),
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
              hourOfDay = 0;
            });
          },
          itemCount: timeDaily.length,
          itemBuilder: (context, index) {
            return _buildPageContent(context, weatherData, index);
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    TextTheme textTheme,
    List<DateTime> timeDaily,
  ) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(IconsaxPlusLinear.arrow_left_3, size: 20),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      title: Text(
        DateFormat.MMMMEEEEd(locale.languageCode).format(timeDaily[pageIndex]),
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildPageContent(
    BuildContext context,
    WeatherCard weatherData,
    int index,
  ) {
    final weatherCodeDaily = weatherData.weathercodeDaily?[index];
    if (weatherCodeDaily == null) {
      return Container();
    }

    final startIndex = index * 24;
    final temperature2MMin = weatherData.temperature2MMin?[index];
    final temperature2MMax = weatherData.temperature2MMax?[index];
    final apparentTemperatureMin = weatherData.apparentTemperatureMin?[index];
    final apparentTemperatureMax = weatherData.apparentTemperatureMax?[index];
    final uvIndexMax = weatherData.uvIndexMax?[index];
    final windDirection10MDominant =
        weatherData.winddirection10MDominant?[index];
    final windSpeed10MMax = weatherData.windspeed10MMax?[index];
    final windGusts10MMax = weatherData.windgusts10MMax?[index];
    final precipitationProbabilityMax =
        weatherData.precipitationProbabilityMax?[index];
    final rainSum = weatherData.rainSum?[index];
    final precipitationSum = weatherData.precipitationSum?[index];
    final sunrise = weatherData.sunrise?[index];
    final sunset = weatherData.sunset?[index];

    if (sunrise == null || sunset == null) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          _buildNowWidget(
            weatherData,
            index,
            startIndex,
            hourOfDay,
            sunrise,
            sunset,
          ),
          _buildHourlyList(context, weatherData, startIndex, sunrise, sunset),
          _buildSunsetSunriseWidget(sunrise, sunset),
          _buildHourlyDescContainer(weatherData, startIndex, hourOfDay),
          _buildDailyDescContainer(
            weatherData,
            temperature2MMin,
            temperature2MMax,
            apparentTemperatureMin,
            apparentTemperatureMax,
            uvIndexMax,
            windDirection10MDominant,
            windSpeed10MMax,
            windGusts10MMax,
            precipitationProbabilityMax,
            rainSum,
            precipitationSum,
          ),
        ],
      ),
    );
  }

  Widget _buildNowWidget(
    WeatherCard weatherData,
    int index,
    int startIndex,
    int hourOfDay,
    String sunrise,
    String sunset,
  ) {
    final weatherCode = weatherData.weathercode?[startIndex + hourOfDay];
    final temperature = weatherData.temperature2M?[startIndex + hourOfDay];
    final feels = weatherData.apparentTemperature?[startIndex + hourOfDay];
    final time = weatherData.time?[startIndex + hourOfDay];
    final tempMax = weatherData.temperature2MMax?[index];
    final tempMin = weatherData.temperature2MMin?[index];

    if (weatherCode == null ||
        temperature == null ||
        feels == null ||
        time == null ||
        tempMax == null ||
        tempMin == null) {
      return Container();
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
    );
  }

  Widget _buildHourlyList(
    BuildContext context,
    WeatherCard weatherData,
    int startIndex,
    String sunrise,
    String sunset,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SizedBox(
          height: 135,
          child: ScrollablePositionedList.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const VerticalDivider(
                width: 10,
                indent: 40,
                endIndent: 40,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (ctx, i) {
              return _buildHourlyItem(
                context,
                weatherData,
                startIndex,
                i,
                sunrise,
                sunset,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHourlyItem(
    BuildContext context,
    WeatherCard weatherData,
    int startIndex,
    int i,
    String sunrise,
    String sunset,
  ) {
    int hourlyIndex = startIndex + i;
    bool isSelected = i == hourOfDay;

    final time = weatherData.time?[hourlyIndex];
    final weatherCode = weatherData.weathercode?[hourlyIndex];
    final temperature = weatherData.temperature2M?[hourlyIndex];

    if (time == null || weatherCode == null || temperature == null) {
      return Container();
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          hourOfDay = i;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? context.theme.colorScheme.secondaryContainer
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Hourly(
          time: time,
          weather: weatherCode,
          degree: temperature,
          timeDay: sunrise,
          timeNight: sunset,
        ),
      ),
    );
  }

  Widget _buildSunsetSunriseWidget(String sunrise, String sunset) {
    return SunsetSunrise(timeSunrise: sunrise, timeSunset: sunset);
  }

  Widget _buildHourlyDescContainer(
    WeatherCard weatherData,
    int startIndex,
    int hourOfDay,
  ) {
    final hourlyIndex = startIndex + hourOfDay;

    return DescContainer(
      humidity: weatherData.relativehumidity2M?[hourlyIndex],
      wind: weatherData.windspeed10M?[hourlyIndex],
      visibility: weatherData.visibility?[hourlyIndex],
      feels: weatherData.apparentTemperature?[hourlyIndex],
      evaporation: weatherData.evapotranspiration?[hourlyIndex],
      precipitation: weatherData.precipitation?[hourlyIndex],
      direction: weatherData.winddirection10M?[hourlyIndex],
      pressure: weatherData.surfacePressure?[hourlyIndex],
      rain: weatherData.rain?[hourlyIndex],
      cloudcover: weatherData.cloudcover?[hourlyIndex],
      windgusts: weatherData.windgusts10M?[hourlyIndex],
      uvIndex: weatherData.uvIndex?[hourlyIndex],
      dewpoint2M: weatherData.dewpoint2M?[hourlyIndex],
      precipitationProbability:
          weatherData.precipitationProbability?[hourlyIndex],
      shortwaveRadiation: weatherData.shortwaveRadiation?[hourlyIndex],
      initiallyExpanded: true,
      title: 'hourlyVariables'.tr,
    );
  }

  Widget _buildDailyDescContainer(
    WeatherCard weatherData,
    double? temperature2MMin,
    double? temperature2MMax,
    double? apparentTemperatureMin,
    double? apparentTemperatureMax,
    double? uvIndexMax,
    int? windDirection10MDominant,
    double? windSpeed10MMax,
    double? windGusts10MMax,
    int? precipitationProbabilityMax,
    double? rainSum,
    double? precipitationSum,
  ) {
    return DescContainer(
      apparentTemperatureMin: apparentTemperatureMin,
      apparentTemperatureMax: apparentTemperatureMax,
      uvIndexMax: uvIndexMax,
      windDirection10MDominant: windDirection10MDominant,
      windSpeed10MMax: windSpeed10MMax,
      windGusts10MMax: windGusts10MMax,
      precipitationProbabilityMax: precipitationProbabilityMax,
      rainSum: rainSum,
      precipitationSum: precipitationSum,
      initiallyExpanded: true,
      title: 'dailyVariables'.tr,
    );
  }
}
