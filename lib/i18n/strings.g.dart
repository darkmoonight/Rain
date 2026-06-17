/// Generated file. Do not edit.
///
/// Source: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 38
/// Strings: 9652 (254 per locale)
///
/// Built on 2026-06-17 at 18:48 UTC

// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

import 'strings_ar_SA.g.dart' deferred as l_ar_SA;
import 'strings_as_IN.g.dart' deferred as l_as_IN;
import 'strings_bn_IN.g.dart' deferred as l_bn_IN;
import 'strings_cs_CZ.g.dart' deferred as l_cs_CZ;
import 'strings_da_DK.g.dart' deferred as l_da_DK;
import 'strings_de_DE.g.dart' deferred as l_de_DE;
import 'strings_el_GR.g.dart' deferred as l_el_GR;
import 'strings_es_ES.g.dart' deferred as l_es_ES;
import 'strings_fa_IR.g.dart' deferred as l_fa_IR;
import 'strings_fr_FR.g.dart' deferred as l_fr_FR;
import 'strings_ga_IE.g.dart' deferred as l_ga_IE;
import 'strings_gu_IN.g.dart' deferred as l_gu_IN;
import 'strings_he_IL.g.dart' deferred as l_he_IL;
import 'strings_hi_IN.g.dart' deferred as l_hi_IN;
import 'strings_hu_HU.g.dart' deferred as l_hu_HU;
import 'strings_it_IT.g.dart' deferred as l_it_IT;
import 'strings_ja_JP.g.dart' deferred as l_ja_JP;
import 'strings_ka_GE.g.dart' deferred as l_ka_GE;
import 'strings_kn_IN.g.dart' deferred as l_kn_IN;
import 'strings_ko_KR.g.dart' deferred as l_ko_KR;
import 'strings_ml_IN.g.dart' deferred as l_ml_IN;
import 'strings_mr_IN.g.dart' deferred as l_mr_IN;
import 'strings_nl_NL.g.dart' deferred as l_nl_NL;
import 'strings_or_IN.g.dart' deferred as l_or_IN;
import 'strings_pa_IN.g.dart' deferred as l_pa_IN;
import 'strings_pl_PL.g.dart' deferred as l_pl_PL;
import 'strings_pt_BR.g.dart' deferred as l_pt_BR;
import 'strings_pt_PT.g.dart' deferred as l_pt_PT;
import 'strings_ro_RO.g.dart' deferred as l_ro_RO;
import 'strings_ru_RU.g.dart' deferred as l_ru_RU;
import 'strings_sk_SK.g.dart' deferred as l_sk_SK;
import 'strings_ta_IN.g.dart' deferred as l_ta_IN;
import 'strings_te_IN.g.dart' deferred as l_te_IN;
import 'strings_tr_TR.g.dart' deferred as l_tr_TR;
import 'strings_ur_PK.g.dart' deferred as l_ur_PK;
import 'strings_zh_CN.g.dart' deferred as l_zh_CN;
import 'strings_zh_TW.g.dart' deferred as l_zh_TW;
part 'strings_en_US.g.dart';

