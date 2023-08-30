import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/modules/list_weather_card.dart';
import 'package:rain/app/modules/settings.dart';
import 'package:rain/app/modules/weather.dart';
import 'package:rain/app/widgets/create_card_weather.dart';
import 'package:rain/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int tabIndex = 0;
  late TabController tabController;
  final locationController = Get.put(LocationController());
  bool visible = false;
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  final pages = [
    const WeatherPage(),
    const ListWeatherCard(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    getData();
    tabController = TabController(
      initialIndex: tabIndex,
      length: pages.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        tabIndex = tabController.index;
      });
    });
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
    tabController.animateTo(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            context.theme.navigationBarTheme.backgroundColor,
      ),
    );

    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: const Icon(
            Iconsax.location,
            size: 18,
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
                      style:
                          context.textTheme.labelLarge?.copyWith(fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'search'.tr,
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<Result>.empty();
                    }
                    return WeatherAPI()
                        .getSuggestions(textEditingValue.text, locale);
                  },
                  onSelected: (Result selection) async {
                    await locationController.deleteAll(true);
                    await locationController.getLocation(
                      double.parse('${selection.latitude}'),
                      double.parse('${selection.longitude}'),
                      selection.admin1,
                      selection.name,
                    );
                    visible = false;
                    _controller.clear();
                    _focusNode.unfocus();
                    setState(() {});
                  },
                  displayStringForOption: (Result option) =>
                      '${option.name}, ${option.admin1}',
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<Result> onSelected,
                      Iterable<Result> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
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
                                    '${option.name}, ${option.admin1}',
                                    style: context.textTheme.labelLarge,
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
                    style: context.textTheme.titleMedium?.copyWith(
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
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Row(
            children: [
              // Row(
              //   children: [
              //     NavigationRail(
              //       selectedIndex: tabIndex,
              //       labelType: NavigationRailLabelType.all,
              //       onDestinationSelected: (int index) => changeTabIndex(index),
              //       destinations: [
              //         NavigationRailDestination(
              //           icon: const Icon(Iconsax.cloud_sunny),
              //           selectedIcon: const Icon(Iconsax.cloud_sunny5),
              //           label: Text('name'.tr),
              //         ),
              //         NavigationRailDestination(
              //           icon: const Icon(Iconsax.map_1),
              //           selectedIcon: const Icon(Iconsax.map5),
              //           label: Text('city'.tr),
              //         ),
              //         NavigationRailDestination(
              //           icon: const Icon(Iconsax.category),
              //           selectedIcon: const Icon(Iconsax.category5),
              //           label: Text('settings'.tr),
              //         ),
              //       ],
              //     ),
              //     const VerticalDivider(thickness: 1, width: 1),
              //   ],
              // ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) => changeTabIndex(index),
          selectedIndex: tabIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Iconsax.cloud_sunny),
              selectedIcon: const Icon(Iconsax.cloud_sunny5),
              label: 'name'.tr,
            ),
            NavigationDestination(
              icon: const Icon(Iconsax.map_1),
              selectedIcon: const Icon(Iconsax.map5),
              label: 'city'.tr,
            ),
            NavigationDestination(
              icon: const Icon(Iconsax.category),
              selectedIcon: const Icon(Iconsax.category5),
              label: 'settings'.tr,
            ),
          ],
        ),
        floatingActionButton: tabIndex == 1
            ? FloatingActionButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  enableDrag: false,
                  builder: (BuildContext context) => const CreateWeatherCard(),
                ),
                child: const Icon(Iconsax.add),
              )
            : null,
      ),
    );
  }
}
