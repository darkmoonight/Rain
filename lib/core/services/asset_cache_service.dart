import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';

/// Copies bundled weather icons to disk for widgets and notifications.
class AssetCacheService {
  /// Returns a local file path for [icon], copying from [assetRoot] on first use.
  Future<String> getLocalImagePath(
    String icon, {
    String? assetRoot,
  }) async {
    final root = assetRoot ?? WeatherIconTheme.assetRoot(null);
    final fileName = icon.isEmpty ? 'cloud.png' : icon;
    final cacheKey = root.replaceAll('/', '_');
    final directory = await getApplicationSupportDirectory();
    final iconDir = Directory('${directory.path}/widget_icons/$cacheKey');
    if (!await iconDir.exists()) {
      await iconDir.create(recursive: true);
    }
    final imagePath = '${iconDir.path}/$fileName';
    final file = File(imagePath);
    if (await file.exists()) return imagePath;

    final data = await rootBundle.load('$root$fileName');
    await file.writeAsBytes(data.buffer.asUint8List());
    return imagePath;
  }
}
