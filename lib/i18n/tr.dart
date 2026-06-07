import 'package:rain/i18n/strings.g.dart';

export 'strings.g.dart';

/// Looks up a translation by legacy camelCase or snake_case [key].
String trDynamic(String key) {
  final slangKey = _toSlangKey(key);
  final translations = LocaleSettings.instance.currentTranslations;
  final value = translations[slangKey] ?? translations[key];
  return value?.toString() ?? key;
}

/// Adds `.tr` for dynamic string-key lookups outside generated getters.
extension Tr on String {
  /// Resolves this string as a dynamic translation key.
  String get tr => trDynamic(this);
}

const _specialKeys = <String, String>{
  '12': 'k_12',
  '24': 'k_24',
  'W/m2': 'w_m2',
  'm/s': 'm_s',
};

/// Normalizes legacy keys to snake_case slang map keys, passing through existing snake_case keys.
String _toSlangKey(String key) {
  final special = _specialKeys[key];
  if (special != null) return special;
  if (key.contains('_') || !RegExp(r'[A-Z]').hasMatch(key)) return key;
  return key
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      )
      .replaceFirst(RegExp(r'^_'), '');
}
