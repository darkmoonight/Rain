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
class TranslationsTeIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTeIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.teIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <te-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTeIn _root = this; // ignore: unused_field

	@override 
	TranslationsTeIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTeIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ఇంటర్నెట్ లేదు';
	@override String get edit_city_hint => 'నగర సమాచారాన్ని సవరించండి';
	@override String get location_not_found => 'మీ స్థానాన్ని నిర్ధారించలేకపోయాము';
	@override String get mi => 'మైలు';
	@override String get next => 'తదుపరి';
	@override String get discard => 'విస్మరించు';
	@override String get east => 'తూర్పు';
	@override String get time_end => 'ముగింపు సమయం';
	@override String get search_method => 'వెతకడం లేదా జియోలొకేషన్ ఉపయోగించండి';
	@override String get hourly_variables => 'గంటవారీ వాతావరణ వేరియబుల్స్';
	@override String get uv_index => 'UV సూచిక';
	@override String get clear_sky => 'స్పష్టమైన ఆకాశం';
	@override String get k_24 => '24-గంట';
	@override String get no_weather_card => 'నగరాన్ని జోడించండి';
	@override String get drizzle => 'చినుకులు';
	@override String get humidity => 'తేమ';
	@override String get telegram => 'టెలిగ్రామ్';
	@override String get functions => 'ఫంక్షన్లు';
	@override String get cities => 'నగరాలు';
	@override String get southeast => 'ఆగ్నేయం';
	@override String get validate_number => 'దయచేసి చెల్లుబాటు అయ్యే సంఖ్యను నమోదు చేయండి';
	@override String get city => 'నగరం';
	@override String get uv_high => 'ఎక్కువ';
	@override String get time => 'నగరంలో సమయం';
	@override String get uv_low => 'తక్కువ';
	@override String get name3 => 'మమ్మల్ని సంప్రదించండి';
	@override String get apparent_temperature_min => 'కనిష్ట స్పష్టమైన ఉష్ణోగ్రత';
	@override String get direction => 'దిశ';
	@override String get heavy_rains => 'వర్షపు జల్లులు';
	@override String get apparent_temperature_max => 'గరిష్ట స్పష్టమైన ఉష్ణోగ్రత';
	@override String get k_12 => '12-గంట';
	@override String get discord => 'డిస్కార్డ్';
	@override String get discard_changes => 'మీ మార్పులను విస్మరించాలనుకుంటున్నారా?';
	@override String get notifications => 'నోటిఫికేషన్లు';
	@override String get mph => 'మైలు/గం';
	@override String get west => 'పడమర';
	@override String get validate90 => 'విలువ -90 మరియు 90 మధ్య ఉండాలి';
	@override String get name2 => 'సౌకర్యవంతమైన డిజైన్';
	@override String get feels => 'అనిపిస్తుంది';
	@override String get precipitation_probability => 'వర్షపాతం సంభావ్యత';
	@override String get license => 'లైసెన్సులు';
	@override String get widget_background => 'విడ్జెట్ బ్యాక్‌గ్రౌండ్';
	@override String get large_element => 'పెద్ద వాతావరణ ప్రదర్శన';
	@override String get unsaved_changes => 'సేవ్ చేయని మార్పులు';
	@override String get drizzling_rain => 'గడ్డకట్టే చినుకులు';
	@override String get cloudy => 'మేఘావృతం';
	@override String get widget => 'విడ్జెట్';
	@override String get precipitation => 'వర్షపాతం';
	@override String get delete => 'తొలగించు';
	@override String get deleted_cache_store => 'కాష్ క్లియర్ చేస్తోంది';
	@override String get map => 'మ్యాప్';
	@override String get description3 => 'మీరు ఏవైనా సమస్యలను ఎదుర్కొంటే, దయచేసి ఇమెయిల్ ద్వారా లేదా అప్లికేషన్ సమీక్షలలో మమ్మల్ని సంప్రదించండి.';
	@override String get north => 'ఉత్తరం';
	@override String get measurements => 'కొలత వ్యవస్థ';
	@override String get start => 'ప్రారంభించు';
	@override String get settings_full => 'సెట్టింగులు';
	@override String get high => 'ఎక్కువ';
	@override String get daily_variables => 'రోజువారీ వాతావరణ వేరియబుల్స్';
	@override String get low => 'తక్కువ';
	@override String get on_inter => 'వాతావరణ డేటాను పొందడానికి ఇంటర్నెట్‌ను ఆన్ చేయండి.';
	@override String get thunderstorm => 'ఉరుములతో కూడిన వర్షం';
	@override String get version => 'అప్లికేషన్ వెర్షన్';
	@override String get project => 'ప్రాజెక్ట్ ఆన్';
	@override String get amoled_theme => 'AMOLED థీమ్';
	@override String get deleted_card_weather_query => 'మీరు నిజంగా నగరాన్ని తొలగించాలనుకుంటున్నారా?';
	@override String get northeast => 'ఈశాన్యం';
	@override String get add_widget => 'విడ్జెట్ జోడించండి';
	@override String get fog => 'పొగమంచు';
	@override String get description2 => 'అన్ని నావిగేషన్ అప్లికేషన్‌తో వీలైనంత సౌకర్యవంతంగా మరియు వేగంగా పరస్పర చర్య చేయడానికి రూపొందించబడింది.';
	@override String get mm => 'మి.మీ';
	@override String get no_desc_data => 'డేటా లేదు';
	@override String get search_city => 'మీ నగరాన్ని కనుగొనండి';
	@override String get weather_more => '12-రోజుల వాతావరణ అంచనా';
	@override String get round_degree => 'రౌండ్ డిగ్రీలు';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'నగర డేటాను శోధించండి లేదా మాన్యువల్‌గా నమోదు చేయండి';
	@override String get validate_name => 'దయచేసి పేరును నమోదు చేయండి';
	@override String get sunrise => 'సూర్యోదయం';
	@override String get km => 'కి.మీ';
	@override String get district => 'జిల్లా';
	@override String get southwest => 'నైరుతి';
	@override String get degrees => 'డిగ్రీలు';
	@override String get clear_cache_store => 'కాష్ క్లియర్ చేయండి';
	@override String get skip => 'దాటవేయి';
	@override String get h_pa => 'హెక్టోపాస్కల్';
	@override String get appearance => 'రూపం';
	@override String get time_start => 'ప్రారంభ సమయం';
	@override String get ready => 'సిద్ధం';
	@override String get kph => 'కి.మీ/గం';
	@override String get deleted_cache_store_query => 'మీరు నిజంగా కాష్‌ను క్లియర్ చేయాలనుకుంటున్నారా?';
	@override String get widget_text => 'విడ్జెట్ టెక్స్ట్';
	@override String get support => 'దానం చేయండి';
	@override String get groups => 'మా గ్రూపులు';
	@override String get system => 'సిస్టమ్';
	@override String get sunset => 'సూర్యాస్తమయం';
	@override String get dewpoint => 'మంచు బిందువు';
	@override String get shortwave_radiation => 'షార్ట్‌వేవ్ రేడియేషన్';
	@override String get language => 'భాష';
	@override String get hide_map => 'మ్యాప్ దాచండి';
	@override String get cancel => 'రద్దు చేయి';
	@override String get loading => 'లోడ్ అవుతోంది...';
	@override String get timeformat => 'సమయ ఫార్మాట్';
	@override String get lat => 'అక్షాంశం';
	@override String get data => 'డేటా';
	@override String get visibility => 'దృశ్యమానత';
	@override String get deleted_card_weather => 'నగరాన్ని తొలగించు';
	@override String get celsius => 'సెల్సియస్';
	@override String get no_location => 'ప్రస్తుత స్థానానికి వాతావరణ డేటాను పొందడానికి లొకేషన్ సేవను ప్రారంభించండి.';
	@override String get create => 'సృష్టించు';
	@override String get edit => 'సవరించు';
	@override String get search => 'వెతకండి...';
	@override String get uv_extreme => 'అత్యధిక';
	@override String get light => 'వెలుగు';
	@override String get cloudcover => 'మేఘ కవరేజ్';
	@override String get uv_very_high => 'చాలా ఎక్కువ';
	@override String get snow => 'మంచు';
	@override String get done => 'పూర్తయింది';
	@override String get theme => 'థీమ్';
	@override String get name => 'వాతావరణం';
	@override String get time_range => 'ఫ్రీక్వెన్సీ (గంటలలో)';
	@override String get about_app => 'యాప్ గురించి';
	@override String get save => 'సేవ్';
	@override String get evaporation => 'ఆవిరైపోవడం';
	@override String get freezing_rain => 'గడ్డకట్టే వర్షం';
	@override String get uv_average => 'మధ్యస్థ';
	@override String get reset_color => 'డిఫాల్ట్‌కు రీసెట్ చేయండి';
	@override String get metric => 'మెట్రిక్';
	@override String get overcast => 'మేఘాలతో కప్పబడిన';
	@override String get pressure => 'ఒత్తిడి';
	@override String get inch => 'అంగుళం';
	@override String get imperial => 'ఇంపీరియల్';
	@override String get location => 'స్థానం';
	@override String get error_occurred => 'లోపం సంభవించింది';
	@override String get validate_value => 'దయచేసి విలువను నమోదు చేయండి';
	@override String get lon => 'రేఖాంశం';
	@override String get wind => 'గాలి';
	@override String get normal => 'సాధారణ';
	@override String get dark => 'చీకటి';
	@override String get settings => 'సెట్టింగులు';
	@override String get south => 'దక్షిణం';
	@override String get windgusts => 'గాలి వేగం';
	@override String get northwest => 'వాయవ్యం';
	@override String get open_meteo => 'Open-Meteo నుండి డేటా (CC-BY 4.0)';
	@override String get rain => 'వర్షం';
	@override String get mm_hg => 'మి.మీ పాదరసం';
	@override String get validate180 => 'విలువ -180 మరియు 180 మధ్య ఉండాలి';
	@override String get description => 'ఏదైనా స్థానానికి ప్రతి గంట, రోజు మరియు వారానికి నవీకరించబడిన అంచనాతో వాతావరణ అప్లికేషన్.';
	@override String get fahrenheit => 'ఫారెన్‌హీట్';
	@override String get m_s => 'మీ/సె';
	@override String get material_color => 'డైనమిక్ రంగులు';
	@override String get confirm => 'సేవ్';
	@override String get no_results => 'ఫలితాలు లేవు';
	@override String get cities_load_error => 'నగరాలను లోడ్ చేయలేకపోయాం';
	@override String get retry => 'మళ్ళీ ప్రయత్నించు';
}

