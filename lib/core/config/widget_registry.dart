/// Metadata for a home-screen widget provider on Android.
class WidgetDefinition {
  const WidgetDefinition({
    required this.id,
    required this.androidName,
    required this.qualifiedAndroidName,
  });

  final String id;
  final String androidName;
  final String qualifiedAndroidName;
}

/// All Rain home-screen widgets registered in the app.
const List<WidgetDefinition> rainWidgetRegistry = [
  WidgetDefinition(
    id: 'material_you_forecast_1x1',
    androidName: 'WidgetMaterialYouForecast1x1Provider',
    qualifiedAndroidName:
        'com.yoshi.rain.widget.providers.WidgetMaterialYouForecast1x1Provider',
  ),
  WidgetDefinition(
    id: 'material_you_current',
    androidName: 'WidgetMaterialYouCurrentProvider',
    qualifiedAndroidName:
        'com.yoshi.rain.widget.providers.WidgetMaterialYouCurrentProvider',
  ),
  WidgetDefinition(
    id: 'clock',
    androidName: 'WidgetClockDayHorizontalProvider',
    qualifiedAndroidName:
        'com.yoshi.rain.widget.providers.WidgetClockDayHorizontalProvider',
  ),
];

/// Human-readable labels for widget IDs shown in settings.
const Map<String, String> widgetDisplayLabels = {
  'material_you_forecast_1x1': 'Material You – Compact',
  'material_you_current': 'Material You – Current',
  'clock': 'Material You – Clock',
};
