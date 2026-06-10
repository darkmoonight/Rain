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
class TranslationsGaIe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsGaIe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.gaIe,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ga-IE>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsGaIe _root = this; // ignore: unused_field

	@override 
	TranslationsGaIe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsGaIe(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Gan Idirlíon';
	@override String get edit_city_hint => 'Cuir eolas na cathrach in eagar';
	@override String get location_not_found => 'Níorbh fhéidir do shuíomh a chinneadh';
	@override String get mi => 'míle';
	@override String get next => 'Ar Aghaidh';
	@override String get discard => 'Caith';
	@override String get east => 'Thoir';
	@override String get time_end => 'Críoch Am';
	@override String get search_method => 'Úsáid ceangal nó geolocáid';
	@override String get hourly_variables => 'Athrógacha aimsire uaireanta';
	@override String get uv_index => 'Indéacs UV';
	@override String get clear_sky => 'Spéir Ghlán';
	@override String get k_24 => '24-uair';
	@override String get no_weather_card => 'Cuir cathair leis';
	@override String get drizzle => 'Táilliú';
	@override String get humidity => 'Measarthaíocht Géimneachta';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Feidhmeanna';
	@override String get cities => 'Cathracha';
	@override String get southeast => 'Deisceart-Thoir';
	@override String get validate_number => 'Cuir uimhir bailí isteach, le do thoil';
	@override String get city => 'Cathair';
	@override String get uv_high => 'Ard';
	@override String get time => 'Am sa chathair';
	@override String get uv_low => 'Íseal';
	@override String get name3 => 'Déan teagmháil linn';
	@override String get apparent_temperature_min => 'Teocht Shamhlaithe Ísle';
	@override String get direction => 'Treorach';
	@override String get heavy_rains => 'Scáil fearthainne';
	@override String get apparent_temperature_max => 'Teocht Shamhlaithe Uachtarach';
	@override String get k_12 => '12-uair';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'An bhfuil tú cinnte go bhfuil tú ag iarraidh d\'athruithe a chaitheamh?';
	@override String get notifications => 'Fógraí';
	@override String get mph => 'mi/u';
	@override String get west => 'Iarthar';
	@override String get validate90 => 'Caithfidh luach a bheith idir -90 agus 90';
	@override String get name2 => 'Dearadh Éasca';
	@override String get feels => 'Brath';
	@override String get precipitation_probability => 'Ionsaíocht Tuirlingt';
	@override String get license => 'Ceadúnas';
	@override String get widget_background => 'Cúlra an Rón';
	@override String get large_element => 'Taispeáint mór na haimsire';
	@override String get unsaved_changes => 'Athruithe neamhshábháilte';
	@override String get drizzling_rain => 'Táilliú Ag Fuarthainn';
	@override String get cloudy => 'Scamallach';
	@override String get widget => 'Rón';
	@override String get precipitation => 'Tuirlingt';
	@override String get delete => 'Scrios';
	@override String get deleted_cache_store => 'Ag glanadh an taisce';
	@override String get map => 'Léarscáil';
	@override String get description3 => 'Má tá fadhb ar bith agat, déan teagmháil linn trí Ríomhphost nó trí phlé an aip.';
	@override String get north => 'Tuaisceart';
	@override String get measurements => 'Córas Mheáchain';
	@override String get start => 'Tosaigh';
	@override String get settings_full => 'Socruithe';
	@override String get high => 'Ard';
	@override String get daily_variables => 'Athrógacha aimsire laethúla';
	@override String get low => 'Íseal';
	@override String get on_inter => 'Cuir ar Idirlíon chun sonraí aeráide a fháil.';
	@override String get thunderstorm => 'Tornaí';
	@override String get version => 'Leagan Feidhmchláir';
	@override String get project => 'Tionscadal ar siúl';
	@override String get amoled_theme => 'Téama AMOLED';
	@override String get deleted_card_weather_query => 'An bhfuil tú cinnte go bhfuil tú ag iarraidh an chathair a scriosadh?';
	@override String get northeast => 'Tuaisceart-Thoir';
	@override String get add_widget => 'Cuir giuirléid leis';
	@override String get fog => 'Ceo';
	@override String get description2 => 'Tá gach treoir déanta chun éascaíocht agus gniomhachtú a dhéanamh leis an aip chomh héasca agus chomh tapa agus is féidir.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Gan sonraí';
	@override String get search_city => 'Aimsigh do chathair';
	@override String get weather_more => 'Réamhaisnéis Aimsire 12 lá';
	@override String get round_degree => 'Timpeall na Gráid';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Cuardaigh nó cuir sonraí cathrach isteach de láimh';
	@override String get validate_name => 'Cuir ainm isteach, le do thoil';
	@override String get sunrise => 'Éirí na Gréine';
	@override String get km => 'km';
	@override String get district => 'Ceantar';
	@override String get southwest => 'Deisceart-Iarthar';
	@override String get degrees => 'Céim';
	@override String get clear_cache_store => 'Glan taisce';
	@override String get skip => 'Scipeáil';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Amharc';
	@override String get time_start => 'Tús Am';
	@override String get ready => 'Réidh';
	@override String get kph => 'km/u';
	@override String get deleted_cache_store_query => 'An bhfuil tú cinnte gur mian leat an taisce a ghlanadh?';
	@override String get widget_text => 'Téacs an Rón';
	@override String get support => 'Tacaíocht';
	@override String get groups => 'Ár ngrúpaí';
	@override String get system => 'Córas';
	@override String get sunset => 'Dul faoi na Gréine';
	@override String get dewpoint => 'Poinnte Dé';
	@override String get shortwave_radiation => 'Fuinneamh Ghearrfhad';
	@override String get language => 'Teanga';
	@override String get hide_map => 'Folaigh léarscáil';
	@override String get cancel => 'Cealaigh';
	@override String get loading => 'Ag Lódáil...';
	@override String get timeformat => 'Formáid Am';
	@override String get lat => 'Éilt';
	@override String get data => 'Sonraí';
	@override String get visibility => 'Radharc';
	@override String get deleted_card_weather => 'Áireamh cathair á scriosadh';
	@override String get celsius => 'Céim Celsius';
	@override String get no_location => 'Cumasaigh seirbhís na háite chun sonraí aimsire a fháil don áit reatha.';
	@override String get create => 'Cruthaigh';
	@override String get edit => 'Eagar';
	@override String get search => 'Cuardaigh...';
	@override String get uv_extreme => 'Éachtach';
	@override String get light => 'Téama Soiléir';
	@override String get cloudcover => 'Clúdach Scamall';
	@override String get uv_very_high => 'An-Árd';
	@override String get snow => 'Sneachta';
	@override String get done => 'Críochnaithe';
	@override String get theme => 'Téama';
	@override String get name => 'Aimsir';
	@override String get time_range => 'Raon Am (i n-uaireanta)';
	@override String get about_app => 'Faoi an aip';
	@override String get save => 'Sábháil';
	@override String get evaporation => 'Buirtheasaiteacht';
	@override String get freezing_rain => 'Tuirlingt Fuara';
	@override String get uv_average => 'Meánach';
	@override String get reset_color => 'Athshocraigh go réamhshocrú';
	@override String get metric => 'Mheitric';
	@override String get overcast => 'Tromscamallach';
	@override String get pressure => 'Brú';
	@override String get inch => 'úinse';
	@override String get imperial => 'Impireach';
	@override String get location => 'Áit';
	@override String get error_occurred => 'Tharla earráid';
	@override String get validate_value => 'Cuir luach isteach, le do thoil';
	@override String get lon => 'Long';
	@override String get wind => 'Gaoth';
	@override String get normal => 'Gnáth';
	@override String get dark => 'Téama Dorcha';
	@override String get settings => 'Socrú';
	@override String get south => 'Deisceart';
	@override String get windgusts => 'Tonna Gaoithe';
	@override String get northwest => 'Tuaisceart-Iarthar';
	@override String get open_meteo => 'Sonraí ó Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Fearthainn';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Caithfidh luach a bheith idir -180 agus 180';
	@override String get description => 'Aip aimsire le réamhaisnéis láithreach do gach uair, lá, agus seachtain do gach áit.';
	@override String get fahrenheit => 'Céim Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dathanna Dinimiciúla';
	@override String get confirm => 'Sábháil';
	@override String get no_results => 'Gan torthaí';
	@override String get cities_load_error => 'Theip ar lódáil na gcathracha';
	@override String get retry => 'Bain triail as arís';
	@override String get city_not_found => 'Níor aimsíodh an chathair';
	@override String get air_quality => 'Cáilíocht an aeir';
	@override String get aqi_standard => 'Caighdeán AQI';
	@override String get aqi_european => 'AQI Eorpach';
	@override String get aqi_american => 'AQI Meiriceánach';
	@override String get aqi_good => 'Maith';
	@override String get aqi_fair => 'Sásúil';
	@override String get aqi_moderate => 'Measartha';
	@override String get aqi_poor => 'Dona';
	@override String get aqi_very_poor => 'An-dona';
	@override String get aqi_extremely_poor => 'Thar a bheith dona';
	@override String get aqi_unhealthy_sensitive => 'Míshláintiúil do íogaire';
	@override String get aqi_unhealthy => 'Míshláintiúil';
	@override String get aqi_very_unhealthy => 'An-mhíshláintiúil';
	@override String get aqi_hazardous => 'Contúirteach';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Eorpach';
	@override String get american => 'Meiriceánach';
	@override String get aqi_advice_good => 'Aer maith do ghníomhaíochtaí lasmuigh.';
	@override String get aqi_advice_fair => 'Go ginearálta ceart go leor. D\'fhéadfadh daoine íogaire iarracht fhada lasmuigh a theorannú.';
	@override String get aqi_advice_moderate => 'Ba chóir do ghrúpaí íogaire an t-am lasmuigh a laghdú.';
	@override String get aqi_advice_poor => 'Teorannaigh gníomhaíocht lasmuigh, go háirithe má tá tú íogair do thruailliú.';
	@override String get aqi_advice_very_poor => 'Seachain iarracht fhada lasmuigh. D\'fhéadfadh gach duine tionchar sláinte a mhothú.';
	@override String get aqi_advice_extremely_poor => 'Fan istigh más féidir. Ní mholtar gníomhaíocht lasmuigh.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Truailleáin';
}

