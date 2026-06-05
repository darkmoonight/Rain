///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsCsCz extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCsCz({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.csCz,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <cs-CZ>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsCsCz _root = this; // ignore: unused_field

	@override 
	TranslationsCsCz $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCsCz(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Žádný internet';
	@override String get edit_city_hint => 'Upravit informace o městě';
	@override String get location_not_found => 'Nepodařilo se určit vaši polohu';
	@override String get mi => 'mi';
	@override String get next => 'Další';
	@override String get discard => 'Zahodit';
	@override String get east => 'Východ';
	@override String get time_end => 'Čas ukončení';
	@override String get search_method => 'Použijte hledání nebo geolokaci';
	@override String get hourly_variables => 'Hodinové meteorologické proměnné';
	@override String get uv_index => 'UV-index';
	@override String get clear_sky => 'Jasno';
	@override String get k_24 => '24-hodinový';
	@override String get no_weather_card => 'Přidat město';
	@override String get drizzle => 'Mrholení';
	@override String get humidity => 'Vlhkost';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funkce';
	@override String get cities => 'Města';
	@override String get southeast => 'Juhovýchod';
	@override String get validate_number => 'Zadejte platné číslo';
	@override String get city => 'Místo';
	@override String get uv_high => 'Vysoký';
	@override String get time => 'Čas ve městě';
	@override String get uv_low => 'Nízký';
	@override String get name3 => 'Kontaktujte nás';
	@override String get apparent_temperature_min => 'Minimální pocitová teplota';
	@override String get direction => 'Směr';
	@override String get heavy_rains => 'Přeháňky';
	@override String get apparent_temperature_max => 'Maximální pocitová teplota';
	@override String get k_12 => '12-hodinový';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Opravdu chcete zahodit své změny?';
	@override String get notifications => 'Notifikace';
	@override String get mph => 'mph';
	@override String get west => 'Západ';
	@override String get validate90 => 'Hodnota musí být mezi -90 a 90';
	@override String get name2 => 'Pohodlný design';
	@override String get feels => 'Pocitová teplota';
	@override String get precipitation_probability => 'Pravděpodobnost srážek';
	@override String get license => 'Licence';
	@override String get widget_background => 'Pozadí widgetu';
	@override String get large_element => 'Velké zobrazení počasí';
	@override String get unsaved_changes => 'Neuložené změny';
	@override String get drizzling_rain => 'Mrznúce mrholení';
	@override String get cloudy => 'Oblačno';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Srážky';
	@override String get delete => 'Odstranit';
	@override String get deleted_cache_store => 'Čištění mezipaměti';
	@override String get map => 'Mapa';
	@override String get description3 => 'Pokud narazíte na nějaké potíže, kontaktujte nás prosím e-mailem nebo v recenzích aplikace.';
	@override String get north => 'Sever';
	@override String get measurements => 'Jednotky měření';
	@override String get start => 'Začít';
	@override String get settings_full => 'Nastavení';
	@override String get high => 'Vysoký';
	@override String get daily_variables => 'Denní meteorologické proměnné';
	@override String get low => 'Nízký';
	@override String get on_inter => 'Připojte se k internetu a získejte meteorologické údaje.';
	@override String get thunderstorm => 'Bouřka';
	@override String get version => 'Verzia aplikace';
	@override String get project => 'Projekt na';
	@override String get amoled_theme => 'AMOLED-téma';
	@override String get deleted_card_weather_query => 'Opravdu chcete odstranit město?';
	@override String get northeast => 'Severo-Východ';
	@override String get add_widget => 'Přidat widget';
	@override String get fog => 'Mlha';
	@override String get description2 => 'Celá navigace je navržena tak, aby bylo možné s aplikací co nejpohodlněji a nejrychleji interagovat.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Žádná data';
	@override String get search_city => 'Najděte své místo';
	@override String get weather_more => 'Předpověď počasí na 12 dní';
	@override String get round_degree => 'Zaokrouhlit stupně';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'Vyhledejte nebo zadejte údaje o městě ručně';
	@override String get validate_name => 'Prosím zadejte název';
	@override String get sunrise => 'Východ slunce';
	@override String get km => 'km';
	@override String get district => 'Okres';
	@override String get southwest => 'Juhozápad';
	@override String get degrees => 'Stupně';
	@override String get clear_cache_store => 'Vymazat mezipaměť';
	@override String get skip => 'Přeskočit';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Vzhled';
	@override String get time_start => 'Čas začátku';
	@override String get ready => 'Připraveno';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Opravdu chcete vymazat mezipaměť?';
	@override String get widget_text => 'Text widgetu';
	@override String get support => 'Podpora';
	@override String get groups => 'Naše skupiny';
	@override String get system => 'Systém';
	@override String get sunset => 'Západ slunce';
	@override String get dewpoint => 'Rosný bod';
	@override String get shortwave_radiation => 'Krátká vlnová radiace';
	@override String get language => 'Jazyk';
	@override String get hide_map => 'Skrýt mapu';
	@override String get cancel => 'Zrušit';
	@override String get loading => 'Načítá se...';
	@override String get timeformat => 'Formát času';
	@override String get lat => 'Zeměpisná šířka';
	@override String get data => 'Data';
	@override String get visibility => 'Viditelnost';
	@override String get deleted_card_weather => 'Vymazat město';
	@override String get celsius => 'Celzius';
	@override String get no_location => 'Chcete-li získat údaje o počasí pro aktuální polohu, povolte službu určování polohy.';
	@override String get create => 'Vytvořit';
	@override String get edit => 'Upravit';
	@override String get search => 'Hledat...';
	@override String get uv_extreme => 'Extrémní';
	@override String get light => 'Světlá';
	@override String get cloudcover => 'Oblačnost';
	@override String get uv_very_high => 'Velmi vysoký';
	@override String get snow => 'Sníh';
	@override String get done => 'Hotovo';
	@override String get theme => 'Téma';
	@override String get name => 'Počasí';
	@override String get time_range => 'Frekvence (v hodinách)';
	@override String get about_app => 'O aplikaci';
	@override String get save => 'Uložit';
	@override String get evaporation => 'Evapotranspirace';
	@override String get freezing_rain => 'Mrazivý déšť';
	@override String get uv_average => 'Mírný';
	@override String get reset_color => 'Obnovit výchozí';
	@override String get metric => 'Metrické';
	@override String get overcast => 'Zataženo';
	@override String get pressure => 'Tlak';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperiální';
	@override String get location => 'Poloha';
	@override String get error_occurred => 'Došlo k chybě';
	@override String get validate_value => 'Zadejte hodnotu';
	@override String get lon => 'Zemepisná délka';
	@override String get wind => 'Vítr';
	@override String get normal => 'Normální';
	@override String get dark => 'Tmavá';
	@override String get settings => 'Nast.';
	@override String get south => 'Juž';
	@override String get windgusts => 'Nárazy větru';
	@override String get northwest => 'Severo-Západ';
	@override String get open_meteo => 'Data z Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Déšť';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Hodnota musí být mezi -180 a 180';
	@override String get description => 'Aplikace počasí s aktuálním předpovědí na každou hodinu, den a týden pro libovolné místo.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dynamické Barvy';
	@override String get confirm => 'Uložit';
	@override String get no_results => 'Žádné výsledky';
	@override String get cities_load_error => 'Nepodařilo se načíst města';
	@override String get retry => 'Zkusit znovu';
}

