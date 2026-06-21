import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/theme/theme_mode_notifier.dart';

void main() {
  group('ThemeModeNotifier', () {
    late TestBootstrapContext ctx;

    setUp(() async {
      ctx = await createTestBootstrap(settings: onboardedSettings());
    });

    tearDown(() async {
      await ctx.dispose();
    });

    test('build maps persisted theme string', () {
      ctx.bootstrap.settings.theme = 'dark';
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      expect(container.read(themeModeProvider), ThemeMode.dark);
    });

    test('setTheme persists and updates state', () async {
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      await container.read(themeModeProvider.notifier).setTheme('dark');

      expect(container.read(themeModeProvider), ThemeMode.dark);
      expect(ctx.bootstrap.settings.theme, 'dark');
      final fromDb = await container
          .read(settingsRepositoryProvider)
          .getSettings();
      expect(fromDb.theme, 'dark');
    });

    test('setTheme bumps settings revision for UI refresh', () async {
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      await container.read(themeModeProvider.notifier).setTheme('system');

      expect(container.read(settingsRevisionProvider), 1);
      expect(ctx.bootstrap.settings.theme, 'system');
    });

    test('themePreferenceLabel maps stored theme keys', () {
      expect(themePreferenceLabel('system'), 'System');
      expect(themePreferenceLabel('dark'), 'Dark');
      expect(themePreferenceLabel(null), 'System');
    });

    test('saveOledTheme persists amoled flag', () async {
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      await container.read(themeModeProvider.notifier).saveOledTheme(true);

      expect(ctx.bootstrap.settings.amoledTheme, isTrue);
    });
  });
}
