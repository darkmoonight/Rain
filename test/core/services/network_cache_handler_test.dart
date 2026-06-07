import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/network_cache_handler.dart';

void main() {
  group('NetworkCacheHandler.fetchOrKeepCache', () {
    test('uses cache when offline', () async {
      var fetched = false;
      var cached = false;
      var offlineCalled = false;

      final result = await NetworkCacheHandler.fetchOrKeepCache(
        hasInternet: () async => false,
        onOffline: () => offlineCalled = true,
        onNetworkFetch: () async => fetched = true,
        onUseCache: () async => cached = true,
      );

      expect(result, isFalse);
      expect(fetched, isFalse);
      expect(cached, isTrue);
      expect(offlineCalled, isTrue);
    });

    test('fetches when online and succeeds', () async {
      var fetched = false;
      var cached = false;

      final result = await NetworkCacheHandler.fetchOrKeepCache(
        hasInternet: () async => true,
        onNetworkFetch: () async => fetched = true,
        onUseCache: () async => cached = true,
      );

      expect(result, isTrue);
      expect(fetched, isTrue);
      expect(cached, isFalse);
    });

    test('falls back to cache on fetch error', () async {
      var errorCalled = false;
      var cached = false;

      final result = await NetworkCacheHandler.fetchOrKeepCache(
        hasInternet: () async => true,
        onError: () => errorCalled = true,
        onNetworkFetch: () async => throw Exception('network'),
        onUseCache: () async => cached = true,
      );

      expect(result, isFalse);
      expect(errorCalled, isTrue);
      expect(cached, isTrue);
    });
  });
}
