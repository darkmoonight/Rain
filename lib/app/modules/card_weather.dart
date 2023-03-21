import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/card.dart';
import 'package:rain/app/widgets/create_card_weather.dart';
import 'package:rain/app/widgets/shimmer.dart';

class CardWeather extends StatefulWidget {
  const CardWeather({super.key});

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<WeatherCard>>(
        stream: locationController.getWeatherCard(),
        builder: (context, listData) {
          switch (listData.connectionState) {
            case ConnectionState.done:
            default:
              if (listData.hasData) {
                final weatherCard = listData.data!;
                if (weatherCard.isEmpty) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/add_weather.png',
                            scale: 6,
                          ),
                          SizedBox(
                            width: Get.size.width * 0.8,
                            child: Text(
                              'noWeatherCard'.tr,
                              textAlign: TextAlign.center,
                              style:
                                  context.theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: weatherCard.length,
                  itemBuilder: (context, index) {
                    final weatherCardList = weatherCard[index];
                    return Dismissible(
                      key: ValueKey(weatherCardList),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        child: const Padding(
                          padding: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Icon(
                            Iconsax.trash,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  context.theme.colorScheme.primaryContainer,
                              title: Text(
                                "deletedCardWeather".tr,
                                style: context.theme.textTheme.titleLarge,
                              ),
                              content: Text("deletedCardWeatherQuery".tr,
                                  style: context.theme.textTheme.titleMedium),
                              actions: [
                                TextButton(
                                    onPressed: () => Get.back(result: false),
                                    child: Text("cancel".tr,
                                        style: context
                                            .theme.textTheme.titleMedium
                                            ?.copyWith(
                                                color: Colors.blueAccent))),
                                TextButton(
                                    onPressed: () => Get.back(result: true),
                                    child: Text("delete".tr,
                                        style: context
                                            .theme.textTheme.titleMedium
                                            ?.copyWith(color: Colors.red))),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (DismissDirection direction) {
                        locationController.deleteCardWeather(weatherCardList);
                      },
                      child: Obx(
                        () => locationController.isLoading.isFalse
                            ? CardDescWeather(
                                time: weatherCardList
                                    .time![locationController.hourOfDay.value],
                                weather: weatherCardList.weathercode![
                                    locationController.hourOfDay.value],
                                degree: weatherCardList.temperature2M![
                                    locationController.hourOfDay.value],
                                administrativeArea:
                                    weatherCardList.administrativeArea!,
                                city: weatherCardList.city!,
                              )
                            : const MyShimmer(
                                hight: 110,
                                edgeInsetsMargin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                              ),
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            enableDrag: false,
            backgroundColor: context.theme.colorScheme.secondaryContainer,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const CreateWeatherCard();
            },
          );
        },
        backgroundColor: context.theme.colorScheme.tertiaryContainer,
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
