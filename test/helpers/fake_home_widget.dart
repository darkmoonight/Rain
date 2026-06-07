import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Installs a fake home_widget platform channel for service tests.
void installFakeHomeWidget({bool saveResult = true}) {
  const channel = MethodChannel('home_widget');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
        switch (call.method) {
          case 'saveWidgetData':
          case 'updateWidget':
          case 'setAppGroupId':
          case 'registerBackgroundCallback':
            return saveResult;
          case 'isRequestPinWidgetSupported':
            return false;
          default:
            return saveResult;
        }
      });
}
