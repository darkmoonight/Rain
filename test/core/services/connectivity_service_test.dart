import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/connectivity_service.dart';

void main() {
  group('ConnectivityService', () {
    tearDown(() {
      ConnectivityService.isOnline.value = Future.value(true);
      ConnectivityService.resetTestDependencies();
    });

    test('hasInternet reflects isOnline notifier value', () async {
      ConnectivityService.isOnline.value = Future.value(false);
      expect(await ConnectivityService.hasInternet(), isFalse);

      ConnectivityService.isOnline.value = Future.value(true);
      expect(await ConnectivityService.hasInternet(), isTrue);
    });

    test('setup updates isOnline when connectivity stream changes', () async {
      final controller = StreamController<List<ConnectivityResult>>();
      ConnectivityService.setTestDependencies(
        connectivityStreamFactory: () => controller.stream,
        internetChecker: () async => true,
      );
      ConnectivityService.setup();

      controller.add([ConnectivityResult.wifi]);
      await Future<void>.delayed(Duration.zero);
      expect(await ConnectivityService.hasInternet(), isTrue);

      controller.add([ConnectivityResult.none]);
      await Future<void>.delayed(Duration.zero);
      expect(await ConnectivityService.hasInternet(), isFalse);

      await controller.close();
    });
  });
}
