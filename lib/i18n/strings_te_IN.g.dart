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
	@override String get city_not_found => 'నగరం కనుగొనబడలేదు';
	@override String get air_quality => 'वायु गुणवत्ता';
	@override String get aqi_standard => 'AQI मानक';
	@override String get aqi_european => 'यूरोपीय AQI';
	@override String get aqi_american => 'अमेरिकी AQI';
	@override String get aqi_good => 'अच्छा';
	@override String get aqi_fair => 'संतोषजनक';
	@override String get aqi_moderate => 'मध्यम';
	@override String get aqi_poor => 'खराब';
	@override String get aqi_very_poor => 'बहुत खराब';
	@override String get aqi_extremely_poor => 'अत्यंत खराब';
	@override String get aqi_unhealthy_sensitive => 'संवेदनशीलों के लिए हानिकारक';
	@override String get aqi_unhealthy => 'हानिकारक';
	@override String get aqi_very_unhealthy => 'बहुत हानिकारक';
	@override String get aqi_hazardous => 'खतरनाक';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'यूरोपीय';
	@override String get american => 'अमेरिकी';
	@override String get aqi_advice_good => 'बाहरी गतिविधियों के लिए अच्छी हवा।';
	@override String get aqi_advice_fair => 'कुल मिलाकर ठीक है। संवेदनशील लोग लंबे समय तक बाहर की गतिविधि सीमित कर सकते हैं।';
	@override String get aqi_advice_moderate => 'संवेदनशील समूहों को बाहर का समय कम करना चाहिए।';
	@override String get aqi_advice_poor => 'बाहरी गतिविधि सीमित करें, खासकर यदि आप प्रदूषण के प्रति संवेदनशील हैं।';
	@override String get aqi_advice_very_poor => 'लंबे समय तक बाहर की गतिविधि से बचें। सभी को स्वास्थ्य पर प्रभाव महसूस हो सकता है।';
	@override String get aqi_advice_extremely_poor => 'यदि संभव हो तो घर के अंदर रहें। बाहरी गतिविधि की सलाह नहीं दी जाती।';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'प्रदूषक';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'నవీకరించబడింది';
	@override String get app_font => 'ఫాంట్';
	@override String get font_ubuntu => 'Ubuntu (app)';
	@override String get font_system => 'System';
	@override String get font_inter => 'Inter';
	@override String get font_open_sans => 'Open Sans';
	@override String get font_roboto => 'Roboto';
	@override String get font_barlow_condensed => 'Barlow Condensed';
	@override String get metric_help_apparent_temperature_min => 'Lowest perceived temperature for the day, combining wind chill, humidity, and solar radiation.';
	@override String get metric_help_apparent_temperature_max => 'Highest perceived temperature for the day, combining wind chill, humidity, and solar radiation.';
	@override String get metric_help_uv_index => 'Ultraviolet radiation strength. Higher values mean faster sunburn and greater eye damage risk.';
	@override String get metric_help_direction => 'Compass direction the wind blows from.';
	@override String get metric_help_wind => 'Average wind speed at 10 m above ground.';
	@override String get metric_help_wind_gusts => 'Peak wind speed in short bursts during the period.';
	@override String get metric_help_precipitation_probability => 'Chance that measurable precipitation falls in this hour or day.';
	@override String get metric_help_rain => 'Liquid rainfall only (does not include snow).';
	@override String get metric_help_precipitation => 'Total water from rain and snow (snow shown as water equivalent).';
	@override String get metric_help_dewpoint => 'Temperature at which air becomes saturated. Closer to the air temperature means muggier conditions.';
	@override String get metric_help_feels => 'Perceived temperature at this hour from humidity, wind, and solar radiation.';
	@override String get metric_help_visibility => 'Farthest horizontal distance at which objects can be seen.';
	@override String get metric_help_evaporation => 'Water evaporating from soil and plants; modelled for the location (1 mm/h ≈ 1 L per m²).';
	@override String get metric_help_humidity => 'Relative humidity at 2 m — moisture in the air as a percent of saturation.';
	@override String get metric_help_cloudcover => 'Share of the sky covered by clouds (0% clear, 100% overcast).';
	@override String get metric_help_pressure => 'Sea-level air pressure. Falling pressure often signals worsening weather.';
	@override String get metric_help_shortwave_radiation => 'Solar energy on a horizontal surface (global horizontal irradiance), averaged over the preceding hour.';
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
			'city_not_found' => 'నగరం కనుగొనబడలేదు',
			'air_quality' => 'वायु गुणवत्ता',
			'aqi_standard' => 'AQI मानक',
			'aqi_european' => 'यूरोपीय AQI',
			'aqi_american' => 'अमेरिकी AQI',
			'aqi_good' => 'अच्छा',
			'aqi_fair' => 'संतोषजनक',
			'aqi_moderate' => 'मध्यम',
			'aqi_poor' => 'खराब',
			'aqi_very_poor' => 'बहुत खराब',
			'aqi_extremely_poor' => 'अत्यंत खराब',
			'aqi_unhealthy_sensitive' => 'संवेदनशीलों के लिए हानिकारक',
			'aqi_unhealthy' => 'हानिकारक',
			'aqi_very_unhealthy' => 'बहुत हानिकारक',
			'aqi_hazardous' => 'खतरनाक',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'यूरोपीय',
			'american' => 'अमेरिकी',
			'aqi_advice_good' => 'बाहरी गतिविधियों के लिए अच्छी हवा।',
			'aqi_advice_fair' => 'कुल मिलाकर ठीक है। संवेदनशील लोग लंबे समय तक बाहर की गतिविधि सीमित कर सकते हैं।',
			'aqi_advice_moderate' => 'संवेदनशील समूहों को बाहर का समय कम करना चाहिए।',
			'aqi_advice_poor' => 'बाहरी गतिविधि सीमित करें, खासकर यदि आप प्रदूषण के प्रति संवेदनशील हैं।',
			'aqi_advice_very_poor' => 'लंबे समय तक बाहर की गतिविधि से बचें। सभी को स्वास्थ्य पर प्रभाव महसूस हो सकता है।',
			'aqi_advice_extremely_poor' => 'यदि संभव हो तो घर के अंदर रहें। बाहरी गतिविधि की सलाह नहीं दी जाती।',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'प्रदूषक',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'నవీకరించబడింది',
			'app_font' => 'ఫాంట్',
			'font_ubuntu' => 'Ubuntu (app)',
			'font_system' => 'System',
			'font_inter' => 'Inter',
			'font_open_sans' => 'Open Sans',
			'font_roboto' => 'Roboto',
			'font_barlow_condensed' => 'Barlow Condensed',
			'metric_help_apparent_temperature_min' => 'Lowest perceived temperature for the day, combining wind chill, humidity, and solar radiation.',
			'metric_help_apparent_temperature_max' => 'Highest perceived temperature for the day, combining wind chill, humidity, and solar radiation.',
			'metric_help_uv_index' => 'Ultraviolet radiation strength. Higher values mean faster sunburn and greater eye damage risk.',
			'metric_help_direction' => 'Compass direction the wind blows from.',
			'metric_help_wind' => 'Average wind speed at 10 m above ground.',
			'metric_help_wind_gusts' => 'Peak wind speed in short bursts during the period.',
			'metric_help_precipitation_probability' => 'Chance that measurable precipitation falls in this hour or day.',
			'metric_help_rain' => 'Liquid rainfall only (does not include snow).',
			'metric_help_precipitation' => 'Total water from rain and snow (snow shown as water equivalent).',
			'metric_help_dewpoint' => 'Temperature at which air becomes saturated. Closer to the air temperature means muggier conditions.',
			'metric_help_feels' => 'Perceived temperature at this hour from humidity, wind, and solar radiation.',
			'metric_help_visibility' => 'Farthest horizontal distance at which objects can be seen.',
			'metric_help_evaporation' => 'Water evaporating from soil and plants; modelled for the location (1 mm/h ≈ 1 L per m²).',
			'metric_help_humidity' => 'Relative humidity at 2 m — moisture in the air as a percent of saturation.',
			'metric_help_cloudcover' => 'Share of the sky covered by clouds (0% clear, 100% overcast).',
			'metric_help_pressure' => 'Sea-level air pressure. Falling pressure often signals worsening weather.',
			'metric_help_shortwave_radiation' => 'Solar energy on a horizontal surface (global horizontal irradiance), averaged over the preceding hour.',
			_ => null,
		};
	}
}
