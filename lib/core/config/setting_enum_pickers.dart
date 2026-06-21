import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/data/models/db.dart';

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
  final String Function(Settings settings) read;
  final void Function(Settings settings, String value) write;

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

String _readDegrees(Settings s) => s.degrees;
void _writeDegrees(Settings s, String v) => s.degrees = v;

String _readMeasurements(Settings s) => s.measurements;
void _writeMeasurements(Settings s, String v) => s.measurements = v;

String _readWind(Settings s) => s.wind;
void _writeWind(Settings s, String v) => s.wind = v;

String _readPressure(Settings s) => s.pressure;
void _writePressure(Settings s, String v) => s.pressure = v;

String _readAqiStandard(Settings s) => s.aqiStandard;
void _writeAqiStandard(Settings s, String v) => s.aqiStandard = v;

String _readTimeformat(Settings s) => s.timeformat;
void _writeTimeformat(Settings s, String v) => s.timeformat = v;
