import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/connectivity_service.dart';

void main() {
  group('ConnectivityService', () {
    tearDown(() {
      ConnectivityService.isOnline.value = Future.value(true);
    });

    test('hasInternet reflects isOnline notifier value', () async {
      ConnectivityService.isOnline.value = Future.value(false);
      expect(await ConnectivityService.hasInternet(), isFalse);

      ConnectivityService.isOnline.value = Future.value(true);
      expect(await ConnectivityService.hasInternet(), isTrue);
    });
  });
}
