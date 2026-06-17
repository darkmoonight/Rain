import 'package:rain/core/utils/string_utils.dart';
import 'package:rain/i18n/tr.dart';

/// Helpers for persisted string-id settings pickers (font, icon theme, etc.).
class SettingsCatalog {
  SettingsCatalog._();

  /// Returns [id] when present in [choices], otherwise [defaultId].
  static String resolve(String? id, List<String> choices, String defaultId) {
    return id != null && choices.contains(id) ? id : defaultId;
  }

  /// Builds a slang key from [prefix] and camelCase [id] (e.g. `font` + `ubuntu`).
  static String labelKey(String prefix, String id) =>
      '$prefix${capitalizeFirst(id)}';

  /// Localized picker label for [id] under [prefix].
  static String label(
    String id,
    List<String> choices,
    String defaultId,
    String prefix,
  ) =>
      labelKey(prefix, resolve(id, choices, defaultId)).tr;
}
