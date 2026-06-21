import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/features/settings/presentation/widgets/settings_save_actions.dart';

/// Base [ConsumerState] for settings sections with shared [actions] helpers.
abstract class SettingsSectionConsumerState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  late final SettingsSaveActions actions;

  @override
  void initState() {
    super.initState();
    actions = SettingsSaveActions(ref, (fn) {
      if (mounted) setState(fn);
    });
  }
}
