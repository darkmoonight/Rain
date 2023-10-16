import 'dart:io';

import 'package:dynamic_icon_flutter/dynamic_icon_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:rain/constants/constants.dart';

class AppIconService {
  void changeIcon(String iconName) {
    if (Platform.isAndroid) {
      DynamicIconFlutter.setIcon(icon: iconName, listAvailableIcon: androidIconsList);
    } else if (Platform.isIOS) {
      DynamicIconFlutter.setAlternateIconName(iconName);
    } else {
      debugPrint('Platform Not supported');
      return;
    }
  }
}
