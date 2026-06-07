import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/settings_revision.dart';

void main() {
  group('SettingsRevisionNotifier', () {
    test('starts at zero and bumps on notify', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(settingsRevisionProvider), 0);
      container.read(settingsRevisionProvider.notifier).bump();
      expect(container.read(settingsRevisionProvider), 1);
    });
  });
}
