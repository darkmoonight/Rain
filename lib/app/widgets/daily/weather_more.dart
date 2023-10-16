import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/daily/info_daily_card.dart';
import 'package:rain/app/widgets/daily/list_daily_card.dart';

class WeatherMore extends StatefulWidget {
  const WeatherMore({
    super.key,
    required this.weatherData,
  });
  final WeatherCard weatherData;

  @override
  State<WeatherMore> createState() => _WeatherMoreState();
}

class _WeatherMoreState extends State<WeatherMore> {
  @override
  Widget build(BuildContext context) {
    const transparent = Colors.transparent;
    final weatherData = widget.weatherData;
    final timeDaily = weatherData.timeDaily ?? [];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Iconsax.arrow_left_1,
            size: 20,
          ),
          splashColor: transparent,
          highlightColor: transparent,
        ),
        title: Text(
          'weatherMore'.tr,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: timeDaily.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Get.to(
              () => InfoDailyCard(
                weatherData: weatherData,
                index: index,
              ),
              transition: Transition.downToUp,
            ),
            child: ListDailyCard(
              timeDaily: timeDaily[index],
              weathercodeDaily: weatherData.weathercodeDaily![index],
              temperature2MMax: weatherData.temperature2MMax![index],
              temperature2MMin: weatherData.temperature2MMin![index],
            ),
          ),
        ),
      ),
    );
  }
}
