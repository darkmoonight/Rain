import 'package:flutter/material.dart';
import 'package:rain/i18n/strings.g.dart';

/// Parses a stored language code (e.g. `en_US`) into an [AppLocale].
AppLocale appLocaleFromLanguageCode(String? language) {
  if (language == null || language.isEmpty) return AppLocale.enUs;
  return AppLocaleUtils.parse(language.replaceAll('_', '-'));
}

/// Converts a Flutter [Locale] into the closest supported [AppLocale].
AppLocale appLocaleFromFlutterLocale(Locale locale) {
  final country = locale.countryCode;
  if (country != null && country.isNotEmpty) {
    return AppLocaleUtils.parse('${locale.languageCode}-$country');
  }
  return AppLocaleUtils.parse(locale.languageCode);
}

/// Serializes [locale] to `language_COUNTRY`, or language code alone when no country is set.
String languageCodeFromAppLocale(AppLocale locale) {
  final c = locale.countryCode;
  if (c == null || c.isEmpty) return locale.languageCode;
  return '${locale.languageCode}_${c.toUpperCase()}';
}
