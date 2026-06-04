import 'package:rain/core/services/connectivity_service.dart';

class NetworkCacheHandler {
  const NetworkCacheHandler._();

  static Future<bool> fetchOrKeepCache({
    required Future<void> Function() onNetworkFetch,
    required Future<void> Function() onUseCache,
    Future<bool> Function()? hasInternet,
    void Function()? onOffline,
    void Function()? onError,
  }) async {
    final checkInternet = hasInternet ?? ConnectivityService.hasInternet;
    if (!await checkInternet()) {
      onOffline?.call();
      await onUseCache();
      return false;
    }
    try {
      await onNetworkFetch();
      return true;
    } catch (_) {
      onError?.call();
      await onUseCache();
      return false;
    }
  }
}
