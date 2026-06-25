import 'package:flutter/material.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/features/weather/application/main_weather_notifier.dart';
import 'package:rain/i18n/tr.dart';

/// App bar title for the main shell, including inline weather-tab search.
class HomeShellAppBarTitle extends StatelessWidget {
  const HomeShellAppBarTitle({
    super.key,
    required this.tabIndex,
    required this.hideMap,
    required this.settingsLocationEnabled,
    required this.hasLocationCache,
    required this.weatherIsLoading,
    required this.weatherCity,
    required this.weatherDistrict,
    required this.searchVisible,
    required this.searchField,
  });

  final int tabIndex;
  final bool hideMap;
  final bool settingsLocationEnabled;
  final bool hasLocationCache;
  final bool weatherIsLoading;
  final String? weatherCity;
  final String? weatherDistrict;
  final bool searchVisible;
  final Widget searchField;

  @override
  Widget build(BuildContext context) {
    final textStyle = ThemeText.appBarTitle(Theme.of(context));

    switch (tabIndex) {
      case 0:
        if (searchVisible) return searchField;
        final title = !weatherIsLoading
            ? formatLocationLabel(weatherCity, weatherDistrict)
            : settingsLocationEnabled
            ? 'search'.tr
            : hasLocationCache
            ? 'loading'.tr
            : 'searchCity'.tr;
        return Text(title, style: textStyle);
      case 1:
        return Text('cities'.tr, style: textStyle);
      case 2:
        return Text(hideMap ? 'settings_full'.tr : 'map'.tr, style: textStyle);
      default:
        return Text('settings_full'.tr, style: textStyle);
    }
  }
}

/// Narrow weather slice watched by the shell app bar.
typedef HomeShellWeatherAppBarData = ({
  bool isLoading,
  String? city,
  String? district,
});

HomeShellWeatherAppBarData homeShellWeatherAppBarData(MainWeatherState state) =>
    (
      isLoading: state.isLoading,
      city: state.location.city,
      district: state.location.district,
    );
