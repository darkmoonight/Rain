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
class TranslationsMlIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsMlIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.mlIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ml-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsMlIn _root = this; // ignore: unused_field

	@override 
	TranslationsMlIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsMlIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ഇന്റർനെറ്റ് ഇല്ല';
	@override String get edit_city_hint => 'നഗര വിവരങ്ങൾ എഡിറ്റ് ചെയ്യുക';
	@override String get location_not_found => 'നിങ്ങളുടെ സ്ഥാനം നിർണ്ണയിക്കാൻ കഴിഞ്ഞില്ല';
	@override String get mi => 'മൈൽ';
	@override String get next => 'അടുത്തത്';
	@override String get discard => 'ഉപേക്ഷിക്കുക';
	@override String get east => 'കിഴക്ക്';
	@override String get time_end => 'അവസാന സമയം';
	@override String get search_method => 'തിരയൽ അല്ലെങ്കിൽ ജിയോലൊക്കേഷൻ ഉപയോഗിക്കുക';
	@override String get hourly_variables => 'മണിക്കൂർ തോറുമുള്ള കാലാവസ്ഥാ വേരിയബിളുകൾ';
	@override String get uv_index => 'യുവി സൂചിക';
	@override String get clear_sky => 'തെളിഞ്ഞ ആകാശം';
	@override String get k_24 => '24-മണിക്കൂർ';
	@override String get no_weather_card => 'നഗരം ചേർക്കുക';
	@override String get drizzle => 'ചാറ്റൽമഴ';
	@override String get humidity => 'ആർദ്രത';
	@override String get telegram => 'ടെലിഗ്രാം';
	@override String get functions => 'പ്രവർത്തനങ്ങൾ';
	@override String get cities => 'നഗരങ്ങൾ';
	@override String get southeast => 'തെക്കുകിഴക്ക്';
	@override String get validate_number => 'ദയവായി സാധുവായ നമ്പർ നൽകുക';
	@override String get city => 'നഗരം';
	@override String get uv_high => 'ഉയർന്ന';
	@override String get time => 'നഗരത്തിലെ സമയം';
	@override String get uv_low => 'കുറഞ്ഞ';
	@override String get name3 => 'ഞങ്ങളെ ബന്ധപ്പെടുക';
	@override String get apparent_temperature_min => 'ഏറ്റവും കുറഞ്ഞ പ്രത്യക്ഷ താപനില';
	@override String get direction => 'ദിശ';
	@override String get heavy_rains => 'മഴയുടെ ചാറ്റൽ';
	@override String get apparent_temperature_max => 'ഏറ്റവും കൂടിയ പ്രത്യക്ഷ താപനില';
	@override String get k_12 => '12-മണിക്കൂർ';
	@override String get discord => 'ഡിസ്കോർഡ്';
	@override String get discard_changes => 'നിങ്ങളുടെ മാറ്റങ്ങൾ ഉപേക്ഷിക്കണമെന്ന് ഉറപ്പാണോ?';
	@override String get notifications => 'അറിയിപ്പുകൾ';
	@override String get mph => 'മൈൽ/മണിക്കൂർ';
	@override String get west => 'പടിഞ്ഞാറ്';
	@override String get validate90 => 'മൂല്യം -90 നും 90 നും ഇടയിൽ ആയിരിക്കണം';
	@override String get name2 => 'സൗകര്യപ്രദമായ ഡിസൈൻ';
	@override String get feels => 'അനുഭവപ്പെടുന്നു';
	@override String get precipitation_probability => 'മഴയുടെ സാധ്യത';
	@override String get license => 'ലൈസൻസുകൾ';
	@override String get widget_background => 'വിജറ്റ് പശ്ചാത്തലം';
	@override String get large_element => 'വലിയ കാലാവസ്ഥാ പ്രദർശനം';
	@override String get unsaved_changes => 'സേവ് ചെയ്യാത്ത മാറ്റങ്ങൾ';
	@override String get drizzling_rain => 'തണുത്തുറഞ്ഞ ചാറ്റൽമഴ';
	@override String get cloudy => 'മേഘാവൃതം';
	@override String get widget => 'വിജറ്റ്';
	@override String get precipitation => 'മഴ';
	@override String get delete => 'ഇല്ലാതാക്കുക';
	@override String get deleted_cache_store => 'കാഷെ മായ്ക്കുന്നു';
	@override String get map => 'മാപ്പ്';
	@override String get description3 => 'നിങ്ങൾക്ക് എന്തെങ്കിലും പ്രശ്നങ്ങൾ നേരിട്ടാൽ, ദയവായി ഇമെയിൽ വഴിയോ ആപ്ലിക്കേഷൻ അവലോകനങ്ങളിലോ ഞങ്ങളെ ബന്ധപ്പെടുക.';
	@override String get north => 'വടക്ക്';
	@override String get measurements => 'അളവ് സംവിധാനം';
	@override String get start => 'ആരംഭിക്കുക';
	@override String get settings_full => 'ക്രമീകരണങ്ങൾ';
	@override String get high => 'ഉയർന്ന';
	@override String get daily_variables => 'ദൈനംദിന കാലാവസ്ഥാ വേരിയബിളുകൾ';
	@override String get low => 'കുറഞ്ഞ';
	@override String get on_inter => 'കാലാവസ്ഥാ ഡാറ്റ ലഭിക്കാൻ ഇന്റർനെറ്റ് ഓൺ ചെയ്യുക.';
	@override String get thunderstorm => 'ഇടിമിന്നൽ';
	@override String get version => 'ആപ്ലിക്കേഷൻ പതിപ്പ്';
	@override String get project => 'പ്രോജക്റ്റ് ഓൺ';
	@override String get amoled_theme => 'AMOLED തീം';
	@override String get deleted_card_weather_query => 'നിങ്ങൾക്ക് ശരിക്കും നഗരം ഇല്ലാതാക്കണോ?';
	@override String get northeast => 'വടക്കുകിഴക്ക്';
	@override String get add_widget => 'വിജറ്റ് ചേർക്കുക';
	@override String get fog => 'മൂടൽമഞ്ഞ്';
	@override String get description2 => 'എല്ലാ നാവിഗേഷനും ആപ്ലിക്കേഷനുമായി കഴിയുന്നത്ര സൗകര്യപ്രദമായും വേഗത്തിലും ഇടപെടാൻ രൂപകൽപ്പന ചെയ്തിരിക്കുന്നു.';
	@override String get mm => 'മി.മീ';
	@override String get no_desc_data => 'ഡാറ്റയില്ല';
	@override String get search_city => 'നിങ്ങളുടെ നഗരം കണ്ടെത്തുക';
	@override String get weather_more => '12-ദിവസത്തെ കാലാവസ്ഥാ പ്രവചനം';
	@override String get round_degree => 'റൗണ്ട് ഡിഗ്രി';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'നഗര ഡാറ്റ തിരയുക അല്ലെങ്കിൽ മാനുവലായി നൽകുക';
	@override String get validate_name => 'ദയവായി പേര് നൽകുക';
	@override String get sunrise => 'സൂര്യോദയം';
	@override String get km => 'കി.മീ';
	@override String get district => 'ജില്ല';
	@override String get southwest => 'തെക്കുപടിഞ്ഞാറ്';
	@override String get degrees => 'ഡിഗ്രി';
	@override String get clear_cache_store => 'കാഷെ മായ്ക്കുക';
	@override String get skip => 'ഒഴിവാക്കുക';
	@override String get h_pa => 'ഹെക്ടോപാസ്കൽ';
	@override String get appearance => 'രൂപം';
	@override String get time_start => 'ആരംഭ സമയം';
	@override String get ready => 'തയ്യാർ';
	@override String get kph => 'കി.മീ/മണിക്കൂർ';
	@override String get deleted_cache_store_query => 'നിങ്ങൾക്ക് ശരിക്കും കാഷെ മായ്ക്കണോ?';
	@override String get widget_text => 'വിജറ്റ് ടെക്സ്റ്റ്';
	@override String get support => 'സംഭാവന ചെയ്യുക';
	@override String get groups => 'ഞങ്ങളുടെ ഗ്രൂപ്പുകൾ';
	@override String get system => 'സിസ്റ്റം';
	@override String get sunset => 'സൂര്യാസ്തമയം';
	@override String get dewpoint => 'മഞ്ഞുബിന്ദു';
	@override String get shortwave_radiation => 'ഷോർട്ട്‌വേവ് റേഡിയേഷൻ';
	@override String get language => 'ഭാഷ';
	@override String get hide_map => 'മാപ്പ് മറയ്ക്കുക';
	@override String get cancel => 'റദ്ദാക്കുക';
	@override String get loading => 'ലോഡ് ചെയ്യുന്നു...';
	@override String get timeformat => 'സമയ ഫോർമാറ്റ്';
	@override String get lat => 'അക്ഷാംശം';
	@override String get data => 'ഡാറ്റ';
	@override String get visibility => 'ദൃശ്യപരത';
	@override String get deleted_card_weather => 'നഗരം ഇല്ലാതാക്കുക';
	@override String get celsius => 'സെൽഷ്യസ്';
	@override String get no_location => 'നിലവിലെ സ്ഥാനത്തിനുള്ള കാലാവസ്ഥാ ഡാറ്റ ലഭിക്കാൻ ലൊക്കേഷൻ സേവനം പ്രവർത്തനക്ഷമമാക്കുക.';
	@override String get create => 'സൃഷ്ടിക്കുക';
	@override String get edit => 'എഡിറ്റ് ചെയ്യുക';
	@override String get search => 'തിരയുക...';
	@override String get uv_extreme => 'അത്യധികം';
	@override String get light => 'വെളിച്ചം';
	@override String get cloudcover => 'മേഘാവരണം';
	@override String get uv_very_high => 'വളരെ ഉയർന്ന';
	@override String get snow => 'മഞ്ഞ്';
	@override String get done => 'പൂർത്തിയായി';
	@override String get theme => 'തീം';
	@override String get name => 'കാലാവസ്ഥ';
	@override String get time_range => 'ആവൃത്തി (മണിക്കൂറുകളിൽ)';
	@override String get about_app => 'ആപ്പിനെക്കുറിച്ച്';
	@override String get save => 'സേവ്';
	@override String get evaporation => 'ബാഷ്പീകരണം';
	@override String get freezing_rain => 'തണുത്തുറഞ്ഞ മഴ';
	@override String get uv_average => 'ഇടത്തരം';
	@override String get reset_color => 'ഡിഫോൾട്ടിലേക്ക് പുനഃസജ്ജമാക്കുക';
	@override String get metric => 'മെട്രിക്';
	@override String get overcast => 'മേഘാച്ഛന്നം';
	@override String get pressure => 'മർദ്ദം';
	@override String get inch => 'ഇഞ്ച്';
	@override String get imperial => 'ഇംപീരിയൽ';
	@override String get location => 'സ്ഥാനം';
	@override String get error_occurred => 'ഒരു പിശക് സംഭവിച്ചു';
	@override String get validate_value => 'ദയവായി മൂല്യം നൽകുക';
	@override String get lon => 'രേഖാംശം';
	@override String get wind => 'കാറ്റ്';
	@override String get normal => 'സാധാരണ';
	@override String get dark => 'ഇരുണ്ട';
	@override String get settings => 'ക്രമീകരണങ്ങൾ';
	@override String get south => 'തെക്ക്';
	@override String get windgusts => 'കാറ്റിന്റെ കുത്തൊഴുക്ക്';
	@override String get northwest => 'വടക്കുപടിഞ്ഞാറ്';
	@override String get open_meteo => 'Open-Meteo യിൽ നിന്നുള്ള ഡാറ്റ (CC-BY 4.0)';
	@override String get rain => 'മഴ';
	@override String get mm_hg => 'മി.മീ മെർക്കുറി';
	@override String get validate180 => 'മൂല്യം -180 നും 180 നും ഇടയിൽ ആയിരിക്കണം';
	@override String get description => 'ഏതൊരു സ്ഥലത്തിനും ഓരോ മണിക്കൂറിനും, ദിവസത്തിനും, ആഴ്ചയ്ക്കും അപ്‌ഡേറ്റ് ചെയ്ത പ്രവചനത്തോടുകൂടിയ കാലാവസ്ഥാ ആപ്ലിക്കേഷൻ.';
	@override String get fahrenheit => 'ഫാരൻഹീറ്റ്';
	@override String get m_s => 'മീ/സെ';
	@override String get material_color => 'ഡൈനാമിക് നിറങ്ങൾ';
	@override String get confirm => 'സേവ്';
	@override String get no_results => 'ഫലങ്ങളൊന്നുമില്ല';
	@override String get cities_load_error => 'നഗരങ്ങൾ ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല';
	@override String get retry => 'വീണ്ടും ശ്രമിക്കുക';
	@override String get city_not_found => 'നഗരം കണ്ടെത്തിയില്ല';
}

