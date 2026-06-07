import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('SettingsTile', () {
    testWidgets('renders title and trailing widget', (tester) async {
      await pumpRainWidget(
        tester,
        Scaffold(
          body: SettingsTile(
            leading: const Icon(IconsaxPlusLinear.sun_1),
            title: 'theme',
            trailing: Switch(value: true, onChanged: (_) {}),
          ),
        ),
        bootstrap: ctx.bootstrap,
      );

      expect(find.byType(Switch), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });
  });

  group('SettingsSection', () {
    testWidgets('renders section title and children', (tester) async {
      await pumpRainWidget(
        tester,
        SettingsSection(
          title: 'general',
          icon: IconsaxPlusLinear.setting_2,
          children: const [ListTile(title: Text('Child tile'))],
        ),
        bootstrap: ctx.bootstrap,
      );

      expect(find.text('Child tile'), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
    });
  });
}
