import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/domain/entities/app_settings.dart';

/// Applies [update] to domain settings and persists via the settings repository.
Future<void> persistSettings(
  Ref ref,
  AppSettings Function(AppSettings settings) update,
) async {
  final isarSettings = ref.read(bootstrapProvider).settings;
  final updated = update(DomainMapper.settingsToDomain(isarSettings));
  DomainMapper.applySettingsToIsar(updated, isarSettings);
  await ref.read(settingsRepositoryProvider).save(updated);
}

/// Widget-layer helper mirroring [persistSettings].
extension PersistSettingsOnWidgetRef on WidgetRef {
  Future<void> persistSettings(
    AppSettings Function(AppSettings settings) update,
  ) async {
    final isarSettings = read(bootstrapProvider).settings;
    final updated = update(DomainMapper.settingsToDomain(isarSettings));
    DomainMapper.applySettingsToIsar(updated, isarSettings);
    await read(settingsRepositoryProvider).save(updated);
  }
}
