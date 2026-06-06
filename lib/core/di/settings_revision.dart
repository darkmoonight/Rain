import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Monotonic counter bumped when persisted settings change.
class SettingsRevisionNotifier extends Notifier<int> {
  @override
  int build() => 0;

  /// Increments the revision so settings-dependent providers rebuild.
  void bump() => state++;
}

final settingsRevisionProvider =
    NotifierProvider<SettingsRevisionNotifier, int>(
      SettingsRevisionNotifier.new,
    );

/// Notifies listeners that persisted settings were updated.
void notifySettingsChanged(Ref ref) {
  ref.read(settingsRevisionProvider.notifier).bump();
}
