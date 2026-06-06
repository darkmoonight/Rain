import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// Tracks device connectivity and exposes a shared online status notifier.
class ConnectivityService {
  static final ValueNotifier<Future<bool>> isOnline = ValueNotifier(
    InternetConnection().hasInternetAccess,
  );

  /// Starts listening for connectivity changes and updates [isOnline].
  static void setup() {
    Connectivity().onConnectivityChanged.listen((result) {
      isOnline.value = result.contains(ConnectivityResult.none)
          ? Future.value(false)
          : InternetConnection().hasInternetAccess;
    });
  }

  /// Returns whether the device currently has internet access.
  static Future<bool> hasInternet() => isOnline.value;
}