/// Supported locales.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.enUs) // set locale
/// - Locale locale = AppLocale.enUs.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.enUs) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	enUs(languageCode: 'en', countryCode: 'US'),
	arSa(languageCode: 'ar', countryCode: 'SA'),
	asIn(languageCode: 'as', countryCode: 'IN'),
	bnIn(languageCode: 'bn', countryCode: 'IN'),
	csCz(languageCode: 'cs', countryCode: 'CZ'),
	daDk(languageCode: 'da', countryCode: 'DK'),
	deDe(languageCode: 'de', countryCode: 'DE'),
	elGr(languageCode: 'el', countryCode: 'GR'),
	esEs(languageCode: 'es', countryCode: 'ES'),
	faIr(languageCode: 'fa', countryCode: 'IR'),
	frFr(languageCode: 'fr', countryCode: 'FR'),
	gaIe(languageCode: 'ga', countryCode: 'IE'),
	guIn(languageCode: 'gu', countryCode: 'IN'),
	heIl(languageCode: 'he', countryCode: 'IL'),
	hiIn(languageCode: 'hi', countryCode: 'IN'),
	huHu(languageCode: 'hu', countryCode: 'HU'),
	itIt(languageCode: 'it', countryCode: 'IT'),
	jaJp(languageCode: 'ja', countryCode: 'JP'),
	kaGe(languageCode: 'ka', countryCode: 'GE'),
	knIn(languageCode: 'kn', countryCode: 'IN'),
	koKr(languageCode: 'ko', countryCode: 'KR'),
	mlIn(languageCode: 'ml', countryCode: 'IN'),
	mrIn(languageCode: 'mr', countryCode: 'IN'),
	nlNl(languageCode: 'nl', countryCode: 'NL'),
	orIn(languageCode: 'or', countryCode: 'IN'),
	paIn(languageCode: 'pa', countryCode: 'IN'),
	plPl(languageCode: 'pl', countryCode: 'PL'),
	ptBr(languageCode: 'pt', countryCode: 'BR'),
	ptPt(languageCode: 'pt', countryCode: 'PT'),
	roRo(languageCode: 'ro', countryCode: 'RO'),
	ruRu(languageCode: 'ru', countryCode: 'RU'),
	skSk(languageCode: 'sk', countryCode: 'SK'),
	taIn(languageCode: 'ta', countryCode: 'IN'),
	teIn(languageCode: 'te', countryCode: 'IN'),
	trTr(languageCode: 'tr', countryCode: 'TR'),
	urPk(languageCode: 'ur', countryCode: 'PK'),
	zhCn(languageCode: 'zh', countryCode: 'CN'),
	zhTw(languageCode: 'zh', countryCode: 'TW');

	const AppLocale({
		required this.languageCode,
		this.scriptCode, // ignore: unused_element, unused_element_parameter
		this.countryCode, // ignore: unused_element, unused_element_parameter
	});

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;

	@override
	Future<Translations> build({
		Map<String, Node>? overrides,
		PluralResolver? cardinalResolver,
		PluralResolver? ordinalResolver,
	}) async {
		switch (this) {
			case AppLocale.enUs:
				return TranslationsEnUs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.arSa:
				await l_ar_SA.loadLibrary();
				return l_ar_SA.TranslationsArSa(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.asIn:
				await l_as_IN.loadLibrary();
				return l_as_IN.TranslationsAsIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.bnIn:
				await l_bn_IN.loadLibrary();
				return l_bn_IN.TranslationsBnIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.csCz:
				await l_cs_CZ.loadLibrary();
				return l_cs_CZ.TranslationsCsCz(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.daDk:
				await l_da_DK.loadLibrary();
				return l_da_DK.TranslationsDaDk(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.deDe:
				await l_de_DE.loadLibrary();
				return l_de_DE.TranslationsDeDe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.elGr:
				await l_el_GR.loadLibrary();
				return l_el_GR.TranslationsElGr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.esEs:
				await l_es_ES.loadLibrary();
				return l_es_ES.TranslationsEsEs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.faIr:
				await l_fa_IR.loadLibrary();
				return l_fa_IR.TranslationsFaIr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.frFr:
				await l_fr_FR.loadLibrary();
				return l_fr_FR.TranslationsFrFr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.gaIe:
				await l_ga_IE.loadLibrary();
				return l_ga_IE.TranslationsGaIe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.guIn:
				await l_gu_IN.loadLibrary();
				return l_gu_IN.TranslationsGuIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.heIl:
				await l_he_IL.loadLibrary();
				return l_he_IL.TranslationsHeIl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.hiIn:
				await l_hi_IN.loadLibrary();
				return l_hi_IN.TranslationsHiIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.huHu:
				await l_hu_HU.loadLibrary();
				return l_hu_HU.TranslationsHuHu(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.itIt:
				await l_it_IT.loadLibrary();
				return l_it_IT.TranslationsItIt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.jaJp:
				await l_ja_JP.loadLibrary();
				return l_ja_JP.TranslationsJaJp(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.kaGe:
				await l_ka_GE.loadLibrary();
				return l_ka_GE.TranslationsKaGe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.knIn:
				await l_kn_IN.loadLibrary();
				return l_kn_IN.TranslationsKnIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.koKr:
				await l_ko_KR.loadLibrary();
				return l_ko_KR.TranslationsKoKr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.mlIn:
				await l_ml_IN.loadLibrary();
				return l_ml_IN.TranslationsMlIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.mrIn:
				await l_mr_IN.loadLibrary();
				return l_mr_IN.TranslationsMrIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.nlNl:
				await l_nl_NL.loadLibrary();
				return l_nl_NL.TranslationsNlNl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.orIn:
				await l_or_IN.loadLibrary();
				return l_or_IN.TranslationsOrIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.paIn:
				await l_pa_IN.loadLibrary();
				return l_pa_IN.TranslationsPaIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.plPl:
				await l_pl_PL.loadLibrary();
				return l_pl_PL.TranslationsPlPl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ptBr:
				await l_pt_BR.loadLibrary();
				return l_pt_BR.TranslationsPtBr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ptPt:
				await l_pt_PT.loadLibrary();
				return l_pt_PT.TranslationsPtPt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.roRo:
				await l_ro_RO.loadLibrary();
				return l_ro_RO.TranslationsRoRo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ruRu:
				await l_ru_RU.loadLibrary();
				return l_ru_RU.TranslationsRuRu(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.skSk:
				await l_sk_SK.loadLibrary();
				return l_sk_SK.TranslationsSkSk(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.taIn:
				await l_ta_IN.loadLibrary();
				return l_ta_IN.TranslationsTaIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.teIn:
				await l_te_IN.loadLibrary();
				return l_te_IN.TranslationsTeIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.trTr:
				await l_tr_TR.loadLibrary();
				return l_tr_TR.TranslationsTrTr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.urPk:
				await l_ur_PK.loadLibrary();
				return l_ur_PK.TranslationsUrPk(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zhCn:
				await l_zh_CN.loadLibrary();
				return l_zh_CN.TranslationsZhCn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zhTw:
				await l_zh_TW.loadLibrary();
				return l_zh_TW.TranslationsZhTw(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
		}
	}

	@override
	Translations buildSync({
		Map<String, Node>? overrides,
		PluralResolver? cardinalResolver,
		PluralResolver? ordinalResolver,
	}) {
		switch (this) {
			case AppLocale.enUs:
				return TranslationsEnUs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.arSa:
				return l_ar_SA.TranslationsArSa(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.asIn:
				return l_as_IN.TranslationsAsIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.bnIn:
				return l_bn_IN.TranslationsBnIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.csCz:
				return l_cs_CZ.TranslationsCsCz(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.daDk:
				return l_da_DK.TranslationsDaDk(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.deDe:
				return l_de_DE.TranslationsDeDe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.elGr:
				return l_el_GR.TranslationsElGr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.esEs:
				return l_es_ES.TranslationsEsEs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.faIr:
				return l_fa_IR.TranslationsFaIr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.frFr:
				return l_fr_FR.TranslationsFrFr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.gaIe:
				return l_ga_IE.TranslationsGaIe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.guIn:
				return l_gu_IN.TranslationsGuIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.heIl:
				return l_he_IL.TranslationsHeIl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.hiIn:
				return l_hi_IN.TranslationsHiIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.huHu:
				return l_hu_HU.TranslationsHuHu(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.itIt:
				return l_it_IT.TranslationsItIt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.jaJp:
				return l_ja_JP.TranslationsJaJp(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.kaGe:
				return l_ka_GE.TranslationsKaGe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.knIn:
				return l_kn_IN.TranslationsKnIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.koKr:
				return l_ko_KR.TranslationsKoKr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.mlIn:
				return l_ml_IN.TranslationsMlIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.mrIn:
				return l_mr_IN.TranslationsMrIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.nlNl:
				return l_nl_NL.TranslationsNlNl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.orIn:
				return l_or_IN.TranslationsOrIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.paIn:
				return l_pa_IN.TranslationsPaIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.plPl:
				return l_pl_PL.TranslationsPlPl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ptBr:
				return l_pt_BR.TranslationsPtBr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ptPt:
				return l_pt_PT.TranslationsPtPt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.roRo:
				return l_ro_RO.TranslationsRoRo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ruRu:
				return l_ru_RU.TranslationsRuRu(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.skSk:
				return l_sk_SK.TranslationsSkSk(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.taIn:
				return l_ta_IN.TranslationsTaIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.teIn:
				return l_te_IN.TranslationsTeIn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.trTr:
				return l_tr_TR.TranslationsTrTr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.urPk:
				return l_ur_PK.TranslationsUrPk(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zhCn:
				return l_zh_CN.TranslationsZhCn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zhTw:
				return l_zh_TW.TranslationsZhTw(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
		}
	}

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.getTranslations(this);
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(
		utils: AppLocaleUtils.instance,
		lazy: true,
	);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static Future<AppLocale> setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static Future<AppLocale> setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static Future<AppLocale> useDeviceLocale() => instance.useDeviceLocale();
	static Future<void> setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);

	// synchronous versions
	static AppLocale setLocaleSync(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocaleSync(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRawSync(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRawSync(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocaleSync() => instance.useDeviceLocaleSync();
	static void setPluralResolverSync({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolverSync(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(
		baseLocale: AppLocale.enUs,
		locales: AppLocale.values,
	);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}
