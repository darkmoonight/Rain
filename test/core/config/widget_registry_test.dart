import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/config/widget_registry.dart';

void main() {
  group('rainWidgetRegistry', () {
    test('contains three unique widget definitions', () {
      expect(rainWidgetRegistry, hasLength(3));
      expect(rainWidgetRegistry.map((w) => w.id).toSet(), hasLength(3));
    });

    test('every widget has a slang label key and Android class name', () {
      for (final widget in rainWidgetRegistry) {
        expect(widget.labelKey, isNotEmpty);
        expect(widget.androidName, isNotEmpty);
        expect(widget.qualifiedAndroidName, contains('com.yoshi.rain'));
      }
    });
  });
}
