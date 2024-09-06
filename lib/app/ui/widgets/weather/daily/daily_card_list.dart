import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_card_info.dart';
import 'package:rain/app/ui/widgets/weather/daily/daily_card.dart';

class DailyCardList extends StatefulWidget {
  const DailyCardList({
    super.key,
    required this.weatherData,
  });
  final WeatherCard weatherData;

  @override
  State<DailyCardList> createState() => _DailyCardListState();
}

class _DailyCardListState extends State<DailyCardList> {
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
            IconsaxPlusLinear.arrow_left_3,
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
              () => DailyCardInfo(
                weatherData: weatherData,
                index: index,
              ),
              transition: Transition.downToUp,
            ),
            child: DailyCard(
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