/// The flat map containing all translations for locale <cs-CZ>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsCsCz {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Žádný internet',
			'edit_city_hint' => 'Upravit informace o městě',
			'location_not_found' => 'Nepodařilo se určit vaši polohu',
			'mi' => 'mi',
			'next' => 'Další',
			'discard' => 'Zahodit',
			'east' => 'Východ',
			'time_end' => 'Čas ukončení',
			'search_method' => 'Použijte hledání nebo geolokaci',
			'hourly_variables' => 'Hodinové meteorologické proměnné',
			'uv_index' => 'UV-index',
			'clear_sky' => 'Jasno',
			'k_24' => '24-hodinový',
			'no_weather_card' => 'Přidat město',
			'drizzle' => 'Mrholení',
			'humidity' => 'Vlhkost',
			'telegram' => 'Telegram',
			'functions' => 'Funkce',
			'cities' => 'Města',
			'southeast' => 'Juhovýchod',
			'validate_number' => 'Zadejte platné číslo',
			'city' => 'Místo',
			'uv_high' => 'Vysoký',
			'time' => 'Čas ve městě',
			'uv_low' => 'Nízký',
			'name3' => 'Kontaktujte nás',
			'apparent_temperature_min' => 'Minimální pocitová teplota',
			'direction' => 'Směr',
			'heavy_rains' => 'Přeháňky',
			'apparent_temperature_max' => 'Maximální pocitová teplota',
			'k_12' => '12-hodinový',
			'discord' => 'Discord',
			'discard_changes' => 'Opravdu chcete zahodit své změny?',
			'notifications' => 'Notifikace',
			'mph' => 'mph',
			'west' => 'Západ',
			'validate90' => 'Hodnota musí být mezi -90 a 90',
			'name2' => 'Pohodlný design',
			'feels' => 'Pocitová teplota',
			'precipitation_probability' => 'Pravděpodobnost srážek',
			'license' => 'Licence',
			'widget_background' => 'Pozadí widgetu',
			'large_element' => 'Velké zobrazení počasí',
			'unsaved_changes' => 'Neuložené změny',
			'drizzling_rain' => 'Mrznúce mrholení',
			'cloudy' => 'Oblačno',
			'widget' => 'Widget',
			'precipitation' => 'Srážky',
			'delete' => 'Odstranit',
			'deleted_cache_store' => 'Čištění mezipaměti',
			'map' => 'Mapa',
			'description3' => 'Pokud narazíte na nějaké potíže, kontaktujte nás prosím e-mailem nebo v recenzích aplikace.',
			'north' => 'Sever',
			'measurements' => 'Jednotky měření',
			'start' => 'Začít',
			'settings_full' => 'Nastavení',
			'high' => 'Vysoký',
			'daily_variables' => 'Denní meteorologické proměnné',
			'low' => 'Nízký',
			'on_inter' => 'Připojte se k internetu a získejte meteorologické údaje.',
			'thunderstorm' => 'Bouřka',
			'version' => 'Verzia aplikace',
			'project' => 'Projekt na',
			'amoled_theme' => 'AMOLED-téma',
			'deleted_card_weather_query' => 'Opravdu chcete odstranit město?',
			'northeast' => 'Severo-Východ',
			'add_widget' => 'Přidat widget',
			'fog' => 'Mlha',
			'description2' => 'Celá navigace je navržena tak, aby bylo možné s aplikací co nejpohodlněji a nejrychleji interagovat.',
			'mm' => 'mm',
			'no_desc_data' => 'Žádná data',
			'search_city' => 'Najděte své místo',
			'weather_more' => 'Předpověď počasí na 12 dní',
			'round_degree' => 'Zaokrouhlit stupně',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'Vyhledejte nebo zadejte údaje o městě ručně',
			'validate_name' => 'Prosím zadejte název',
			'sunrise' => 'Východ slunce',
			'km' => 'km',
			'district' => 'Okres',
			'southwest' => 'Juhozápad',
			'degrees' => 'Stupně',
			'clear_cache_store' => 'Vymazat mezipaměť',
			'skip' => 'Přeskočit',
			'h_pa' => 'hPa',
			'appearance' => 'Vzhled',
			'time_start' => 'Čas začátku',
			'ready' => 'Připraveno',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Opravdu chcete vymazat mezipaměť?',
			'widget_text' => 'Text widgetu',
			'support' => 'Podpora',
			'groups' => 'Naše skupiny',
			'system' => 'Systém',
			'sunset' => 'Západ slunce',
			'dewpoint' => 'Rosný bod',
			'shortwave_radiation' => 'Krátká vlnová radiace',
			'language' => 'Jazyk',
			'hide_map' => 'Skrýt mapu',
			'cancel' => 'Zrušit',
			'loading' => 'Načítá se...',
			'timeformat' => 'Formát času',
			'lat' => 'Zeměpisná šířka',
			'data' => 'Data',
			'visibility' => 'Viditelnost',
			'deleted_card_weather' => 'Vymazat město',
			'celsius' => 'Celzius',
			'no_location' => 'Chcete-li získat údaje o počasí pro aktuální polohu, povolte službu určování polohy.',
			'create' => 'Vytvořit',
			'edit' => 'Upravit',
			'search' => 'Hledat...',
			'uv_extreme' => 'Extrémní',
			'light' => 'Světlá',
			'cloudcover' => 'Oblačnost',
			'uv_very_high' => 'Velmi vysoký',
			'snow' => 'Sníh',
			'done' => 'Hotovo',
			'theme' => 'Téma',
			'name' => 'Počasí',
			'time_range' => 'Frekvence (v hodinách)',
			'about_app' => 'O aplikaci',
			'save' => 'Uložit',
			'evaporation' => 'Evapotranspirace',
			'freezing_rain' => 'Mrazivý déšť',
			'uv_average' => 'Mírný',
			'reset_color' => 'Obnovit výchozí',
			'metric' => 'Metrické',
			'overcast' => 'Zataženo',
			'pressure' => 'Tlak',
			'inch' => 'inch',
			'imperial' => 'Imperiální',
			'location' => 'Poloha',
			'error_occurred' => 'Došlo k chybě',
			'validate_value' => 'Zadejte hodnotu',
			'lon' => 'Zemepisná délka',
			'wind' => 'Vítr',
			'normal' => 'Normální',
			'dark' => 'Tmavá',
			'settings' => 'Nast.',
			'south' => 'Juž',
			'windgusts' => 'Nárazy větru',
			'northwest' => 'Severo-Západ',
			'open_meteo' => 'Data z Open-Meteo (CC-BY 4.0)',
			'rain' => 'Déšť',
			'mm_hg' => 'mmHg',
			'validate180' => 'Hodnota musí být mezi -180 a 180',
			'description' => 'Aplikace počasí s aktuálním předpovědí na každou hodinu, den a týden pro libovolné místo.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dynamické Barvy',
			'confirm' => 'Uložit',
			'no_results' => 'Žádné výsledky',
			'cities_load_error' => 'Nepodařilo se načíst města',
			'retry' => 'Zkusit znovu',
			_ => null,
		};
	}
}
