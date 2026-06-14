import '../../helpers/fake_services.dart';
import '../../helpers/test_bootstrap.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';

void main() {
  group('WidgetSettingsService', () {
    late TestBootstrapContext ctx;
    late FakeHomeWidgetService fakeHomeWidget;

    setUp(() async {
      ctx = await createTestBootstrap();
      fakeHomeWidget = FakeHomeWidgetService();
    });

    ProviderContainer createContainer() {
      final container = ProviderContainer(
        overrides: [
          bootstrapProvider.overrideWithValue(ctx.bootstrap),
          homeWidgetServiceProvider.overrideWithValue(fakeHomeWidget),
        ],
      );
      addTearDown(container.dispose);
      return container;
    }

    test(
      'reloadWidgets refreshes widgets without persisting settings',
      () async {
        final container = createContainer();
        final service = container.read(widgetSettingsServiceProvider);

        final ok = await service.refreshWidgets();

        expect(ok, isTrue);
        expect(fakeHomeWidget.updateCalls, 1);
      },
    );

    test('updateBackgroundColor persists light theme color', () async {
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      final ok = await service.updateBackgroundColor(
        lightTheme: true,
        color: '#112233',
      );

      expect(ok, isTrue);
      expect(ctx.bootstrap.settings.widgetBackgroundColorLight, '#112233');
      expect(fakeHomeWidget.updateCalls, 1);
    });

    test('resetBackgroundColor clears custom light theme color', () async {
      ctx.bootstrap.settings.widgetBackgroundColorLight = '#112233';
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      await service.resetBackgroundColor(lightTheme: true);

      expect(ctx.bootstrap.settings.widgetBackgroundColorLight, isNull);
      expect(fakeHomeWidget.updateCalls, 1);
    });

    test('updateTextColor persists dark theme text color', () async {
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      await service.updateTextColor(lightTheme: false, color: '#AABBCC');

      expect(ctx.bootstrap.settings.widgetTextColorDark, '#AABBCC');
      expect(fakeHomeWidget.updateCalls, 1);
    });

    test('resetAllWidgetColors clears all custom widget colors', () async {
      ctx.bootstrap.settings
        ..widgetBackgroundColorLight = '#111111'
        ..widgetBackgroundColorDark = '#222222'
        ..widgetTextColorLight = '#333333'
        ..widgetTextColorDark = '#444444';
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      await service.resetAllWidgetColors();

      expect(ctx.bootstrap.settings.widgetBackgroundColorLight, isNull);
      expect(ctx.bootstrap.settings.widgetBackgroundColorDark, isNull);
      expect(ctx.bootstrap.settings.widgetTextColorLight, isNull);
      expect(ctx.bootstrap.settings.widgetTextColorDark, isNull);
      expect(fakeHomeWidget.updateCalls, 1);
    });
  });
}
