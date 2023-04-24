import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/daily_card.dart';

class WeatherMore extends StatefulWidget {
  const WeatherMore({
    super.key,
    this.mainWeatherCache,
    this.weatherCard,
  });
  final MainWeatherCache? mainWeatherCache;
  final WeatherCard? weatherCard;

  @override
  State<WeatherMore> createState() => _WeatherMoreState();
}

class _WeatherMoreState extends State<WeatherMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Iconsax.arrow_left_1,
            size: 20,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        title: Text(
          'weatherMore'.tr,
          style: context.theme.textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.mainWeatherCache?.timeDaily!.length ??
            widget.weatherCard?.timeDaily!.length,
        itemBuilder: (context, index) {
          return const DailyCard();
        },
      ),
    );
  }
}
