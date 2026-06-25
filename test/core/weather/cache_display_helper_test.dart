import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/cache_display_helper.dart';

void main() {
  group('shouldShowInitialShimmer', () {
    test('is true only while loading without cached content', () {
      expect(
        shouldShowInitialShimmer(isLoading: true, hasCachedContent: false),
        isTrue,
      );
      expect(
        shouldShowInitialShimmer(isLoading: true, hasCachedContent: true),
        isFalse,
      );
      expect(
        shouldShowInitialShimmer(isLoading: false, hasCachedContent: false),
        isFalse,
      );
    });
  });
}
