import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/modules/favorite.dart';
import 'package:rain/app/modules/search.dart';
import 'package:rain/app/modules/settings.dart';
import 'package:rain/app/modules/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Obx(
        (() => IndexedStack(
              index: tabIndex.value,
              children: const [
                WeatherPage(),
                SearchPage(),
                FavoritePage(),
                SettingsPage(),
              ],
            )),
      ),
      bottomNavigationBar: Obx(
        () => Theme(
          data: context.theme.copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: CustomNavigationBar(
            backgroundColor: context.theme.primaryColor,
            strokeColor: const Color(0x300c18fb),
            onTap: (int index) => changeTabIndex(index),
            currentIndex: tabIndex.value,
            iconSize: 24,
            elevation: 0,
            items: [
              CustomNavigationBarItem(icon: const Icon(Iconsax.cloud)),
              CustomNavigationBarItem(
                  icon: const Icon(Iconsax.search_normal_1)),
              CustomNavigationBarItem(icon: const Icon(Iconsax.heart)),
              CustomNavigationBarItem(icon: const Icon(Iconsax.setting)),
            ],
          ),
        ),
      ),
    );
  }
}
