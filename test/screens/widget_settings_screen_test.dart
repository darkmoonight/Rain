import '../helpers/test_bootstrap.dart';
import '../helpers/fake_services.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/features/settings/presentation/view/widget_settings_page.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';

void main() {
  late TestBootstrapContext ctx;
  late FakeHomeWidgetService fakeHomeWidget;

  setUp(() async {
    ctx = await createTestBootstrap();
    fakeHomeWidget = FakeHomeWidgetService();
  });

  Future<void> pumpPage(WidgetTester tester) async {
    await pumpRainWidget(
      tester,
      const WidgetSettingsPage(),
      bootstrap: ctx.bootstrap,
      overrides: [homeWidgetServiceProvider.overrideWithValue(fakeHomeWidget)],
    );
    await tester.pump();
  }

  group('WidgetSettingsPage', () {
    testWidgets('lists registered home-screen widgets', (tester) async {
      await pumpPage(tester);

      expect(find.byType(SettingsSection), findsNWidgets(4));
      expect(find.text('Light'), findsOneWidget);
      expect(find.text('Dark'), findsOneWidget);
      expect(find.text('Material You – Compact'), findsOneWidget);
      expect(find.text('Material You – Current'), findsOneWidget);
      expect(find.text('Material You – Clock'), findsOneWidget);
    });

    testWidgets('shows reload and per-theme color tiles', (tester) async {
      await pumpPage(tester);

      expect(find.text('Reload widgets'), findsOneWidget);
      expect(find.text('Widget background (light)'), findsOneWidget);
      expect(find.text('Widget background (dark)'), findsOneWidget);
      expect(find.text('Widget text (light)'), findsOneWidget);
      expect(find.text('Widget text (dark)'), findsOneWidget);
    });

    testWidgets('reload widgets triggers home widget refresh', (tester) async {
      await pumpPage(tester);

      await tester.tap(find.text('Reload widgets'));
      await tester.pump();

      expect(fakeHomeWidget.updateCalls, 1);
    });

    testWidgets('opens light background color picker dialog', (tester) async {
      await pumpPage(tester);

      await tester.tap(find.text('Widget background (light)'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(ColorPicker), findsOneWidget);
      expect(find.text('Widget background (light)'), findsWidgets);
    });
  });
}