/// The flat map containing all translations for locale <ga-IE>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsGaIe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Gan Idirlíon',
			'edit_city_hint' => 'Cuir eolas na cathrach in eagar',
			'location_not_found' => 'Níorbh fhéidir do shuíomh a chinneadh',
			'mi' => 'míle',
			'next' => 'Ar Aghaidh',
			'discard' => 'Caith',
			'east' => 'Thoir',
			'time_end' => 'Críoch Am',
			'search_method' => 'Úsáid ceangal nó geolocáid',
			'hourly_variables' => 'Athrógacha aimsire uaireanta',
			'uv_index' => 'Indéacs UV',
			'clear_sky' => 'Spéir Ghlán',
			'k_24' => '24-uair',
			'no_weather_card' => 'Cuir cathair leis',
			'drizzle' => 'Táilliú',
			'humidity' => 'Measarthaíocht Géimneachta',
			'telegram' => 'Telegram',
			'functions' => 'Feidhmeanna',
			'cities' => 'Cathracha',
			'southeast' => 'Deisceart-Thoir',
			'validate_number' => 'Cuir uimhir bailí isteach, le do thoil',
			'city' => 'Cathair',
			'uv_high' => 'Ard',
			'time' => 'Am sa chathair',
			'uv_low' => 'Íseal',
			'name3' => 'Déan teagmháil linn',
			'apparent_temperature_min' => 'Teocht Shamhlaithe Ísle',
			'direction' => 'Treorach',
			'heavy_rains' => 'Scáil fearthainne',
			'apparent_temperature_max' => 'Teocht Shamhlaithe Uachtarach',
			'k_12' => '12-uair',
			'discord' => 'Discord',
			'discard_changes' => 'An bhfuil tú cinnte go bhfuil tú ag iarraidh d\'athruithe a chaitheamh?',
			'notifications' => 'Fógraí',
			'mph' => 'mi/u',
			'west' => 'Iarthar',
			'validate90' => 'Caithfidh luach a bheith idir -90 agus 90',
			'name2' => 'Dearadh Éasca',
			'feels' => 'Brath',
			'precipitation_probability' => 'Ionsaíocht Tuirlingt',
			'license' => 'Ceadúnas',
			'widget_background' => 'Cúlra an Rón',
			'large_element' => 'Taispeáint mór na haimsire',
			'unsaved_changes' => 'Athruithe neamhshábháilte',
			'drizzling_rain' => 'Táilliú Ag Fuarthainn',
			'cloudy' => 'Scamallach',
			'widget' => 'Rón',
			'precipitation' => 'Tuirlingt',
			'delete' => 'Scrios',
			'deleted_cache_store' => 'Ag glanadh an taisce',
			'map' => 'Léarscáil',
			'description3' => 'Má tá fadhb ar bith agat, déan teagmháil linn trí Ríomhphost nó trí phlé an aip.',
			'north' => 'Tuaisceart',
			'measurements' => 'Córas Mheáchain',
			'start' => 'Tosaigh',
			'settings_full' => 'Socruithe',
			'high' => 'Ard',
			'daily_variables' => 'Athrógacha aimsire laethúla',
			'low' => 'Íseal',
			'on_inter' => 'Cuir ar Idirlíon chun sonraí aeráide a fháil.',
			'thunderstorm' => 'Tornaí',
			'version' => 'Leagan Feidhmchláir',
			'project' => 'Tionscadal ar siúl',
			'amoled_theme' => 'Téama AMOLED',
			'deleted_card_weather_query' => 'An bhfuil tú cinnte go bhfuil tú ag iarraidh an chathair a scriosadh?',
			'northeast' => 'Tuaisceart-Thoir',
			'add_widget' => 'Cuir giuirléid leis',
			'fog' => 'Ceo',
			'description2' => 'Tá gach treoir déanta chun éascaíocht agus gniomhachtú a dhéanamh leis an aip chomh héasca agus chomh tapa agus is féidir.',
			'mm' => 'mm',
			'no_desc_data' => 'Gan sonraí',
			'search_city' => 'Aimsigh do chathair',
			'weather_more' => 'Réamhaisnéis Aimsire 12 lá',
			'round_degree' => 'Timpeall na Gráid',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Cuardaigh nó cuir sonraí cathrach isteach de láimh',
			'validate_name' => 'Cuir ainm isteach, le do thoil',
			'sunrise' => 'Éirí na Gréine',
			'km' => 'km',
			'district' => 'Ceantar',
			'southwest' => 'Deisceart-Iarthar',
			'degrees' => 'Céim',
			'clear_cache_store' => 'Glan taisce',
			'skip' => 'Scipeáil',
			'h_pa' => 'hPa',
			'appearance' => 'Amharc',
			'time_start' => 'Tús Am',
			'ready' => 'Réidh',
			'kph' => 'km/u',
			'deleted_cache_store_query' => 'An bhfuil tú cinnte gur mian leat an taisce a ghlanadh?',
			'widget_text' => 'Téacs an Rón',
			'support' => 'Tacaíocht',
			'groups' => 'Ár ngrúpaí',
			'system' => 'Córas',
			'sunset' => 'Dul faoi na Gréine',
			'dewpoint' => 'Poinnte Dé',
			'shortwave_radiation' => 'Fuinneamh Ghearrfhad',
			'language' => 'Teanga',
			'hide_map' => 'Folaigh léarscáil',
			'cancel' => 'Cealaigh',
			'loading' => 'Ag Lódáil...',
			'timeformat' => 'Formáid Am',
			'lat' => 'Éilt',
			'data' => 'Sonraí',
			'visibility' => 'Radharc',
			'deleted_card_weather' => 'Áireamh cathair á scriosadh',
			'celsius' => 'Céim Celsius',
			'no_location' => 'Cumasaigh seirbhís na háite chun sonraí aimsire a fháil don áit reatha.',
			'create' => 'Cruthaigh',
			'edit' => 'Eagar',
			'search' => 'Cuardaigh...',
			'uv_extreme' => 'Éachtach',
			'light' => 'Téama Soiléir',
			'cloudcover' => 'Clúdach Scamall',
			'uv_very_high' => 'An-Árd',
			'snow' => 'Sneachta',
			'done' => 'Críochnaithe',
			'theme' => 'Téama',
			'name' => 'Aimsir',
			'time_range' => 'Raon Am (i n-uaireanta)',
			'about_app' => 'Faoi an aip',
			'save' => 'Sábháil',
			'evaporation' => 'Buirtheasaiteacht',
			'freezing_rain' => 'Tuirlingt Fuara',
			'uv_average' => 'Meánach',
			'reset_color' => 'Athshocraigh go réamhshocrú',
			'metric' => 'Mheitric',
			'overcast' => 'Tromscamallach',
			'pressure' => 'Brú',
			'inch' => 'úinse',
			'imperial' => 'Impireach',
			'location' => 'Áit',
			'error_occurred' => 'Tharla earráid',
			'validate_value' => 'Cuir luach isteach, le do thoil',
			'lon' => 'Long',
			'wind' => 'Gaoth',
			'normal' => 'Gnáth',
			'dark' => 'Téama Dorcha',
			'settings' => 'Socrú',
			'south' => 'Deisceart',
			'windgusts' => 'Tonna Gaoithe',
			'northwest' => 'Tuaisceart-Iarthar',
			'open_meteo' => 'Sonraí ó Open-Meteo (CC-BY 4.0)',
			'rain' => 'Fearthainn',
			'mm_hg' => 'mmHg',
			'validate180' => 'Caithfidh luach a bheith idir -180 agus 180',
			'description' => 'Aip aimsire le réamhaisnéis láithreach do gach uair, lá, agus seachtain do gach áit.',
			'fahrenheit' => 'Céim Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dathanna Dinimiciúla',
			'confirm' => 'Sábháil',
			'no_results' => 'Gan torthaí',
			'cities_load_error' => 'Theip ar lódáil na gcathracha',
			'retry' => 'Bain triail as arís',
			'city_not_found' => 'Níor aimsíodh an chathair',
			'air_quality' => 'Cáilíocht an aeir',
			'aqi_standard' => 'Caighdeán AQI',
			'aqi_european' => 'AQI Eorpach',
			'aqi_american' => 'AQI Meiriceánach',
			'aqi_good' => 'Maith',
			'aqi_fair' => 'Sásúil',
			'aqi_moderate' => 'Measartha',
			'aqi_poor' => 'Dona',
			'aqi_very_poor' => 'An-dona',
			'aqi_extremely_poor' => 'Thar a bheith dona',
			'aqi_unhealthy_sensitive' => 'Míshláintiúil do íogaire',
			'aqi_unhealthy' => 'Míshláintiúil',
			'aqi_very_unhealthy' => 'An-mhíshláintiúil',
			'aqi_hazardous' => 'Contúirteach',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Eorpach',
			'american' => 'Meiriceánach',
			'aqi_advice_good' => 'Aer maith do ghníomhaíochtaí lasmuigh.',
			'aqi_advice_fair' => 'Go ginearálta ceart go leor. D\'fhéadfadh daoine íogaire iarracht fhada lasmuigh a theorannú.',
			'aqi_advice_moderate' => 'Ba chóir do ghrúpaí íogaire an t-am lasmuigh a laghdú.',
			'aqi_advice_poor' => 'Teorannaigh gníomhaíocht lasmuigh, go háirithe má tá tú íogair do thruailliú.',
			'aqi_advice_very_poor' => 'Seachain iarracht fhada lasmuigh. D\'fhéadfadh gach duine tionchar sláinte a mhothú.',
			'aqi_advice_extremely_poor' => 'Fan istigh más féidir. Ní mholtar gníomhaíocht lasmuigh.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Truailleáin',
			_ => null,
		};
	}
}
