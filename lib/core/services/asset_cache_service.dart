import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

/// Copies bundled weather icons to disk for widgets and notifications.
class AssetCacheService {
  /// Returns a local file path for [icon], copying from assets on first use.
  Future<String> getLocalImagePath(String icon) async {
    final fileName = icon.isEmpty ? 'cloud.png' : icon;
    final directory = await getApplicationSupportDirectory();
    final iconDir = Directory('${directory.path}/widget_icons');
    if (!await iconDir.exists()) {
      await iconDir.create(recursive: true);
    }
    final imagePath = '${iconDir.path}/$fileName';
    final file = File(imagePath);
    if (await file.exists()) return imagePath;

    final data = await rootBundle.load('assets/images/$fileName');
    await file.writeAsBytes(data.buffer.asUint8List());
    return imagePath;
  }
}
