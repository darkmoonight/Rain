import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nested_scroll_views/material.dart';
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
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
      body: Row(
        children: [
          Expanded(
            child: NestedPageView.builder(
              scrollDirection: Axis.vertical,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              itemCount: widget.mainWeatherCache?.timeDaily!.length ??
                  widget.weatherCard?.timeDaily!.length,
              itemBuilder: (context, index) => SingleChildScrollView(
                child: DailyCard(
                  timeDaily: widget.mainWeatherCache?.timeDaily![index] ??
                      widget.weatherCard?.timeDaily![index],
                  weathercodeDaily:
                      widget.mainWeatherCache?.weathercodeDaily![index] ??
                          widget.weatherCard?.weathercodeDaily![index],
                  temperature2MMax:
                      widget.mainWeatherCache?.temperature2MMax![index] ??
                          widget.weatherCard?.temperature2MMax![index],
                  temperature2MMin:
                      widget.mainWeatherCache?.temperature2MMin![index] ??
                          widget.weatherCard?.temperature2MMin![index],
                  apparentTemperatureMax:
                      widget.mainWeatherCache?.apparentTemperatureMax![index] ??
                          widget.weatherCard?.apparentTemperatureMax![index],
                  apparentTemperatureMin:
                      widget.mainWeatherCache?.apparentTemperatureMin![index] ??
                          widget.weatherCard?.apparentTemperatureMin![index],
                  sunrise: widget.mainWeatherCache?.sunrise![index] ??
                      widget.weatherCard?.sunrise![index],
                  sunset: widget.mainWeatherCache?.sunset![index] ??
                      widget.weatherCard?.sunset![index],
                  precipitationSum:
                      widget.mainWeatherCache?.precipitationSum![index] ??
                          widget.weatherCard?.precipitationSum![index],
                  precipitationProbabilityMax: widget.mainWeatherCache
                          ?.precipitationProbabilityMax![index] ??
                      widget.weatherCard?.precipitationProbabilityMax![index],
                  windspeed10MMax:
                      widget.mainWeatherCache?.windspeed10MMax![index] ??
                          widget.weatherCard?.windspeed10MMax![index],
                  windgusts10MMax:
                      widget.mainWeatherCache?.windgusts10MMax![index] ??
                          widget.weatherCard?.windgusts10MMax![index],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                widget.mainWeatherCache?.timeDaily!.length ??
                    widget.weatherCard!.timeDaily!.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: DotIndicator(
                    isActive: index == pageIndex,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? context.theme.dividerColor
            : context.theme.colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
    );
  }
}
