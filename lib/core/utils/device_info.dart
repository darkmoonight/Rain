import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceFeature {
  DeviceFeature._internal();

  static final DeviceFeature _singleton = DeviceFeature._internal();
  factory DeviceFeature() => _singleton;

  final _deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? _androidDeviceInfo;
  bool? _isEdgeToEdgeAvailableCache;

  Future<void> init() async {
    try {
      _androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      _isEdgeToEdgeAvailableCache =
          _androidDeviceInfo != null && _androidDeviceInfo!.version.sdkInt > 28;
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing device info: $e');
      }
      _isEdgeToEdgeAvailableCache = false;
    }
  }

  bool isEdgeToEdgeAvailable() => _isEdgeToEdgeAvailableCache ?? false;

  int? get sdkVersion => _androidDeviceInfo?.version.sdkInt;
  String? get model => _androidDeviceInfo?.model;
  String? get brand => _androidDeviceInfo?.brand;
}
