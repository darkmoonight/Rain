import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Directory? _supportDirectory;
Directory? _tempDirectory;

/// Installs a fake path_provider channel handler for unit tests (support + temp dirs).
void installFakePathProvider() {
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'getApplicationSupportDirectory') {
          _supportDirectory ??= Directory.systemTemp.createTempSync(
            'rain_path_provider_',
          );
          return _supportDirectory!.path;
        }
        if (call.method == 'getTemporaryDirectory') {
          _tempDirectory ??= Directory.systemTemp.createTempSync(
            'rain_path_provider_tmp_',
          );
          return _tempDirectory!.path;
        }
        return null;
      });
}
