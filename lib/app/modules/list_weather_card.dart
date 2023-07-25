import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/modules/info_weather_card.dart';
import 'package:rain/app/widgets/weather_card_container.dart';
import 'package:rain/app/widgets/shimmer.dart';
import 'package:rain/main.dart';

class ListWeatherCard extends StatefulWidget {
  const ListWeatherCard({super.key});

  @override
  State<ListWeatherCard> createState() => _ListWeatherCardState();
}

class _ListWeatherCardState extends State<ListWeatherCard> {
  final locationController = Get.put(LocationController());

  void updateItemOrderInDatabase(List<WeatherCard> weatherCard) async {
    for (int i = 0; i < weatherCard.length; i++) {
      final item = weatherCard[i];
      item.index = i;
      isar.writeTxn(() async => await isar.weatherCards.put(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await locationController.updateCacheCard(true);
        setState(() {});
      },
      child: StreamBuilder<List<WeatherCard>>(
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
                              style: context.textTheme.titleMedium?.copyWith(
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
                return ReorderableListView.builder(
                  onReorder: (oldIndex, newIndex) {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final element = weatherCard.removeAt(oldIndex);
                    weatherCard.insert(newIndex, element);
                    updateItemOrderInDatabase(weatherCard);
                  },
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
                            Iconsax.trush_square,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "deletedCardWeather".tr,
                                style: context.textTheme.titleLarge,
                              ),
                              content: Text("deletedCardWeatherQuery".tr,
                                  style: context.textTheme.titleMedium),
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
                      onDismissed: (DismissDirection direction) async {
                        await locationController
                            .deleteCardWeather(weatherCardList);
                      },
                      child: GestureDetector(
                        onTap: () => Get.to(
                            () => InfoWeatherCard(
                                  weatherCard: weatherCardList,
                                ),
                            transition: Transition.downToUp),
                        child: WeatherCardContainer(
                          time: weatherCardList.time!,
                          timeDaily: weatherCardList.timeDaily!,
                          timeDay: weatherCardList.sunrise!,
                          timeNight: weatherCardList.sunset!,
                          weather: weatherCardList.weathercode!,
                          degree: weatherCardList.temperature2M!,
                          district: weatherCardList.district!,
                          city: weatherCardList.city!,
                          timezone: weatherCardList.timezone!,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const MyShimmer(
                    hight: 110,
                    edgeInsetsMargin:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
