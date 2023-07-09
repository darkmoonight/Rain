import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/modules/card_weather.dart';
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
  bool visible = false;
  final locale = Get.locale;
  final locationController = Get.put(LocationController());
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late TabController tabController;

  final pages = [
    const WeatherPage(),
    const CardWeather(),
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
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.surface,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: context.theme.colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Iconsax.location,
            size: 18,
            color: context.theme.iconTheme.color,
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
                        color: context.theme.colorScheme.primaryContainer,
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
                                    style: context.textTheme.bodyLarge,
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
                color: context.theme.iconTheme.color,
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
        bottomNavigationBar: Theme(
          data: context.theme.copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: context.theme.bottomNavigationBarTheme.backgroundColor,
            ),
            child: TabBar(
              controller: tabController,
              dividerColor: Colors.transparent,
              indicator:
                  const UnderlineTabIndicator(borderSide: BorderSide.none),
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              onTap: (int index) => changeTabIndex(index),
              tabs: const [
                Tab(icon: Icon(Iconsax.cloud_sunny)),
                Tab(icon: Icon(Iconsax.global)),
                Tab(icon: Icon(Iconsax.setting_2)),
              ],
            ),
          ),
        ),
        floatingActionButton: tabIndex == 1
            ? FloatingActionButton(
                onPressed: () => showModalBottomSheet(
                  enableDrag: false,
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const CreateWeatherCard();
                  },
                ),
                backgroundColor: context.theme.colorScheme.tertiaryContainer,
                child: const Icon(Iconsax.add),
              )
            : null,
      ),
    );
  }
}
