import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/device_info.dart';

void main() {
  group('DeviceFeature', () {
    test('isEdgeToEdgeAvailable is false before init on test host', () {
      expect(DeviceFeature().isEdgeToEdgeAvailable(), isFalse);
    });

    test('sdkVersion and model are null before init', () {
      final device = DeviceFeature();
      expect(device.sdkVersion, isNull);
      expect(device.model, isNull);
      expect(device.brand, isNull);
    });
  });
}
