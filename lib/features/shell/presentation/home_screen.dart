import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/features/cities/presentation/view/place_list.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';
import 'package:rain/features/geolocation/presentation/geolocation_screen.dart';
import 'package:rain/features/map/presentation/map_screen.dart';
import 'package:rain/features/settings/presentation/view/settings.dart';
import 'package:rain/features/shell/presentation/widgets/home_shell_app_bar_title.dart';
import 'package:rain/features/shell/presentation/widgets/home_weather_tab_search_field.dart';
import 'package:rain/features/weather/presentation/main_weather_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  int tabIndex = 0;
  bool visible = false;
  bool _hasLocationCache = false;
  final _focusNode = FocusNode();
  late TabController tabController;
  final _controller = TextEditingController();
  Timer? _persistentNotificationTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initData();
    _setupTabController(pageCount: ref.read(settingsProvider).hideMap ? 3 : 4);
    _checkLocationCache();
    _startPersistentNotificationTimer();
  }

  void _startPersistentNotificationTimer() {
    if (!Platform.isAndroid) return;
    _persistentNotificationTimer?.cancel();
    _persistentNotificationTimer = Timer.periodic(const Duration(minutes: 1), (
      _,
    ) {
      if (!mounted) return;
      if (!ref.read(settingsProvider).persistentNotification) return;
      ref
          .read(mainWeatherNotifierProvider.notifier)
          .refreshPersistentNotification();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(citiesNotifierProvider.notifier).refreshIfStale();
      unawaited(ref.read(mainWeatherNotifierProvider.notifier).onAppResumed());
    }
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
    await ref.read(citiesNotifierProvider.notifier).refreshIfStale();
  }

  Future<void> _checkLocationCache() async {
    final caches = await ref
        .read(isarProvider)
        .locationCaches
        .where()
        .findAll();
    if (mounted) setState(() => _hasLocationCache = caches.isNotEmpty);
  }

  void _closeSearch() {
    setState(() {
      visible = false;
      _controller.clear();
      _focusNode.unfocus();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _persistentNotificationTimer?.cancel();
    tabController.dispose();
    _controller.dispose();
    _focusNode.dispose();
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
    final weatherAppBar = ref.watch(
      mainWeatherNotifierProvider.select(homeShellWeatherAppBarData),
    );
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
        title: HomeShellAppBarTitle(
          tabIndex: tabIndex,
          hideMap: settings.hideMap,
          settingsLocationEnabled: settings.location,
          hasLocationCache: _hasLocationCache,
          weatherIsLoading: weatherAppBar.isLoading,
          weatherCity: weatherAppBar.city,
          weatherDistrict: weatherAppBar.district,
          searchVisible: visible,
          searchField: HomeWeatherTabSearchField(
            controller: _controller,
            focusNode: _focusNode,
            onClose: _closeSearch,
          ),
        ),
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
}
