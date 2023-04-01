import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/api_key.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/modules/card_weather.dart';
import 'package:rain/app/modules/settings.dart';
import 'package:rain/app/modules/weather.dart';
import 'package:rain/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  bool visible = false;
  final locale = Get.locale;
  final locationController = Get.put(LocationController());
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await locationController.deleteCache();
    await locationController.updateCacheCard(false);
    await locationController.setLocation();
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
            ? RawAutocomplete<Result>(
                focusNode: _focusNode,
                textEditingController: _controller,
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'search'.tr,
                      border: InputBorder.none,
                    ),
                  );
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<Result>.empty();
                  }
                  return WeatherAPI()
                      .getSuggestions(textEditingValue.text, locale, apiKey);
                },
                onSelected: (Result selection) async {
                  await locationController.deleteAll(true);
                  await locationController.getLocation(
                    double.parse(selection.lat.toStringAsFixed(4)),
                    double.parse(selection.lon.toStringAsFixed(4)),
                    selection.state ?? selection.country!,
                    selection.city ?? selection.state!,
                  );
                  visible = false;
                  _controller.clear();
                  _focusNode.unfocus();
                  setState(() {});
                },
                displayStringForOption: (Result option) => option.state == null
                    ? '${option.city}, ${option.country}'
                    : option.city == null
                        ? '${option.state}, ${option.country}'
                        : '${option.city}, ${option.state}',
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected<Result> onSelected,
                    Iterable<Result> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      color: context.theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      elevation: 4.0,
                      child: SizedBox(
                        width: 250,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Result option = options.elementAt(index);
                            return InkWell(
                              onTap: () => onSelected(option),
                              child: ListTile(
                                title: Text(
                                  option.state == null
                                      ? '${option.city}, ${option.country}'
                                      : option.city == null
                                          ? '${option.state}, ${option.country}'
                                          : '${option.city}, ${option.state}',
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              )
            : Obx(() => Text(
                  locationController.isLoading.isFalse
                      ? locationController.location.district!.isEmpty
                          ? '${locationController.location.city}'
                          : locationController.location.city!.isEmpty
                              ? '${locationController.location.district}'
                              : locationController.location.city ==
                                      locationController.location.district
                                  ? '${locationController.location.city}'
                                  : '${locationController.location.city}'
                                      ', ${locationController.location.district}'
                      : settings.location
                          ? 'search'.tr
                          : locationController.isSearch.isFalse
                              ? 'loading'.tr
                              : 'searchCity'.tr,
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )),
        actions: [
          IconButton(
            onPressed: () {
              if (visible) {
                _controller.clear();
                _focusNode.unfocus();
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
