import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_card_info.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/main.dart';

class DailyContainer extends StatefulWidget {
  const DailyContainer({
    super.key,
    required this.weatherData,
    required this.onTap,
  });

  final WeatherCard weatherData;
  final VoidCallback onTap;

  @override
  State<DailyContainer> createState() => _DailyContainerState();
}

class _DailyContainerState extends State<DailyContainer> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    final splashColor = context.theme.colorScheme.primary.withValues(
      alpha: 0.4,
    );
    const inkWellBorderRadius = BorderRadius.all(Radius.circular(16));

    final weatherData = widget.weatherData;
    final weatherCodeDaily = weatherData.weathercodeDaily ?? [];
    final textTheme = context.textTheme;
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

  Widget _buildDailyListView(
    BuildContext context,
    WeatherCard weatherData,
    List<int?> weatherCodeDaily,
    TextStyle? labelLarge,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (ctx, index) {
        return _buildDailyItem(
          context,
          weatherData,
          weatherCodeDaily,
          index,
          labelLarge,
        );
      },
    );
  }

  Widget _buildDailyItem(
    BuildContext context,
    WeatherCard weatherData,
    List<int?> weatherCodeDaily,
    int index,
    TextStyle? labelLarge,
  ) {
    final splashColor = context.theme.colorScheme.primary.withValues(
      alpha: 0.4,
    );
    const inkWellBorderRadius = BorderRadius.all(Radius.circular(16));

    return InkWell(
      splashColor: splashColor,
      borderRadius: inkWellBorderRadius,
      onTap: () => Get.to(
        () => DailyCardInfo(weatherData: weatherData, index: index),
        transition: Transition.downToUp,
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
  }

  Widget _buildDayText(
    WeatherCard weatherData,
    int index,
    TextStyle? labelLarge,
  ) {
    return Expanded(
      child: Text(
        DateFormat.EEEE(
          locale.languageCode,
        ).format((weatherData.timeDaily ?? [])[index]),
        style: labelLarge,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

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
          Image.asset(statusWeather.getImage7Day(weatherCode), scale: 3),
          const Gap(5),
          Expanded(
            child: Text(
              statusWeather.getText(weatherCode),
              style: labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureRange(
    WeatherCard weatherData,
    int index,
    TextStyle? labelLarge,
  ) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            statusData.getDegree(
              (weatherData.temperature2MMax ?? [])[index]?.round(),
            ),
            style: labelLarge,
          ),
          Text(' / ', style: labelLarge),
          Text(
            statusData.getDegree(
              (weatherData.temperature2MMin ?? [])[index]?.round(),
            ),
            style: labelLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildMoreInfoButton(
    BuildContext context,
    Color splashColor,
    BorderRadius inkWellBorderRadius,
  ) {
    return InkWell(
      splashColor: splashColor,
      borderRadius: inkWellBorderRadius,
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'weatherMore'.tr,
          style: context.textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
