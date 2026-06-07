import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Monotonic counter bumped when persisted settings change.
class SettingsRevisionNotifier extends Notifier<int> {
  /// Returns the initial settings revision of zero.
  @override
  int build() => 0;

  /// Increments the revision so settings-dependent providers rebuild.
  void bump() => state++;
}

/// Exposes the monotonic settings revision counter for cache invalidation.
final settingsRevisionProvider =
    NotifierProvider<SettingsRevisionNotifier, int>(
      SettingsRevisionNotifier.new,
    );

/// Notifies listeners that persisted settings were updated.
void notifySettingsChanged(Ref ref) {
  ref.read(settingsRevisionProvider.notifier).bump();
}
