import '../../helpers/test_bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/di/settings_revision.dart';

void main() {
  group('settings provider updates', () {
    test(
      'settingsProvider reflects bumped revision after degrees change',
      () async {
        final ctx = await createTestBootstrap();
        final container = createTestContainer(bootstrap: ctx.bootstrap);
        addTearDown(container.dispose);

        ctx.bootstrap.settings.degrees = 'fahrenheit';
        container.read(settingsRevisionProvider.notifier).bump();

        expect(container.read(settingsProvider).degrees, 'fahrenheit');
      },
    );

    test('appSettingsProvider updates locale', () async {
      final ctx = await createTestBootstrap();
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      container
          .read(appSettingsProvider.notifier)
          .update(locale: const Locale('de', 'DE'));

      expect(
        container.read(appSettingsProvider).locale,
        const Locale('de', 'DE'),
      );
    });

    test('settingsProvider reflects wind unit changes', () async {
      final ctx = await createTestBootstrap();
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      ctx.bootstrap.settings.wind = 'm/s';
      container.read(settingsRevisionProvider.notifier).bump();

      expect(container.read(settingsProvider).wind, 'm/s');
    });
  });
}
