import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('background_bootstrap', () {
    test(
      'deleteLegacyForecastNotificationChannels completes without Android',
      () async {
        await expectLater(
          deleteLegacyForecastNotificationChannels(),
          completes,
        );
      },
    );

    test('androidNotificationsPlugin is null in test environment', () {
      expect(androidNotificationsPlugin, isNull);
    });
  });
}