/// The flat map containing all translations for locale <te-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTeIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ఇంటర్నెట్ లేదు',
			'edit_city_hint' => 'నగర సమాచారాన్ని సవరించండి',
			'location_not_found' => 'మీ స్థానాన్ని నిర్ధారించలేకపోయాము',
			'mi' => 'మైలు',
			'next' => 'తదుపరి',
			'discard' => 'విస్మరించు',
			'east' => 'తూర్పు',
			'time_end' => 'ముగింపు సమయం',
			'search_method' => 'వెతకడం లేదా జియోలొకేషన్ ఉపయోగించండి',
			'hourly_variables' => 'గంటవారీ వాతావరణ వేరియబుల్స్',
			'uv_index' => 'UV సూచిక',
			'clear_sky' => 'స్పష్టమైన ఆకాశం',
			'k_24' => '24-గంట',
			'no_weather_card' => 'నగరాన్ని జోడించండి',
			'drizzle' => 'చినుకులు',
			'humidity' => 'తేమ',
			'telegram' => 'టెలిగ్రామ్',
			'functions' => 'ఫంక్షన్లు',
			'cities' => 'నగరాలు',
			'southeast' => 'ఆగ్నేయం',
			'validate_number' => 'దయచేసి చెల్లుబాటు అయ్యే సంఖ్యను నమోదు చేయండి',
			'city' => 'నగరం',
			'uv_high' => 'ఎక్కువ',
			'time' => 'నగరంలో సమయం',
			'uv_low' => 'తక్కువ',
			'name3' => 'మమ్మల్ని సంప్రదించండి',
			'apparent_temperature_min' => 'కనిష్ట స్పష్టమైన ఉష్ణోగ్రత',
			'direction' => 'దిశ',
			'heavy_rains' => 'వర్షపు జల్లులు',
			'apparent_temperature_max' => 'గరిష్ట స్పష్టమైన ఉష్ణోగ్రత',
			'k_12' => '12-గంట',
			'discord' => 'డిస్కార్డ్',
			'discard_changes' => 'మీ మార్పులను విస్మరించాలనుకుంటున్నారా?',
			'notifications' => 'నోటిఫికేషన్లు',
			'mph' => 'మైలు/గం',
			'west' => 'పడమర',
			'validate90' => 'విలువ -90 మరియు 90 మధ్య ఉండాలి',
			'name2' => 'సౌకర్యవంతమైన డిజైన్',
			'feels' => 'అనిపిస్తుంది',
			'precipitation_probability' => 'వర్షపాతం సంభావ్యత',
			'license' => 'లైసెన్సులు',
			'widget_background' => 'విడ్జెట్ బ్యాక్‌గ్రౌండ్',
			'large_element' => 'పెద్ద వాతావరణ ప్రదర్శన',
			'unsaved_changes' => 'సేవ్ చేయని మార్పులు',
			'drizzling_rain' => 'గడ్డకట్టే చినుకులు',
			'cloudy' => 'మేఘావృతం',
			'widget' => 'విడ్జెట్',
			'precipitation' => 'వర్షపాతం',
			'delete' => 'తొలగించు',
			'deleted_cache_store' => 'కాష్ క్లియర్ చేస్తోంది',
			'map' => 'మ్యాప్',
			'description3' => 'మీరు ఏవైనా సమస్యలను ఎదుర్కొంటే, దయచేసి ఇమెయిల్ ద్వారా లేదా అప్లికేషన్ సమీక్షలలో మమ్మల్ని సంప్రదించండి.',
			'north' => 'ఉత్తరం',
			'measurements' => 'కొలత వ్యవస్థ',
			'start' => 'ప్రారంభించు',
			'settings_full' => 'సెట్టింగులు',
			'high' => 'ఎక్కువ',
			'daily_variables' => 'రోజువారీ వాతావరణ వేరియబుల్స్',
			'low' => 'తక్కువ',
			'on_inter' => 'వాతావరణ డేటాను పొందడానికి ఇంటర్నెట్‌ను ఆన్ చేయండి.',
			'thunderstorm' => 'ఉరుములతో కూడిన వర్షం',
			'version' => 'అప్లికేషన్ వెర్షన్',
			'project' => 'ప్రాజెక్ట్ ఆన్',
			'amoled_theme' => 'AMOLED థీమ్',
			'deleted_card_weather_query' => 'మీరు నిజంగా నగరాన్ని తొలగించాలనుకుంటున్నారా?',
			'northeast' => 'ఈశాన్యం',
			'add_widget' => 'విడ్జెట్ జోడించండి',
			'fog' => 'పొగమంచు',
			'description2' => 'అన్ని నావిగేషన్ అప్లికేషన్‌తో వీలైనంత సౌకర్యవంతంగా మరియు వేగంగా పరస్పర చర్య చేయడానికి రూపొందించబడింది.',
			'mm' => 'మి.మీ',
			'no_desc_data' => 'డేటా లేదు',
			'search_city' => 'మీ నగరాన్ని కనుగొనండి',
			'weather_more' => '12-రోజుల వాతావరణ అంచనా',
			'round_degree' => 'రౌండ్ డిగ్రీలు',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'నగర డేటాను శోధించండి లేదా మాన్యువల్‌గా నమోదు చేయండి',
			'validate_name' => 'దయచేసి పేరును నమోదు చేయండి',
			'sunrise' => 'సూర్యోదయం',
			'km' => 'కి.మీ',
			'district' => 'జిల్లా',
			'southwest' => 'నైరుతి',
			'degrees' => 'డిగ్రీలు',
			'clear_cache_store' => 'కాష్ క్లియర్ చేయండి',
			'skip' => 'దాటవేయి',
			'h_pa' => 'హెక్టోపాస్కల్',
			'appearance' => 'రూపం',
			'time_start' => 'ప్రారంభ సమయం',
			'ready' => 'సిద్ధం',
			'kph' => 'కి.మీ/గం',
			'deleted_cache_store_query' => 'మీరు నిజంగా కాష్‌ను క్లియర్ చేయాలనుకుంటున్నారా?',
			'widget_text' => 'విడ్జెట్ టెక్స్ట్',
			'support' => 'దానం చేయండి',
			'groups' => 'మా గ్రూపులు',
			'system' => 'సిస్టమ్',
			'sunset' => 'సూర్యాస్తమయం',
			'dewpoint' => 'మంచు బిందువు',
			'shortwave_radiation' => 'షార్ట్‌వేవ్ రేడియేషన్',
			'language' => 'భాష',
			'hide_map' => 'మ్యాప్ దాచండి',
			'cancel' => 'రద్దు చేయి',
			'loading' => 'లోడ్ అవుతోంది...',
			'timeformat' => 'సమయ ఫార్మాట్',
			'lat' => 'అక్షాంశం',
			'data' => 'డేటా',
			'visibility' => 'దృశ్యమానత',
			'deleted_card_weather' => 'నగరాన్ని తొలగించు',
			'celsius' => 'సెల్సియస్',
			'no_location' => 'ప్రస్తుత స్థానానికి వాతావరణ డేటాను పొందడానికి లొకేషన్ సేవను ప్రారంభించండి.',
			'create' => 'సృష్టించు',
			'edit' => 'సవరించు',
			'search' => 'వెతకండి...',
			'uv_extreme' => 'అత్యధిక',
			'light' => 'వెలుగు',
			'cloudcover' => 'మేఘ కవరేజ్',
			'uv_very_high' => 'చాలా ఎక్కువ',
			'snow' => 'మంచు',
			'done' => 'పూర్తయింది',
			'theme' => 'థీమ్',
			'name' => 'వాతావరణం',
			'time_range' => 'ఫ్రీక్వెన్సీ (గంటలలో)',
			'about_app' => 'యాప్ గురించి',
			'save' => 'సేవ్',
			'evaporation' => 'ఆవిరైపోవడం',
			'freezing_rain' => 'గడ్డకట్టే వర్షం',
			'uv_average' => 'మధ్యస్థ',
			'reset_color' => 'డిఫాల్ట్‌కు రీసెట్ చేయండి',
			'metric' => 'మెట్రిక్',
			'overcast' => 'మేఘాలతో కప్పబడిన',
			'pressure' => 'ఒత్తిడి',
			'inch' => 'అంగుళం',
			'imperial' => 'ఇంపీరియల్',
			'location' => 'స్థానం',
			'error_occurred' => 'లోపం సంభవించింది',
			'validate_value' => 'దయచేసి విలువను నమోదు చేయండి',
			'lon' => 'రేఖాంశం',
			'wind' => 'గాలి',
			'normal' => 'సాధారణ',
			'dark' => 'చీకటి',
			'settings' => 'సెట్టింగులు',
			'south' => 'దక్షిణం',
			'windgusts' => 'గాలి వేగం',
			'northwest' => 'వాయవ్యం',
			'open_meteo' => 'Open-Meteo నుండి డేటా (CC-BY 4.0)',
			'rain' => 'వర్షం',
			'mm_hg' => 'మి.మీ పాదరసం',
			'validate180' => 'విలువ -180 మరియు 180 మధ్య ఉండాలి',
			'description' => 'ఏదైనా స్థానానికి ప్రతి గంట, రోజు మరియు వారానికి నవీకరించబడిన అంచనాతో వాతావరణ అప్లికేషన్.',
			'fahrenheit' => 'ఫారెన్‌హీట్',
			'm_s' => 'మీ/సె',
			'material_color' => 'డైనమిక్ రంగులు',
			'confirm' => 'సేవ్',
			'no_results' => 'ఫలితాలు లేవు',
			'cities_load_error' => 'నగరాలను లోడ్ చేయలేకపోయాం',
			'retry' => 'మళ్ళీ ప్రయత్నించు',
			_ => null,
		};
	}
}
