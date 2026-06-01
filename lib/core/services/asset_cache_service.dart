import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AssetCacheService {
  Future<String> getLocalImagePath(String icon) async {
    final fileName = icon.isEmpty ? 'cloud.png' : icon;
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/$fileName';
    final data = await rootBundle.load('assets/images/$fileName');
    await File(imagePath).writeAsBytes(data.buffer.asUint8List());
    return imagePath;
  }
}
