import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityService {
  static final ValueNotifier<Future<bool>> isOnline = ValueNotifier(
    InternetConnection().hasInternetAccess,
  );

  static void setup() {
    Connectivity().onConnectivityChanged.listen((result) {
      isOnline.value = result.contains(ConnectivityResult.none)
          ? Future.value(false)
          : InternetConnection().hasInternetAccess;
    });
  }

  static Future<bool> hasInternet() => isOnline.value;
}
