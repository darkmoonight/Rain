import 'package:material_ui/material_ui.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/domain/entities/app_settings.dart';

/// Definition for a string-enum settings picker shown via [showSelectionDialog].
class SettingEnumPickerDefinition {
  const SettingEnumPickerDefinition({
    required this.titleKey,
    required this.icon,
    required this.items,
    required this.read,
    required this.write,
    this.refreshWidgets = false,
    this.syncNotificationContent = false,
  });

  final String titleKey;
  final IconData icon;
  final List<String> items;
  final String Function(AppSettings settings) read;
  final AppSettings Function(AppSettings settings, String value) write;

  /// After save, refresh home-screen widgets.
  final bool refreshWidgets;

  /// After save, rebuild notification text from cache.
  final bool syncNotificationContent;
}

/// Unit and format pickers on the settings data section.
const settingDataEnumPickers = [
  SettingEnumPickerDefinition(
    titleKey: 'degrees',
    icon: IconsaxPlusLinear.sun_1,
    items: ['celsius', 'fahrenheit'],
    read: _readDegrees,
    write: _writeDegrees,
    refreshWidgets: true,
    syncNotificationContent: true,
  ),
  SettingEnumPickerDefinition(
    titleKey: 'measurements',
    icon: IconsaxPlusLinear.rulerpen,
    items: ['metric', 'imperial'],
    read: _readMeasurements,
    write: _writeMeasurements,
    refreshWidgets: true,
  ),
  SettingEnumPickerDefinition(
    titleKey: 'wind',
    icon: IconsaxPlusLinear.wind,
    items: ['kph', 'm/s'],
    read: _readWind,
    write: _writeWind,
  ),
  SettingEnumPickerDefinition(
    titleKey: 'pressure',
    icon: IconsaxPlusLinear.ruler,
    items: ['hPa', 'mmHg'],
    read: _readPressure,
    write: _writePressure,
  ),
  SettingEnumPickerDefinition(
    titleKey: 'aqiStandard',
    icon: IconsaxPlusLinear.health,
    items: [AqiHelper.european, AqiHelper.american],
    read: _readAqiStandard,
    write: _writeAqiStandard,
  ),
  SettingEnumPickerDefinition(
    titleKey: 'timeformat',
    icon: IconsaxPlusLinear.clock_1,
    items: ['12', '24'],
    read: _readTimeformat,
    write: _writeTimeformat,
    refreshWidgets: true,
    syncNotificationContent: true,
  ),
];

String _readDegrees(AppSettings s) => s.degrees;
AppSettings _writeDegrees(AppSettings s, String v) => s.copyWith(degrees: v);

String _readMeasurements(AppSettings s) => s.measurements;
AppSettings _writeMeasurements(AppSettings s, String v) =>
    s.copyWith(measurements: v);

String _readWind(AppSettings s) => s.wind;
AppSettings _writeWind(AppSettings s, String v) => s.copyWith(wind: v);

String _readPressure(AppSettings s) => s.pressure;
AppSettings _writePressure(AppSettings s, String v) => s.copyWith(pressure: v);

String _readAqiStandard(AppSettings s) => s.aqiStandard;
AppSettings _writeAqiStandard(AppSettings s, String v) =>
    s.copyWith(aqiStandard: v);

String _readTimeformat(AppSettings s) => s.timeformat;
AppSettings _writeTimeformat(AppSettings s, String v) =>
    s.copyWith(timeformat: v);
