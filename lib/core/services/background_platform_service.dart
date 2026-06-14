import 'dart:io';

import 'package:flutter/services.dart';

const _channel = MethodChannel('com.yoshi.rain/background');

/// Opens Rain app info in system settings so the user can adjust battery usage.
Future<bool> openBatterySettings() async {
  if (!Platform.isAndroid) return false;
  try {
    final result = await _channel.invokeMethod<bool>('openBatterySettings');
    return result ?? false;
  } on PlatformException {
    return false;
  }
}
