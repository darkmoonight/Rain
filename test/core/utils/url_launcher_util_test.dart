import '../../helpers/fake_url_launcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/url_launcher_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    installFakeUrlLauncher();
  });

  group('openUrl', () {
    test('opens valid https url', () async {
      await expectLater(
        openUrl('https://openstreetmap.org/copyright'),
        completes,
      );
    });

    test('throws when launch fails', () async {
      installFakeUrlLauncher(launchResult: false);

      await expectLater(
        openUrl('https://example.com'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
