import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/repositories/settings_repository.dart';

/// Persists HTTP clock skew when it differs from stored settings.
Future<void> persistClockSkew(Ref ref, int skew) async {
  final settings = ref.read(settingsProvider);
  await ref.read(settingsRepositoryProvider).persistClockSkew(settings, skew);
}

/// Persists clock skew from a background isolate without Riverpod.
Future<void> persistClockSkewInIsar(Isar isar, int skew) async {
  final settings = await isar.settings.where().findFirst() ?? Settings();
  await SettingsRepository(isar).persistClockSkew(settings, skew);
}
