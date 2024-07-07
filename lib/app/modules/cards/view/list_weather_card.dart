import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/modules/cards/widgets/weather_card_list.dart';
import 'package:rain/app/widgets/text_form.dart';

class ListWeatherCard extends StatefulWidget {
  const ListWeatherCard({super.key});

  @override
  State<ListWeatherCard> createState() => _ListWeatherCardState();
}

class _ListWeatherCardState extends State<ListWeatherCard> {
  final weatherController = Get.put(WeatherController());
  TextEditingController searchTasks = TextEditingController();
  String filter = '';

  applyFilter(String value) async {
    filter = value.toLowerCase();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    applyFilter('');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final titleMedium = textTheme.titleMedium;
    return Obx(
      () => weatherController.weatherCards.isEmpty
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/City.png',
                      scale: 6,
                    ),
                    SizedBox(
                      width: Get.size.width * 0.8,
                      child: Text(
                        'noWeatherCard'.tr,
                        textAlign: TextAlign.center,
                        style: titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: MyTextForm(
                      labelText: 'search'.tr,
                      type: TextInputType.text,
                      icon: const Icon(
                        Iconsax.search_normal_1,
                        size: 20,
                      ),
                      controller: searchTasks,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      onChanged: applyFilter,
                      iconButton: searchTasks.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                searchTasks.clear();
                                applyFilter('');
                              },
                              icon: const Icon(
                                Iconsax.close_circle,
                                color: Colors.grey,
                                size: 20,
                              ),
                            )
                          : null,
                    ),
                  ),
                ];
              },
              body: RefreshIndicator(
                onRefresh: () async {
                  await weatherController.updateCacheCard(true);
                  setState(() {});
                },
                child: WeatherCardList(searchCity: filter),
              ),
            ),
    );
  }
}
