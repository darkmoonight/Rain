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
class TranslationsGuIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsGuIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.guIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <gu-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsGuIn _root = this; // ignore: unused_field

	@override 
	TranslationsGuIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsGuIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ઇન્ટરનેટ નથી';
	@override String get edit_city_hint => 'શહેરની માહિતી સંપાદિત કરો';
	@override String get location_not_found => 'તમારું સ્થાન નક્કી કરી શકાયું નહીં';
	@override String get mi => 'માઇલ';
	@override String get next => 'આગળ';
	@override String get discard => 'રદ્દ';
	@override String get east => 'પૂર્વ';
	@override String get time_end => 'અંતનો સમય';
	@override String get search_method => 'શોધ અથવા જીઓલોકેશનનો ઉપયોગ કરો';
	@override String get hourly_variables => 'કલાકવાર હવામાન ચલો';
	@override String get uv_index => 'યુવી ઇન્ડેક્સ';
	@override String get clear_sky => 'સ્વચ્છ આકાશ';
	@override String get k_24 => '24-કલાક';
	@override String get no_weather_card => 'શહેર ઉમેરો';
	@override String get drizzle => 'ઝરમર વરસાદ';
	@override String get humidity => 'ભેજ';
	@override String get telegram => 'ટેલિગ્રામ';
	@override String get functions => 'કાર્યો';
	@override String get cities => 'શહેરો';
	@override String get southeast => 'દક્ષિણ પૂર્વ';
	@override String get validate_number => 'કૃપા કરીને માન્ય નંબર દાખલ કરો';
	@override String get city => 'શહેર';
	@override String get uv_high => 'ઊંચું';
	@override String get time => 'શહેરમાં સમય';
	@override String get uv_low => 'નીચું';
	@override String get name3 => 'અમારો સંપર્ક કરો';
	@override String get apparent_temperature_min => 'લઘુત્તમ સ્પષ્ટ તાપમાન';
	@override String get direction => 'દિશા';
	@override String get heavy_rains => 'વરસાદી ફુવારો';
	@override String get apparent_temperature_max => 'મહત્તમ સ્પષ્ટ તાપમાન';
	@override String get k_12 => '12-કલાક';
	@override String get discord => 'ડિસ્કોર્ડ';
	@override String get discard_changes => 'શું તમે ખરેખર તમારા ફેરફારો રદ્દ કરવા માંગો છો?';
	@override String get notifications => 'સૂચનાઓ';
	@override String get mph => 'માઇલ/કલાક';
	@override String get west => 'પશ્ચિમ';
	@override String get validate90 => 'મૂલ્ય -90 અને 90 વચ્ચે હોવું જોઈએ';
	@override String get name2 => 'સુવિધાજનક ડિઝાઇન';
	@override String get feels => 'લાગે છે';
	@override String get precipitation_probability => 'વરસાદની સંભાવના';
	@override String get license => 'લાઇસન્સ';
	@override String get widget_background => 'વિજેટ બેકગ્રાઉન્ડ';
	@override String get large_element => 'મોટું હવામાન પ્રદર્શન';
	@override String get unsaved_changes => 'સંગ્રહિત ન કરેલા ફેરફારો';
	@override String get drizzling_rain => 'થીજતો ઝરમર વરસાદ';
	@override String get cloudy => 'વાદળછાયું';
	@override String get widget => 'વિજેટ';
	@override String get precipitation => 'વરસાદ';
	@override String get delete => 'કાઢી નાખો';
	@override String get deleted_cache_store => 'કેશ સાફ કરી રહ્યા છીએ';
	@override String get map => 'નકશો';
	@override String get description3 => 'જો તમને કોઈ સમસ્યા આવે, તો કૃપા કરીને ઇમેઇલ દ્વારા અથવા એપ્લિકેશન સમીક્ષાઓમાં અમારો સંપર્ક કરો.';
	@override String get north => 'ઉત્તર';
	@override String get measurements => 'માપ પ્રણાલી';
	@override String get start => 'શરૂ કરો';
	@override String get settings_full => 'સેટિંગ્સ';
	@override String get high => 'ઊંચું';
	@override String get daily_variables => 'દૈનિક હવામાન ચલો';
	@override String get low => 'નીચું';
	@override String get on_inter => 'હવામાન ડેટા મેળવવા માટે ઇન્ટરનેટ ચાલુ કરો.';
	@override String get thunderstorm => 'વાવાઝોડું';
	@override String get version => 'એપ્લિકેશન વર્ઝન';
	@override String get project => 'પ્રોજેક્ટ પર';
	@override String get amoled_theme => 'AMOLED થીમ';
	@override String get deleted_card_weather_query => 'શું તમે ખરેખર શહેર કાઢી નાખવા માંગો છો?';
	@override String get northeast => 'ઉત્તર પૂર્વ';
	@override String get add_widget => 'વિજેટ ઉમેરો';
	@override String get fog => 'ધુમ્મસ';
	@override String get description2 => 'બધી નેવિગેશન એપ્લિકેશન સાથે શક્ય તેટલી સુવિધાજનક અને ઝડપથી ક્રિયાપ્રતિક્રિયા કરવા માટે ડિઝાઇન કરવામાં આવી છે.';
	@override String get mm => 'મિમી';
	@override String get search_city => 'તમારું શહેર શોધો';
	@override String get weather_more => '12-દિવસનો હવામાન આગાહી';
	@override String get round_degree => 'રાઉન્ડ ડિગ્રી';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'શહેર ડેટા શોધો અથવા મેન્યુઅલી દાખલ કરો';
	@override String get validate_name => 'કૃપા કરીને નામ દાખલ કરો';
	@override String get sunrise => 'સૂર્યોદય';
	@override String get km => 'કિમી';
	@override String get district => 'જિલ્લો';
	@override String get southwest => 'દક્ષિણ પશ્ચિમ';
	@override String get degrees => 'ડિગ્રી';
	@override String get clear_cache_store => 'કેશ સાફ કરો';
	@override String get skip => 'છોડો';
	@override String get h_pa => 'હેક્ટોપાસ્કલ';
	@override String get appearance => 'દેખાવ';
	@override String get time_start => 'શરૂઆતનો સમય';
	@override String get ready => 'તૈયાર';
	@override String get kph => 'કિમી/કલાક';
	@override String get deleted_cache_store_query => 'શું તમે ખરેખર કેશ સાફ કરવા માંગો છો?';
	@override String get widget_text => 'વિજેટ ટેક્સ્ટ';
	@override String get support => 'દાન કરો';
	@override String get groups => 'અમારા જૂથો';
	@override String get system => 'સિસ્ટમ';
	@override String get sunset => 'સૂર્યાસ્ત';
	@override String get dewpoint => 'ઝાકળ બિંદુ';
	@override String get shortwave_radiation => 'શોર્ટવેવ રેડિયેશન';
	@override String get language => 'ભાષા';
	@override String get hide_map => 'નકશો છુપાવો';
	@override String get cancel => 'રદ કરો';
	@override String get loading => 'લોડ થઈ રહ્યું છે...';
	@override String get timeformat => 'સમય ફોર્મેટ';
	@override String get lat => 'અક્ષાંશ';
	@override String get data => 'ડેટા';
	@override String get visibility => 'દૃશ્યતા';
	@override String get deleted_card_weather => 'શહેર કાઢી નાખો';
	@override String get celsius => 'સેલ્સિયસ';
	@override String get no_location => 'વર્તમાન સ્થાન માટે હવામાન ડેટા મેળવવા માટે સ્થાન સેવા સક્ષમ કરો.';
	@override String get create => 'બનાવો';
	@override String get edit => 'સંપાદિત કરો';
	@override String get search => 'શોધો...';
	@override String get uv_extreme => 'અત્યંત';
	@override String get light => 'હળવું';
	@override String get cloudcover => 'વાદળ આવરણ';
	@override String get uv_very_high => 'ખૂબ ઊંચું';
	@override String get snow => 'બરફ';
	@override String get done => 'પૂર્ણ';
	@override String get theme => 'થીમ';
	@override String get name => 'હવામાન';
	@override String get time_range => 'આવૃત્તિ (કલાકોમાં)';
	@override String get about_app => 'એપ વિશે';
	@override String get save => 'સંગ્રહ';
	@override String get evaporation => 'બાષ્પીભવન';
	@override String get freezing_rain => 'થીજતો વરસાદ';
	@override String get uv_average => 'મધ્યમ';
	@override String get reset_color => 'ડિફોલ્ટ પર રીસેટ કરો';
	@override String get metric => 'મેટ્રિક';
	@override String get overcast => 'ઘેરાયેલું';
	@override String get pressure => 'દબાણ';
	@override String get inch => 'ઇંચ';
	@override String get imperial => 'ઇમ્પીરિયલ';
	@override String get location => 'સ્થાન';
	@override String get error_occurred => 'એક ભૂલ થઈ';
	@override String get validate_value => 'કૃપા કરીને મૂલ્ય દાખલ કરો';
	@override String get lon => 'રેખાંશ';
	@override String get wind => 'પવન';
	@override String get normal => 'સામાન્ય';
	@override String get dark => 'ઘેરું';
	@override String get settings => 'સેટિંગ્સ';
	@override String get south => 'દક્ષિણ';
	@override String get windgusts => 'પવનના ઝાપટા';
	@override String get northwest => 'ઉત્તર પશ્ચિમ';
	@override String get open_meteo => 'Open-Meteo દ્વારા ડેટા (CC-BY 4.0)';
	@override String get rain => 'વરસાદ';
	@override String get mm_hg => 'મિમી પારો';
	@override String get validate180 => 'મૂલ્ય -180 અને 180 વચ્ચે હોવું જોઈએ';
	@override String get description => 'કોઈપણ સ્થાન માટે દરેક કલાક, દિવસ અને અઠવાડિયા માટે અપ-ટુ-ડેટ આગાહી સાથે હવામાન એપ્લિકેશન.';
	@override String get fahrenheit => 'ફેરનહીટ';
	@override String get m_s => 'મી/સે';
	@override String get material_color => 'ડાયનેમિક રંગો';
	@override String get confirm => 'સંગ્રહ';
	@override String get no_results => 'કોઈ પરિણામો નથી';
	@override String get cities_load_error => 'શહેરો લોડ કરી શકાયા નહીં';
	@override String get retry => 'ફરી પ્રયાસ કરો';
	@override String get city_not_found => 'શહેર મળ્યું નથી';
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
	@override String get last_updated => 'અપડેટ થયું';
	@override String get app_font => 'ફોન્ટ';
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

