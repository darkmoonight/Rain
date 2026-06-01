import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/presentation/view/place_list.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';
import 'package:rain/features/geolocation/presentation/geolocation_screen.dart';
import 'package:rain/features/map/presentation/map_screen.dart';
import 'package:rain/features/settings/presentation/view/settings.dart';
import 'package:rain/features/weather/presentation/main_weather_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  int tabIndex = 0;
  bool visible = false;
  bool _hasLocationCache = false;
  final _focusNode = FocusNode();
  late TabController tabController;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initData();
    _setupTabController(pageCount: ref.read(settingsProvider).hideMap ? 3 : 4);
    _checkLocationCache();
  }

  void _syncTabIndexAfterPageCountChange(int oldPageCount, int newPageCount) {
    if (newPageCount < oldPageCount) {
      if (tabIndex >= newPageCount) {
        tabIndex = newPageCount - 1;
      }
    } else if (newPageCount > oldPageCount &&
        tabIndex == 2 &&
        oldPageCount == 3) {
      tabIndex = 3;
    }
    tabIndex = tabIndex.clamp(0, newPageCount - 1);
  }

  void _setupTabController({required int pageCount}) {
    tabController = TabController(
      initialIndex: tabIndex.clamp(0, pageCount - 1),
      length: pageCount,
      vsync: this,
    );
    tabController.addListener(() {
      if (tabController.index != tabIndex) {
        setState(() => tabIndex = tabController.index);
      }
    });
  }

  Future<void> _initData() async {
    await ref.read(mainWeatherNotifierProvider.notifier).deleteCache();
    await ref.read(citiesNotifierProvider.notifier).refresh(all: false);
    await ref.read(mainWeatherNotifierProvider.notifier).setLocation();
  }

  Future<void> _checkLocationCache() async {
    final caches = await ref
        .read(isarProvider)
        .locationCaches
        .where()
        .findAll();
    if (mounted) setState(() => _hasLocationCache = caches.isNotEmpty);
  }

  @override
  void dispose() {
    tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _pages(bool hideMap) => [
    const MainWeatherScreen(),
    const PlaceList(),
    if (!hideMap) const MapPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final weather = ref.watch(mainWeatherNotifierProvider);
    final pages = _pages(settings.hideMap);

    if (tabController.length != pages.length) {
      final oldPageCount = tabController.length;
      tabController.dispose();
      _syncTabIndexAfterPageCountChange(oldPageCount, pages.length);
      _setupTabController(pageCount: pages.length);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: tabIndex == 0
            ? IconButton(
                onPressed: () => context.pushRouteUp(
                  const SelectGeolocation(isStart: false),
                ),
                icon: const Icon(IconsaxPlusLinear.global_search, size: 18),
              )
            : null,
        title: _buildAppBarTitle(tabIndex, weather, settings),
        actions: tabIndex == 0 ? [_buildSearchButton()] : null,
      ),
      body: SafeArea(
        child: TabBarView(controller: tabController, children: pages),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() => tabIndex = index);
          tabController.animateTo(index);
        },
        selectedIndex: tabIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(IconsaxPlusLinear.cloud_sunny),
            selectedIcon: const Icon(IconsaxPlusBold.cloud_sunny),
            label: 'name'.tr,
          ),
          NavigationDestination(
            icon: const Icon(IconsaxPlusLinear.buildings),
            selectedIcon: const Icon(IconsaxPlusBold.buildings),
            label: 'cities'.tr,
          ),
          if (!settings.hideMap)
            NavigationDestination(
              icon: const Icon(IconsaxPlusLinear.map),
              selectedIcon: const Icon(IconsaxPlusBold.map),
              label: 'map'.tr,
            ),
          NavigationDestination(
            icon: const Icon(IconsaxPlusLinear.category),
            selectedIcon: const Icon(IconsaxPlusBold.category),
            label: 'settings_full'.tr,
          ),
        ],
      ),
      floatingActionButton: tabIndex == 1
          ? FloatingActionButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                enableDrag: false,
                builder: (_) => const PlaceAction(edit: false),
              ),
              child: const Icon(IconsaxPlusLinear.add),
            )
          : null,
    );
  }

  Widget _buildSearchButton() => IconButton(
    onPressed: () => setState(() {
      if (visible) {
        _controller.clear();
        _focusNode.unfocus();
      }
      visible = !visible;
    }),
    icon: Icon(
      visible
          ? IconsaxPlusLinear.close_circle
          : IconsaxPlusLinear.search_normal_1,
      size: 18,
    ),
  );

  Widget _buildAppBarTitle(
    int tab,
    MainWeatherState weather,
    Settings settings,
  ) {
    final textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
    switch (tab) {
      case 0:
        if (visible) return _buildSearchField();
        final location = weather.location;
        final city = location.city ?? '';
        final district = location.district ?? '';
        final title = !weather.isLoading
            ? (district.isEmpty
                  ? city
                  : city.isEmpty
                  ? district
                  : city == district
                  ? city
                  : '$city, $district')
            : settings.location
            ? 'search'.tr
            : _hasLocationCache
            ? 'loading'.tr
            : 'searchCity'.tr;
        return Text(title, style: textStyle);
      case 1:
        return Text('cities'.tr, style: textStyle);
      case 2:
        return Text(
          settings.hideMap ? 'settings_full'.tr : 'map'.tr,
          style: textStyle,
        );
      default:
        return Text('settings_full'.tr, style: textStyle);
    }
  }

  Widget _buildSearchField() => RawAutocomplete<CitySearchResult>(
    focusNode: _focusNode,
    textEditingController: _controller,
    fieldViewBuilder: (context, _, _, _) => TextField(
      controller: _controller,
      focusNode: _focusNode,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: 'search'.tr,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    ),
    optionsBuilder: (value) async {
      if (value.text.isEmpty) return const Iterable<CitySearchResult>.empty();
      final locale = ref.read(localeProvider);
      return ref
          .read(weatherRemoteDatasourceProvider)
          .searchCities(value.text, locale.languageCode);
    },
    onSelected: (selection) async {
      await ref.read(mainWeatherNotifierProvider.notifier).deleteAll(true);
      await ref
          .read(mainWeatherNotifierProvider.notifier)
          .getLocation(
            selection.latitude!,
            selection.longitude!,
            selection.admin1 ?? '',
            selection.name ?? '',
          );
      if (mounted) {
        setState(() {
          visible = false;
          _controller.clear();
          _focusNode.unfocus();
        });
      }
    },
    displayStringForOption: (o) => '${o.name}, ${o.admin1}',
    optionsViewBuilder: (context, onSelected, options) => Align(
      alignment: Alignment.topLeft,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 4,
        child: SizedBox(
          width: 250,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              return ListTile(
                title: Text('${option.name}, ${option.admin1}'),
                onTap: () => onSelected(option),
              );
            },
          ),
        ),
      ),
    ),
  );
}

typedef HomePage = HomeScreen;
