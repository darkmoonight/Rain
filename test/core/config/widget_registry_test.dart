import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/config/widget_registry.dart';

void main() {
  group('rainWidgetRegistry', () {
    test('contains three unique widget definitions', () {
      expect(rainWidgetRegistry, hasLength(3));
      expect(rainWidgetRegistry.map((w) => w.id).toSet(), hasLength(3));
    });

    test('every widget has a display label', () {
      for (final widget in rainWidgetRegistry) {
        expect(widgetDisplayLabels[widget.id], isNotNull);
        expect(widget.androidName, isNotEmpty);
        expect(widget.qualifiedAndroidName, contains('com.yoshi.rain'));
      }
    });
  });
}
