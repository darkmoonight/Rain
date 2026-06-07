import '../helpers/test_bootstrap.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/settings/presentation/view/widget_settings_page.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('WidgetSettingsPage', () {
    testWidgets('lists registered home-screen widgets', (tester) async {
      await pumpRainWidget(
        tester,
        const WidgetSettingsPage(),
        bootstrap: ctx.bootstrap,
      );
      await tester.pump();

      expect(find.byType(SettingsSection), findsOneWidget);
      expect(find.text('Material You – Compact'), findsOneWidget);
      expect(find.text('Material You – Current'), findsOneWidget);
      expect(find.text('Material You – Clock'), findsOneWidget);
    });

    testWidgets('opens background color picker dialog', (tester) async {
      await pumpRainWidget(
        tester,
        const WidgetSettingsPage(),
        bootstrap: ctx.bootstrap,
      );
      await tester.pump();

      await tester.tap(find.text('Widget background'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(ColorPicker), findsOneWidget);
      expect(find.text('Widget background'), findsWidgets);
    });
  });
}
