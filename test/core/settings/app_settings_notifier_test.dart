import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/test_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/i18n/locale_utils.dart';

void main() {
  setUpAll(() async {
    await initTestEnvironment();
  });

  group('AppSettingsNotifier', () {
    late TestBootstrapContext ctx;

    setUp(() async {
      ctx = await createTestBootstrap(
        settings: onboardedSettings(roundDegree: true),
      );
    });

    tearDown(() async {
      await ctx.dispose();
    });

    test('build derives state from persisted settings', () {
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      final state = container.read(appSettingsProvider);
      expect(state.roundDegree, isTrue);
      expect(state.locale.languageCode, 'en');
    });

    test('update changes locale and slang settings', () {
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      container
          .read(appSettingsProvider.notifier)
          .update(locale: const Locale('ru', 'RU'));

      final state = container.read(appSettingsProvider);
      expect(state.locale.languageCode, 'ru');
      expect(appLocaleFromFlutterLocale(state.locale).languageCode, 'ru');
    });
  });
}
