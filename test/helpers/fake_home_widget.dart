import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

final Map<String, Object?> savedWidgetData = {};
final List<String> homeWidgetCallLog = [];

/// Installs a fake home_widget platform channel for service tests.
void installFakeHomeWidget({bool saveResult = true}) {
  savedWidgetData.clear();
  homeWidgetCallLog.clear();
  const channel = MethodChannel('home_widget');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
        homeWidgetCallLog.add(call.method);
        switch (call.method) {
          case 'saveWidgetData':
            final args = call.arguments as Map<Object?, Object?>;
            savedWidgetData[args['id'] as String] = args['data'];
            return saveResult;
          case 'getWidgetData':
            final args = call.arguments as Map<Object?, Object?>;
            return savedWidgetData[args['id'] as String];
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
