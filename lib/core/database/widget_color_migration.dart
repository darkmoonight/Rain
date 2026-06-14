import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

/// Copies legacy single-theme widget colors into light/dark fields when needed.
///
/// Returns `true` when [settings] was modified and persisted.
Future<bool> migrateWidgetThemeColorsIfNeeded(
  Isar isar,
  Settings settings,
) async {
  var changed = false;

  final legacyBackground = settings.widgetBackgroundColor;
  if (legacyBackground != null && legacyBackground.isNotEmpty) {
    settings.widgetBackgroundColorLight ??= legacyBackground;
    settings.widgetBackgroundColorDark ??= legacyBackground;
    settings.widgetBackgroundColor = null;
    changed = true;
  }

  final legacyText = settings.widgetTextColor;
  if (legacyText != null && legacyText.isNotEmpty) {
    settings.widgetTextColorLight ??= legacyText;
    settings.widgetTextColorDark ??= legacyText;
    settings.widgetTextColor = null;
    changed = true;
  }

  if (!changed) return false;

  await isar.writeTxn(() => isar.settings.put(settings));
  return true;
}