/// The flat map containing all translations for locale <ml-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsMlIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ഇന്റർനെറ്റ് ഇല്ല',
			'edit_city_hint' => 'നഗര വിവരങ്ങൾ എഡിറ്റ് ചെയ്യുക',
			'location_not_found' => 'നിങ്ങളുടെ സ്ഥാനം നിർണ്ണയിക്കാൻ കഴിഞ്ഞില്ല',
			'mi' => 'മൈൽ',
			'next' => 'അടുത്തത്',
			'discard' => 'ഉപേക്ഷിക്കുക',
			'east' => 'കിഴക്ക്',
			'time_end' => 'അവസാന സമയം',
			'search_method' => 'തിരയൽ അല്ലെങ്കിൽ ജിയോലൊക്കേഷൻ ഉപയോഗിക്കുക',
			'hourly_variables' => 'മണിക്കൂർ തോറുമുള്ള കാലാവസ്ഥാ വേരിയബിളുകൾ',
			'uv_index' => 'യുവി സൂചിക',
			'clear_sky' => 'തെളിഞ്ഞ ആകാശം',
			'k_24' => '24-മണിക്കൂർ',
			'no_weather_card' => 'നഗരം ചേർക്കുക',
			'drizzle' => 'ചാറ്റൽമഴ',
			'humidity' => 'ആർദ്രത',
			'telegram' => 'ടെലിഗ്രാം',
			'functions' => 'പ്രവർത്തനങ്ങൾ',
			'cities' => 'നഗരങ്ങൾ',
			'southeast' => 'തെക്കുകിഴക്ക്',
			'validate_number' => 'ദയവായി സാധുവായ നമ്പർ നൽകുക',
			'city' => 'നഗരം',
			'uv_high' => 'ഉയർന്ന',
			'time' => 'നഗരത്തിലെ സമയം',
			'uv_low' => 'കുറഞ്ഞ',
			'name3' => 'ഞങ്ങളെ ബന്ധപ്പെടുക',
			'apparent_temperature_min' => 'ഏറ്റവും കുറഞ്ഞ പ്രത്യക്ഷ താപനില',
			'direction' => 'ദിശ',
			'heavy_rains' => 'മഴയുടെ ചാറ്റൽ',
			'apparent_temperature_max' => 'ഏറ്റവും കൂടിയ പ്രത്യക്ഷ താപനില',
			'k_12' => '12-മണിക്കൂർ',
			'discord' => 'ഡിസ്കോർഡ്',
			'discard_changes' => 'നിങ്ങളുടെ മാറ്റങ്ങൾ ഉപേക്ഷിക്കണമെന്ന് ഉറപ്പാണോ?',
			'notifications' => 'അറിയിപ്പുകൾ',
			'mph' => 'മൈൽ/മണിക്കൂർ',
			'west' => 'പടിഞ്ഞാറ്',
			'validate90' => 'മൂല്യം -90 നും 90 നും ഇടയിൽ ആയിരിക്കണം',
			'name2' => 'സൗകര്യപ്രദമായ ഡിസൈൻ',
			'feels' => 'അനുഭവപ്പെടുന്നു',
			'precipitation_probability' => 'മഴയുടെ സാധ്യത',
			'license' => 'ലൈസൻസുകൾ',
			'widget_background' => 'വിജറ്റ് പശ്ചാത്തലം',
			'large_element' => 'വലിയ കാലാവസ്ഥാ പ്രദർശനം',
			'unsaved_changes' => 'സേവ് ചെയ്യാത്ത മാറ്റങ്ങൾ',
			'drizzling_rain' => 'തണുത്തുറഞ്ഞ ചാറ്റൽമഴ',
			'cloudy' => 'മേഘാവൃതം',
			'widget' => 'വിജറ്റ്',
			'precipitation' => 'മഴ',
			'delete' => 'ഇല്ലാതാക്കുക',
			'deleted_cache_store' => 'കാഷെ മായ്ക്കുന്നു',
			'map' => 'മാപ്പ്',
			'description3' => 'നിങ്ങൾക്ക് എന്തെങ്കിലും പ്രശ്നങ്ങൾ നേരിട്ടാൽ, ദയവായി ഇമെയിൽ വഴിയോ ആപ്ലിക്കേഷൻ അവലോകനങ്ങളിലോ ഞങ്ങളെ ബന്ധപ്പെടുക.',
			'north' => 'വടക്ക്',
			'measurements' => 'അളവ് സംവിധാനം',
			'start' => 'ആരംഭിക്കുക',
			'settings_full' => 'ക്രമീകരണങ്ങൾ',
			'high' => 'ഉയർന്ന',
			'daily_variables' => 'ദൈനംദിന കാലാവസ്ഥാ വേരിയബിളുകൾ',
			'low' => 'കുറഞ്ഞ',
			'on_inter' => 'കാലാവസ്ഥാ ഡാറ്റ ലഭിക്കാൻ ഇന്റർനെറ്റ് ഓൺ ചെയ്യുക.',
			'thunderstorm' => 'ഇടിമിന്നൽ',
			'version' => 'ആപ്ലിക്കേഷൻ പതിപ്പ്',
			'project' => 'പ്രോജക്റ്റ് ഓൺ',
			'amoled_theme' => 'AMOLED തീം',
			'deleted_card_weather_query' => 'നിങ്ങൾക്ക് ശരിക്കും നഗരം ഇല്ലാതാക്കണോ?',
			'northeast' => 'വടക്കുകിഴക്ക്',
			'add_widget' => 'വിജറ്റ് ചേർക്കുക',
			'fog' => 'മൂടൽമഞ്ഞ്',
			'description2' => 'എല്ലാ നാവിഗേഷനും ആപ്ലിക്കേഷനുമായി കഴിയുന്നത്ര സൗകര്യപ്രദമായും വേഗത്തിലും ഇടപെടാൻ രൂപകൽപ്പന ചെയ്തിരിക്കുന്നു.',
			'mm' => 'മി.മീ',
			'no_desc_data' => 'ഡാറ്റയില്ല',
			'search_city' => 'നിങ്ങളുടെ നഗരം കണ്ടെത്തുക',
			'weather_more' => '12-ദിവസത്തെ കാലാവസ്ഥാ പ്രവചനം',
			'round_degree' => 'റൗണ്ട് ഡിഗ്രി',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'നഗര ഡാറ്റ തിരയുക അല്ലെങ്കിൽ മാനുവലായി നൽകുക',
			'validate_name' => 'ദയവായി പേര് നൽകുക',
			'sunrise' => 'സൂര്യോദയം',
			'km' => 'കി.മീ',
			'district' => 'ജില്ല',
			'southwest' => 'തെക്കുപടിഞ്ഞാറ്',
			'degrees' => 'ഡിഗ്രി',
			'clear_cache_store' => 'കാഷെ മായ്ക്കുക',
			'skip' => 'ഒഴിവാക്കുക',
			'h_pa' => 'ഹെക്ടോപാസ്കൽ',
			'appearance' => 'രൂപം',
			'time_start' => 'ആരംഭ സമയം',
			'ready' => 'തയ്യാർ',
			'kph' => 'കി.മീ/മണിക്കൂർ',
			'deleted_cache_store_query' => 'നിങ്ങൾക്ക് ശരിക്കും കാഷെ മായ്ക്കണോ?',
			'widget_text' => 'വിജറ്റ് ടെക്സ്റ്റ്',
			'support' => 'സംഭാവന ചെയ്യുക',
			'groups' => 'ഞങ്ങളുടെ ഗ്രൂപ്പുകൾ',
			'system' => 'സിസ്റ്റം',
			'sunset' => 'സൂര്യാസ്തമയം',
			'dewpoint' => 'മഞ്ഞുബിന്ദു',
			'shortwave_radiation' => 'ഷോർട്ട്‌വേവ് റേഡിയേഷൻ',
			'language' => 'ഭാഷ',
			'hide_map' => 'മാപ്പ് മറയ്ക്കുക',
			'cancel' => 'റദ്ദാക്കുക',
			'loading' => 'ലോഡ് ചെയ്യുന്നു...',
			'timeformat' => 'സമയ ഫോർമാറ്റ്',
			'lat' => 'അക്ഷാംശം',
			'data' => 'ഡാറ്റ',
			'visibility' => 'ദൃശ്യപരത',
			'deleted_card_weather' => 'നഗരം ഇല്ലാതാക്കുക',
			'celsius' => 'സെൽഷ്യസ്',
			'no_location' => 'നിലവിലെ സ്ഥാനത്തിനുള്ള കാലാവസ്ഥാ ഡാറ്റ ലഭിക്കാൻ ലൊക്കേഷൻ സേവനം പ്രവർത്തനക്ഷമമാക്കുക.',
			'create' => 'സൃഷ്ടിക്കുക',
			'edit' => 'എഡിറ്റ് ചെയ്യുക',
			'search' => 'തിരയുക...',
			'uv_extreme' => 'അത്യധികം',
			'light' => 'വെളിച്ചം',
			'cloudcover' => 'മേഘാവരണം',
			'uv_very_high' => 'വളരെ ഉയർന്ന',
			'snow' => 'മഞ്ഞ്',
			'done' => 'പൂർത്തിയായി',
			'theme' => 'തീം',
			'name' => 'കാലാവസ്ഥ',
			'time_range' => 'ആവൃത്തി (മണിക്കൂറുകളിൽ)',
			'about_app' => 'ആപ്പിനെക്കുറിച്ച്',
			'save' => 'സേവ്',
			'evaporation' => 'ബാഷ്പീകരണം',
			'freezing_rain' => 'തണുത്തുറഞ്ഞ മഴ',
			'uv_average' => 'ഇടത്തരം',
			'reset_color' => 'ഡിഫോൾട്ടിലേക്ക് പുനഃസജ്ജമാക്കുക',
			'metric' => 'മെട്രിക്',
			'overcast' => 'മേഘാച്ഛന്നം',
			'pressure' => 'മർദ്ദം',
			'inch' => 'ഇഞ്ച്',
			'imperial' => 'ഇംപീരിയൽ',
			'location' => 'സ്ഥാനം',
			'error_occurred' => 'ഒരു പിശക് സംഭവിച്ചു',
			'validate_value' => 'ദയവായി മൂല്യം നൽകുക',
			'lon' => 'രേഖാംശം',
			'wind' => 'കാറ്റ്',
			'normal' => 'സാധാരണ',
			'dark' => 'ഇരുണ്ട',
			'settings' => 'ക്രമീകരണങ്ങൾ',
			'south' => 'തെക്ക്',
			'windgusts' => 'കാറ്റിന്റെ കുത്തൊഴുക്ക്',
			'northwest' => 'വടക്കുപടിഞ്ഞാറ്',
			'open_meteo' => 'Open-Meteo യിൽ നിന്നുള്ള ഡാറ്റ (CC-BY 4.0)',
			'rain' => 'മഴ',
			'mm_hg' => 'മി.മീ മെർക്കുറി',
			'validate180' => 'മൂല്യം -180 നും 180 നും ഇടയിൽ ആയിരിക്കണം',
			'description' => 'ഏതൊരു സ്ഥലത്തിനും ഓരോ മണിക്കൂറിനും, ദിവസത്തിനും, ആഴ്ചയ്ക്കും അപ്‌ഡേറ്റ് ചെയ്ത പ്രവചനത്തോടുകൂടിയ കാലാവസ്ഥാ ആപ്ലിക്കേഷൻ.',
			'fahrenheit' => 'ഫാരൻഹീറ്റ്',
			'm_s' => 'മീ/സെ',
			'material_color' => 'ഡൈനാമിക് നിറങ്ങൾ',
			'confirm' => 'സേവ്',
			'no_results' => 'ഫലങ്ങളൊന്നുമില്ല',
			'cities_load_error' => 'നഗരങ്ങൾ ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല',
			'retry' => 'വീണ്ടും ശ്രമിക്കുക',
			'city_not_found' => 'നഗരം കണ്ടെത്തിയില്ല',
			_ => null,
		};
	}
}
