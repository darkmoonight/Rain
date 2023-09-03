import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/widgets/daily/info_daily_card.dart';
import 'package:rain/app/widgets/daily/list_daily_card.dart';

class WeatherMore extends StatefulWidget {
  const WeatherMore({
    super.key,
    required this.weatherData,
  });
  final Map<String, dynamic> weatherData;

  @override
  State<WeatherMore> createState() => _WeatherMoreState();
}

class _WeatherMoreState extends State<WeatherMore> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: ListView.builder(
        itemCount: widget.weatherData['timeDaily']!.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.to(
            () => InfoDailyCard(
              weatherData: widget.weatherData,
              index: index,
            ),
            transition: Transition.downToUp,
          ),
          child: ListDailyCard(
            timeDaily: widget.weatherData['timeDaily']?[index],
            weathercodeDaily: widget.weatherData['weathercodeDaily']?[index],
            temperature2MMax: widget.weatherData['temperature2MMax']?[index],
            temperature2MMin: widget.weatherData['temperature2MMin']?[index],
          ),
        ),
      ),
    );
  }
}
