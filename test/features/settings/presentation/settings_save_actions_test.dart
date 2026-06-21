import '../../../helpers/fake_services.dart';
import '../../../helpers/fixtures.dart';
import '../../../helpers/test_bootstrap.dart';
import '../../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/config/setting_enum_pickers.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/repositories/settings_repository.dart';
import 'package:rain/features/settings/presentation/widgets/settings_save_actions.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap(settings: onboardedSettings());
  });

  tearDown(() async {
    await ctx.dispose();
  });

  Future<SettingsSaveActions> pumpActionsHost(
    WidgetTester tester, {
    List overrides = const [],
  }) async {
    SettingsSaveActions? actions;

    await pumpRainWidget(
      tester,
      Consumer(
        builder: (context, ref, _) =>
            _ActionsProbe(onReady: (value) => actions = value),
      ),
      bootstrap: ctx.bootstrap,
      overrides: overrides,
    );

    await tester.pumpAndSettle();
    return actions!;
  }

  testWidgets('saveSettings persists settings and runs afterSave', (
    tester,
  ) async {
    var saveCalls = 0;
    var afterSaveRan = false;

    final actions = await pumpActionsHost(
      tester,
      overrides: [
        settingsRepositoryProvider.overrideWith(
          (ref) => _FakeSettingsRepository(
            isar: ctx.isarContext.isar,
            onSaveCallback: () => saveCalls++,
          ),
        ),
      ],
    );

    ctx.bootstrap.settings.degrees = 'fahrenheit';
    await actions.saveSettings(afterSave: () async => afterSaveRan = true);

    expect(saveCalls, 1);
    expect(afterSaveRan, isTrue);
    expect(ctx.bootstrap.settings.degrees, 'fahrenheit');
  });

  testWidgets('afterSaveForEnumPicker resolves widget and notification sync', (
    tester,
  ) async {
    final actions = await pumpActionsHost(tester);
    final degreesPicker = settingDataEnumPickers.first;

    expect(actions.afterSaveForEnumPicker(degreesPicker), isNotNull);
    expect(actions.backgroundAfterSaveForEnumPicker(degreesPicker), isTrue);
    expect(actions.afterSaveForEnumPicker(settingDataEnumPickers[2]), isNull);
  });

  testWidgets('saveLocationToggle does not setState after host is disposed', (
    tester,
  ) async {
    final actions = await pumpActionsHost(
      tester,
      overrides: [
        locationServiceProvider.overrideWithValue(FakeLocationService()),
        settingsRepositoryProvider.overrideWith(
          (ref) => _FakeSettingsRepository(
            isar: ctx.isarContext.isar,
            onSaveCallback: () {},
          ),
        ),
      ],
    );

    var refreshStarted = false;
    final saveFuture = actions.saveLocationToggle(
      enabled: true,
      refreshGps: () async {
        refreshStarted = true;
        await Future<void>.delayed(const Duration(milliseconds: 50));
      },
    );

    await tester.pump();
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();

    await expectLater(saveFuture, completion(isTrue));
    expect(refreshStarted, isTrue);
  });
}

class _FakeSettingsRepository extends SettingsRepository {
  _FakeSettingsRepository({required Isar isar, required this.onSaveCallback})
    : super(isar);

  final void Function() onSaveCallback;

  @override
  Future<void> save(Settings settings) async {
    onSaveCallback();
  }
}

class _ActionsProbe extends ConsumerStatefulWidget {
  const _ActionsProbe({required this.onReady});

  final void Function(SettingsSaveActions actions) onReady;

  @override
  ConsumerState<_ActionsProbe> createState() => _ActionsProbeState();
}

class _ActionsProbeState extends ConsumerState<_ActionsProbe> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onReady(
        SettingsSaveActions(ref, (fn) {
          if (mounted) setState(fn);
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
