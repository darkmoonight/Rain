import '../helpers/fake_package_info.dart';
import '../helpers/fake_services.dart';
import '../helpers/test_bootstrap.dart';
import '../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/features/settings/presentation/view/settings.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';

void main() {
  late TestBootstrapContext ctx;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    installFakePackageInfo(version: '2.5.0');
  });

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('SettingsPage', () {
    testWidgets('renders all settings sections on desktop', (tester) async {
      await pumpRainWidget(
        tester,
        const SettingsPage(),
        bootstrap: ctx.bootstrap,
      );
      await tester.pump();

      expect(find.text('Appearance'), findsOneWidget);
      expect(find.text('Functions'), findsOneWidget);
      expect(find.byType(SettingsSection), findsNWidgets(7));
    });

    testWidgets('reflects persisted AMOLED theme setting', (tester) async {
      ctx.bootstrap.settings.amoledTheme = true;

      await pumpRainWidget(
        tester,
        const SettingsPage(),
        bootstrap: ctx.bootstrap,
      );
      await tester.pump();

      final amoledSwitch = find.descendant(
        of: find.ancestor(
          of: find.text('AMOLED-theme'),
          matching: find.byType(ListTile),
        ),
        matching: find.byType(Switch),
      );

      expect(tester.widget<Switch>(amoledSwitch).value, isTrue);
    });

    testWidgets('shows app version from package info', (tester) async {
      await pumpRainWidget(
        tester,
        const SettingsPage(),
        bootstrap: ctx.bootstrap,
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.textContaining('2.5.0'), findsOneWidget);
    });

    testWidgets('location switch uses location service', (tester) async {
      await pumpRainWidget(
        tester,
        const SettingsPage(),
        bootstrap: ctx.bootstrap,
        overrides: [
          locationServiceProvider.overrideWithValue(
            FakeLocationService(serviceEnabled: true),
          ),
        ],
      );
      await tester.pump();

      final locationSwitch = find.descendant(
        of: find.ancestor(
          of: find.text('Location'),
          matching: find.byType(ListTile),
        ),
        matching: find.byType(Switch),
      );

      final switchWidget = tester.widget<Switch>(locationSwitch);
      switchWidget.onChanged!(true);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(ctx.bootstrap.settings.location, isTrue);
    });

    // Selection dialogs: see test/widgets/settings/selection_dialog_test.dart
    // (integration taps here hang under flutter test --concurrency>1).
  });
}
