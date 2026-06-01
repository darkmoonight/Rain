import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsRevisionNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state++;
}

final settingsRevisionProvider =
    NotifierProvider<SettingsRevisionNotifier, int>(
      SettingsRevisionNotifier.new,
    );

void notifySettingsChanged(Ref ref) {
  ref.read(settingsRevisionProvider.notifier).bump();
}
