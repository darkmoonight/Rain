import '../../helpers/fake_services.dart';
import '../../helpers/test_bootstrap.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/services/widget_settings_service.dart';

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

    test('updateBackgroundColor persists color and refreshes widget', () async {
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      final ok = await service.updateBackgroundColor('#112233');

      expect(ok, isTrue);
      expect(ctx.bootstrap.settings.widgetBackgroundColor, '#112233');
      expect(fakeHomeWidget.updateCalls, 1);
    });

    test('resetBackgroundColor clears custom color', () async {
      ctx.bootstrap.settings.widgetBackgroundColor = '#112233';
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      await service.resetBackgroundColor();

      expect(ctx.bootstrap.settings.widgetBackgroundColor, isNull);
      expect(fakeHomeWidget.updateCalls, 1);
    });

    test('updateTextColor persists text color', () async {
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      await service.updateTextColor('#AABBCC');

      expect(ctx.bootstrap.settings.widgetTextColor, '#AABBCC');
      expect(fakeHomeWidget.updateCalls, 1);
    });

    test('resetTextColor clears custom text color', () async {
      ctx.bootstrap.settings.widgetTextColor = '#AABBCC';
      final container = createContainer();
      final service = container.read(widgetSettingsServiceProvider);

      await service.resetTextColor();

      expect(ctx.bootstrap.settings.widgetTextColor, isNull);
      expect(fakeHomeWidget.updateCalls, 1);
    });
  });
}
