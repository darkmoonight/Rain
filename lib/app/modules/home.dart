import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/modules/cards/view/list_weather_card.dart';
import 'package:rain/app/modules/settings/view/settings.dart';
import 'package:rain/app/modules/main/view/weather.dart';
import 'package:rain/app/modules/cards/widgets/create_card_weather.dart';
import 'package:rain/app/services/utils.dart';
import 'package:rain/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int tabIndex = 0;
  bool visible = false;
  final _focusNode = FocusNode();
  late TabController tabController;
  final weatherController = Get.put(WeatherController());
  final _controller = TextEditingController();

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
    await weatherController.deleteCache();
    await weatherController.updateCacheCard(false);
    await weatherController.setLocation();
  }

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
    tabController.animateTo(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: ScaffoldMessenger(
        key: globalKey,
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
                        style: context.textTheme.labelLarge
                            ?.copyWith(fontSize: 16),
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
                          .getCity(textEditingValue.text, locale);
                    },
                    onSelected: (Result selection) async {
                      await weatherController.deleteAll(true);
                      await weatherController.getLocation(
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
                      weatherController.isLoading.isFalse
                          ? weatherController.location.district!.isEmpty
                              ? '${weatherController.location.city}'
                              : weatherController.location.city!.isEmpty
                                  ? '${weatherController.location.district}'
                                  : weatherController.location.city ==
                                          weatherController.location.district
                                      ? '${weatherController.location.city}'
                                      : '${weatherController.location.city}'
                                          ', ${weatherController.location.district}'
                          : settings.location
                              ? 'search'.tr
                              : (isar.locationCaches.where().findAllSync())
                                      .isNotEmpty
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
            child: TabBarView(
              controller: tabController,
              children: pages,
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
                    builder: (BuildContext context) =>
                        const CreateWeatherCard(),
                  ),
                  child: const Icon(Iconsax.add),
                )
              : null,
        ),
      ),
    );
  }
}
