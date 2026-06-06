import 'package:flutter/material.dart';
import 'package:rain/i18n/strings.g.dart';

/// App group identifier shared with home-screen widgets.
const String appGroupId = 'DARK NIGHT';

/// A supported UI language with its display name and Flutter locale.
class LanguageOption {
  const LanguageOption({required this.name, required this.locale});

  final String name;
  final Locale locale;
}

// Languages
const _languageEntries = <(AppLocale, String)>[
  (AppLocale.bnIn, 'বাংলা'),
  (AppLocale.arSa, 'العربية'),
  (AppLocale.asIn, 'অসমীয়া'),
  (AppLocale.csCz, 'Čeština'),
  (AppLocale.daDk, 'Dansk'),
  (AppLocale.deDe, 'Deutsch'),
  (AppLocale.elGr, 'Ελληνικά'),
  (AppLocale.enUs, 'English'),
  (AppLocale.esEs, 'Español'),
  (AppLocale.frFr, 'Français'),
  (AppLocale.gaIe, 'Gaeilge'),
  (AppLocale.guIn, 'ગુજરાતી'),
  (AppLocale.hiIn, 'हिन्दी'),
  (AppLocale.heIl, 'עברית'),
  (AppLocale.huHu, 'Magyar'),
  (AppLocale.itIt, 'Italiano'),
  (AppLocale.jaJp, '日本語'),
  (AppLocale.knIn, 'ಕನ್ನಡ'),
  (AppLocale.kaGe, 'ქართული'),
  (AppLocale.koKr, '한국어'),
  (AppLocale.mlIn, 'മലയാളം'),
  (AppLocale.mrIn, 'मराठी'),
  (AppLocale.faIr, 'فارسی'),
  (AppLocale.paIn, 'ਪੰਜਾਬੀ'),
  (AppLocale.nlNl, 'Nederlands'),
  (AppLocale.orIn, 'ଓଡ଼ିଆ'),
  (AppLocale.plPl, 'Polski'),
  (AppLocale.ptPt, 'Português'),
  (AppLocale.ptBr, 'Português (Brasil)'),
  (AppLocale.roRo, 'Română'),
  (AppLocale.ruRu, 'Русский'),
  (AppLocale.skSk, 'Slovenčina'),
  (AppLocale.taIn, 'தமிழ்'),
  (AppLocale.teIn, 'తెలుగు'),
  (AppLocale.trTr, 'Türkçe'),
  (AppLocale.urPk, 'اردو'),
  (AppLocale.zhCn, '中文(简体)'),
  (AppLocale.zhTw, '中文(繁體)'),
];

/// All languages offered in settings, in display order.
final List<LanguageOption> appLanguages = [
  for (final (locale, name) in _languageEntries)
    LanguageOption(name: name, locale: locale.flutterLocale),
];

/// Fallback language used when English is unavailable.
final LanguageOption defaultLanguageOption = appLanguages.firstWhere(
  (l) => l.locale.languageCode == 'en',
  orElse: () => appLanguages.first,
);
