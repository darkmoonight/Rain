import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_card_info.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_card.dart';

class DailyCardList extends StatefulWidget {
  const DailyCardList({super.key, required this.weatherData});
  final WeatherCard weatherData;

  @override
  State<DailyCardList> createState() => _DailyCardListState();
}

class _DailyCardListState extends State<DailyCardList> {
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

  AppBar _buildAppBar(BuildContext context) {
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
        'weatherMore'.tr,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

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
      onTap: () => Get.to(
        () => DailyCardInfo(weatherData: weatherData, index: index),
        transition: Transition.downToUp,
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
