import '../helpers/test_bootstrap.dart';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/providers.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('AppSettingsNotifier.update', () {
    test('persists settings through provider', () async {
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      await container
          .read(appSettingsProvider.notifier)
          .update(roundDegree: true, largeElement: true);

      final state = container.read(appSettingsProvider);
      expect(state.roundDegree, isTrue);
      expect(state.largeElement, isTrue);
      expect(container.read(settingsProvider).roundDegree, isTrue);
      expect(container.read(settingsProvider).largeElement, isTrue);
    });
  });

  group('themeModeProvider', () {
    test('applies dark theme from settings', () async {
      ctx.bootstrap.settings.theme = 'dark';
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      expect(container.read(themeModeProvider), ThemeMode.dark);
    });
  });
}
