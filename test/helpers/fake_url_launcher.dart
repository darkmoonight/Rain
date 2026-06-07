import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Installs a fake url_launcher channel that always succeeds.
void installFakeUrlLauncher({bool canLaunch = true, bool launchResult = true}) {
  const channel = MethodChannel('plugins.flutter.io/url_launcher');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
        switch (call.method) {
          case 'canLaunch':
            return canLaunch;
          case 'launch':
            return launchResult;
          case 'closeWebView':
            return true;
          default:
            return null;
        }
      });
}