/// The flat map containing all translations for locale <gu-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsGuIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ઇન્ટરનેટ નથી',
			'edit_city_hint' => 'શહેરની માહિતી સંપાદિત કરો',
			'location_not_found' => 'તમારું સ્થાન નક્કી કરી શકાયું નહીં',
			'mi' => 'માઇલ',
			'next' => 'આગળ',
			'discard' => 'રદ્દ',
			'east' => 'પૂર્વ',
			'time_end' => 'અંતનો સમય',
			'search_method' => 'શોધ અથવા જીઓલોકેશનનો ઉપયોગ કરો',
			'hourly_variables' => 'કલાકવાર હવામાન ચલો',
			'uv_index' => 'યુવી ઇન્ડેક્સ',
			'clear_sky' => 'સ્વચ્છ આકાશ',
			'k_24' => '24-કલાક',
			'no_weather_card' => 'શહેર ઉમેરો',
			'drizzle' => 'ઝરમર વરસાદ',
			'humidity' => 'ભેજ',
			'telegram' => 'ટેલિગ્રામ',
			'functions' => 'કાર્યો',
			'cities' => 'શહેરો',
			'southeast' => 'દક્ષિણ પૂર્વ',
			'validate_number' => 'કૃપા કરીને માન્ય નંબર દાખલ કરો',
			'city' => 'શહેર',
			'uv_high' => 'ઊંચું',
			'time' => 'શહેરમાં સમય',
			'uv_low' => 'નીચું',
			'name3' => 'અમારો સંપર્ક કરો',
			'apparent_temperature_min' => 'લઘુત્તમ સ્પષ્ટ તાપમાન',
			'direction' => 'દિશા',
			'heavy_rains' => 'વરસાદી ફુવારો',
			'apparent_temperature_max' => 'મહત્તમ સ્પષ્ટ તાપમાન',
			'k_12' => '12-કલાક',
			'discord' => 'ડિસ્કોર્ડ',
			'discard_changes' => 'શું તમે ખરેખર તમારા ફેરફારો રદ્દ કરવા માંગો છો?',
			'notifications' => 'સૂચનાઓ',
			'mph' => 'માઇલ/કલાક',
			'west' => 'પશ્ચિમ',
			'validate90' => 'મૂલ્ય -90 અને 90 વચ્ચે હોવું જોઈએ',
			'name2' => 'સુવિધાજનક ડિઝાઇન',
			'feels' => 'લાગે છે',
			'precipitation_probability' => 'વરસાદની સંભાવના',
			'license' => 'લાઇસન્સ',
			'widget_background' => 'વિજેટ બેકગ્રાઉન્ડ',
			'large_element' => 'મોટું હવામાન પ્રદર્શન',
			'unsaved_changes' => 'સંગ્રહિત ન કરેલા ફેરફારો',
			'drizzling_rain' => 'થીજતો ઝરમર વરસાદ',
			'cloudy' => 'વાદળછાયું',
			'widget' => 'વિજેટ',
			'precipitation' => 'વરસાદ',
			'delete' => 'કાઢી નાખો',
			'deleted_cache_store' => 'કેશ સાફ કરી રહ્યા છીએ',
			'map' => 'નકશો',
			'description3' => 'જો તમને કોઈ સમસ્યા આવે, તો કૃપા કરીને ઇમેઇલ દ્વારા અથવા એપ્લિકેશન સમીક્ષાઓમાં અમારો સંપર્ક કરો.',
			'north' => 'ઉત્તર',
			'measurements' => 'માપ પ્રણાલી',
			'start' => 'શરૂ કરો',
			'settings_full' => 'સેટિંગ્સ',
			'high' => 'ઊંચું',
			'daily_variables' => 'દૈનિક હવામાન ચલો',
			'low' => 'નીચું',
			'on_inter' => 'હવામાન ડેટા મેળવવા માટે ઇન્ટરનેટ ચાલુ કરો.',
			'thunderstorm' => 'વાવાઝોડું',
			'version' => 'એપ્લિકેશન વર્ઝન',
			'project' => 'પ્રોજેક્ટ પર',
			'amoled_theme' => 'AMOLED થીમ',
			'deleted_card_weather_query' => 'શું તમે ખરેખર શહેર કાઢી નાખવા માંગો છો?',
			'northeast' => 'ઉત્તર પૂર્વ',
			'add_widget' => 'વિજેટ ઉમેરો',
			'fog' => 'ધુમ્મસ',
			'description2' => 'બધી નેવિગેશન એપ્લિકેશન સાથે શક્ય તેટલી સુવિધાજનક અને ઝડપથી ક્રિયાપ્રતિક્રિયા કરવા માટે ડિઝાઇન કરવામાં આવી છે.',
			'mm' => 'મિમી',
			'search_city' => 'તમારું શહેર શોધો',
			'weather_more' => '12-દિવસનો હવામાન આગાહી',
			'round_degree' => 'રાઉન્ડ ડિગ્રી',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'શહેર ડેટા શોધો અથવા મેન્યુઅલી દાખલ કરો',
			'validate_name' => 'કૃપા કરીને નામ દાખલ કરો',
			'sunrise' => 'સૂર્યોદય',
			'km' => 'કિમી',
			'district' => 'જિલ્લો',
			'southwest' => 'દક્ષિણ પશ્ચિમ',
			'degrees' => 'ડિગ્રી',
			'clear_cache_store' => 'કેશ સાફ કરો',
			'skip' => 'છોડો',
			'h_pa' => 'હેક્ટોપાસ્કલ',
			'appearance' => 'દેખાવ',
			'time_start' => 'શરૂઆતનો સમય',
			'ready' => 'તૈયાર',
			'kph' => 'કિમી/કલાક',
			'deleted_cache_store_query' => 'શું તમે ખરેખર કેશ સાફ કરવા માંગો છો?',
			'widget_text' => 'વિજેટ ટેક્સ્ટ',
			'support' => 'દાન કરો',
			'groups' => 'અમારા જૂથો',
			'system' => 'સિસ્ટમ',
			'sunset' => 'સૂર્યાસ્ત',
			'dewpoint' => 'ઝાકળ બિંદુ',
			'shortwave_radiation' => 'શોર્ટવેવ રેડિયેશન',
			'language' => 'ભાષા',
			'hide_map' => 'નકશો છુપાવો',
			'cancel' => 'રદ કરો',
			'loading' => 'લોડ થઈ રહ્યું છે...',
			'timeformat' => 'સમય ફોર્મેટ',
			'lat' => 'અક્ષાંશ',
			'data' => 'ડેટા',
			'visibility' => 'દૃશ્યતા',
			'deleted_card_weather' => 'શહેર કાઢી નાખો',
			'celsius' => 'સેલ્સિયસ',
			'no_location' => 'વર્તમાન સ્થાન માટે હવામાન ડેટા મેળવવા માટે સ્થાન સેવા સક્ષમ કરો.',
			'create' => 'બનાવો',
			'edit' => 'સંપાદિત કરો',
			'search' => 'શોધો...',
			'uv_extreme' => 'અત્યંત',
			'light' => 'હળવું',
			'cloudcover' => 'વાદળ આવરણ',
			'uv_very_high' => 'ખૂબ ઊંચું',
			'snow' => 'બરફ',
			'done' => 'પૂર્ણ',
			'theme' => 'થીમ',
			'name' => 'હવામાન',

			'today' => 'આજે',
			'tomorrow' => 'આવતીકાલે',
			'time_range' => 'આવૃત્તિ (કલાકોમાં)',
			'about_app' => 'એપ વિશે',
			'save' => 'સંગ્રહ',
			'evaporation' => 'બાષ્પીભવન',
			'freezing_rain' => 'થીજતો વરસાદ',
			'uv_average' => 'મધ્યમ',
			'reset_color' => 'ડિફોલ્ટ પર રીસેટ કરો',
			'metric' => 'મેટ્રિક',
			'overcast' => 'ઘેરાયેલું',
			'pressure' => 'દબાણ',
			'inch' => 'ઇંચ',
			'imperial' => 'ઇમ્પીરિયલ',
			'location' => 'સ્થાન',
			'error_occurred' => 'એક ભૂલ થઈ',
			'validate_value' => 'કૃપા કરીને મૂલ્ય દાખલ કરો',
			'lon' => 'રેખાંશ',
			'wind' => 'પવન',
			'normal' => 'સામાન્ય',
			'dark' => 'ઘેરું',
			'settings' => 'સેટિંગ્સ',
			'south' => 'દક્ષિણ',
			'windgusts' => 'પવનના ઝાપટા',
			'northwest' => 'ઉત્તર પશ્ચિમ',
			'open_meteo' => 'Open-Meteo દ્વારા ડેટા (CC-BY 4.0)',
			'rain' => 'વરસાદ',
			'mm_hg' => 'મિમી પારો',
			'validate180' => 'મૂલ્ય -180 અને 180 વચ્ચે હોવું જોઈએ',
			'description' => 'કોઈપણ સ્થાન માટે દરેક કલાક, દિવસ અને અઠવાડિયા માટે અપ-ટુ-ડેટ આગાહી સાથે હવામાન એપ્લિકેશન.',
			'fahrenheit' => 'ફેરનહીટ',
			'm_s' => 'મી/સે',
			'material_color' => 'ડાયનેમિક રંગો',
			'confirm' => 'સંગ્રહ',
			'no_results' => 'કોઈ પરિણામો નથી',
			'cities_load_error' => 'શહેરો લોડ કરી શકાયા નહીં',
			'retry' => 'ફરી પ્રયાસ કરો',
			'city_not_found' => 'શહેર મળ્યું નથી',
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
			'last_updated' => 'અપડેટ થયું',
			'app_font' => 'ફોન્ટ',
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
