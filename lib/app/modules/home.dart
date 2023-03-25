import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/api_key.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/modules/card_weather.dart';
import 'package:rain/app/modules/settings.dart';
import 'package:rain/app/modules/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  final locale = Get.locale;
  final locationController = Get.put(LocationController());
  bool visible = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    locationController.deleteCache();
    locationController.updateCacheCard(false);
    locationController.getCurrentLocation();
    super.initState();
  }

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            context.theme.bottomNavigationBarTheme.backgroundColor,
      ),
    );

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset(
          'assets/icons/logo.png',
          scale: 20,
        ),
        title: visible
            ? TypeAheadField(
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'search'.tr,
                    border: InputBorder.none,
                  ),
                ),
                errorBuilder: (context, error) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 45,
                    child: Center(
                      child: Text(
                        'Введите название',
                        style: context.theme.textTheme.bodyLarge,
                      ),
                    ),
                  );
                },
                noItemsFoundBuilder: (context) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 45,
                    child: Center(
                      child: Text(
                        'notFound'.tr,
                        style: context.theme.textTheme.bodyLarge,
                      ),
                    ),
                  );
                },
                suggestionsCallback: (query) =>
                    WeatherAPI().getSuggestions(query, locale, apiKey),
                itemBuilder: (context, suggestion) => ListTile(
                  title: Text(
                    suggestion['state'] == null
                        ? '${suggestion['city']}, ${suggestion['country']}'
                        : suggestion['city'] == null
                            ? '${suggestion['state']}, ${suggestion['country']}'
                            : '${suggestion['city']}, ${suggestion['state']}',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
                onSuggestionSelected: (suggestion) async {
                  await locationController.deleteAll();
                  await locationController.getLocation(
                    double.parse('${suggestion['lat']}'),
                    double.parse('${suggestion['lon']}'),
                    suggestion['state'] ?? suggestion['country'],
                    suggestion['city'] ?? suggestion['state'],
                  );
                  visible = false;
                  _controller.clear();
                  setState(() {});
                },
              )
            : Obx(() => Text(
                  locationController.isLoading.isFalse
                      ? locationController.location.administrativeArea!.isEmpty
                          ? '${locationController.location.city}'
                          : locationController.location.city!.isEmpty
                              ? '${locationController.location.administrativeArea}'
                              : locationController.location.city ==
                                      locationController
                                          .location.administrativeArea
                                  ? '${locationController.location.city}'
                                  : '${locationController.location.city}'
                                      ', ${locationController.location.administrativeArea}'
                      : 'search'.tr,
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )),
        actions: [
          IconButton(
            onPressed: () {
              if (visible) {
                visible = false;
              } else {
                visible = true;
              }
              setState(() {});
            },
            icon: Icon(
              visible ? Icons.close : Iconsax.search_normal_1,
              size: 18,
              color: context.theme.iconTheme.color,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: tabIndex,
          children: const [
            WeatherPage(),
            CardWeather(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: context.theme.copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: CustomNavigationBar(
          backgroundColor:
              context.theme.bottomNavigationBarTheme.backgroundColor!,
          onTap: (int index) => changeTabIndex(index),
          currentIndex: tabIndex,
          strokeColor: const Color(0x300c18fb),
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Iconsax.cloud_sunny),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Iconsax.global),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Iconsax.setting_2),
            ),
          ],
        ),
      ),
    );
  }
}
