import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Configurable Geolocator platform responses for tests.
class FakeGeolocatorConfig {
  FakeGeolocatorConfig({
    this.serviceEnabled = true,
    this.permission = 3, // LocationPermission.whileInUse
    this.position = const {
      'latitude': 55.75,
      'longitude': 37.62,
      'timestamp': 0,
      'accuracy': 5.0,
      'altitude': 0.0,
      'heading': 0.0,
      'speed': 0.0,
      'speed_accuracy': 0.0,
      'altitude_accuracy': 0.0,
      'heading_accuracy': 0.0,
    },
    this.openSettingsResult = true,
  });

  final bool serviceEnabled;
  final int permission;
  final Map<String, Object?> position;
  final bool openSettingsResult;
}

FakeGeolocatorConfig _config = FakeGeolocatorConfig();

/// Installs mock handlers for Geolocator method channels used on Linux/desktop.
void installFakeGeolocator([FakeGeolocatorConfig? config]) {
  _config = config ?? FakeGeolocatorConfig();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  for (final channelName in const [
    'flutter.baseflow.com/geolocator',
    'flutter.baseflow.com/geolocator_android',
    'flutter.baseflow.com/geolocator_apple',
  ]) {
    messenger.setMockMethodCallHandler(MethodChannel(channelName), _handleCall);
  }
}

Future<dynamic> _handleCall(MethodCall call) async {
  switch (call.method) {
    case 'isLocationServiceEnabled':
    case 'checkLocationService':
      return _config.serviceEnabled;
    case 'checkPermission':
      return _config.permission;
    case 'requestPermission':
      return _config.permission;
    case 'getCurrentPosition':
    case 'getLastKnownPosition':
      return _config.position;
    case 'openLocationSettings':
    case 'openAppSettings':
      return _config.openSettingsResult;
    default:
      return null;
  }
}
