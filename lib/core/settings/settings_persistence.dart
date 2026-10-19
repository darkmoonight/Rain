import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/models/db.dart';

/// Applies [mutate] to the shared [Settings] row and persists via repository.
Future<void> persistSettings(
  Ref ref,
  void Function(Settings settings) mutate,
) async {
  final settings = ref.read(settingsProvider);
  mutate(settings);
  await ref.read(settingsRepositoryProvider).save(settings);
}

/// Widget-layer helper mirroring [persistSettings].
extension PersistSettingsOnWidgetRef on WidgetRef {
  Future<void> persistSettings(void Function(Settings settings) mutate) async {
    final settings = read(settingsProvider);
    mutate(settings);
    await read(settingsRepositoryProvider).save(settings);
  }
}
