import 'package:flutter/material.dart';
import 'package:rain/i18n/strings.g.dart';

AppLocale appLocaleFromLanguageCode(String? language) {
  if (language == null || language.isEmpty) return AppLocale.enUs;
  return AppLocaleUtils.parse(language.replaceAll('_', '-'));
}

AppLocale appLocaleFromFlutterLocale(Locale locale) {
  final country = locale.countryCode;
  if (country != null && country.isNotEmpty) {
    return AppLocaleUtils.parse('${locale.languageCode}-$country');
  }
  return AppLocaleUtils.parse(locale.languageCode);
}

String languageCodeFromAppLocale(AppLocale locale) {
  final c = locale.countryCode;
  if (c == null || c.isEmpty) return locale.languageCode;
  return '${locale.languageCode}_${c.toUpperCase()}';
}
