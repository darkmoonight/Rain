import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Installs a fake package_info platform channel for widget tests.
void installFakePackageInfo({
  String version = '1.0.0',
  String buildNumber = '1',
  String appName = 'Rain',
  String packageName = 'com.yoshi.rain',
}) {
  const channel = MethodChannel('dev.fluttercommunity.plus/package_info');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'getAll') {
          return {
            'appName': appName,
            'packageName': packageName,
            'version': version,
            'buildNumber': buildNumber,
            'buildSignature': '',
            'installerStore': '',
          };
        }
        return null;
      });
}
