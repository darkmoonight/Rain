import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// Tracks device connectivity and exposes a shared online status notifier.
class ConnectivityService {
  static final ValueNotifier<Future<bool>> isOnline = ValueNotifier(
    InternetConnection().hasInternetAccess,
  );

  static Stream<List<ConnectivityResult>> Function()?
  _connectivityStreamFactory;
  static Future<bool> Function()? _internetChecker;

  /// Overrides platform connectivity sources for tests.
  @visibleForTesting
  static void setTestDependencies({
    Stream<List<ConnectivityResult>> Function()? connectivityStreamFactory,
    Future<bool> Function()? internetChecker,
  }) {
    _connectivityStreamFactory = connectivityStreamFactory;
    _internetChecker = internetChecker;
  }

  /// Resets test overrides to production defaults.
  @visibleForTesting
  static void resetTestDependencies() {
    _connectivityStreamFactory = null;
    _internetChecker = null;
  }

  /// Starts listening for connectivity changes and updates [isOnline].
  static void setup() {
    final stream =
        (_connectivityStreamFactory ??
        () => Connectivity().onConnectivityChanged)();
    stream.listen((result) {
      isOnline.value = result.contains(ConnectivityResult.none)
          ? Future.value(false)
          : (_internetChecker ??
                () => InternetConnection().hasInternetAccess)();
    });
  }

  /// Returns whether the device currently has internet access.
  static Future<bool> hasInternet() => isOnline.value;
}
