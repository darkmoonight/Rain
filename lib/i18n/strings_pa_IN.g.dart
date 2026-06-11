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
class TranslationsPaIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPaIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.paIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pa-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPaIn _root = this; // ignore: unused_field

	@override 
	TranslationsPaIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPaIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ਇੰਟਰਨੈੱਟ ਨਹੀਂ';
	@override String get edit_city_hint => 'ਸ਼ਹਿਰ ਦੀ ਜਾਣਕਾਰੀ ਸੰਪਾਦਿਤ ਕਰੋ';
	@override String get location_not_found => 'ਤੁਹਾਡੀ ਸਥਿਤੀ ਦਾ ਪਤਾ ਨਹੀਂ ਲੱਗ ਸਕਿਆ';
	@override String get mi => 'ਮੀਲ';
	@override String get next => 'ਅਗਲਾ';
	@override String get discard => 'ਰੱਦ ਕਰੋ';
	@override String get east => 'ਪੂਰਬ';
	@override String get time_end => 'ਅੰਤ ਦਾ ਸਮਾਂ';
	@override String get search_method => 'ਖੋਜ ਜਾਂ ਭੂਗੋਲਿਕ ਸਥਾਨ ਦੀ ਵਰਤੋਂ ਕਰੋ';
	@override String get hourly_variables => 'ਘੰਟੇਵਾਰ ਮੌਸਮੀ ਵੇਰੀਏਬਲ';
	@override String get uv_index => 'ਯੂਵੀ ਸੂਚਕਾਂਕ';
	@override String get clear_sky => 'ਸਾਫ਼ ਅਸਮਾਨ';
	@override String get k_24 => '24-ਘੰਟਾ';
	@override String get no_weather_card => 'ਸ਼ਹਿਰ ਸ਼ਾਮਲ ਕਰੋ';
	@override String get drizzle => 'ਬੂੰਦਾ-ਬਾਂਦੀ';
	@override String get humidity => 'ਨਮੀ';
	@override String get telegram => 'ਟੈਲੀਗ੍ਰਾਮ';
	@override String get functions => 'ਫੰਕਸ਼ਨਾਂ';
	@override String get cities => 'ਸ਼ਹਿਰ';
	@override String get southeast => 'ਦੱਖਣ-ਪੂਰਬ';
	@override String get validate_number => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ ਨੰਬਰ ਦਰਜ ਕਰੋ';
	@override String get city => 'ਸ਼ਹਿਰ';
	@override String get uv_high => 'ਉੱਚ';
	@override String get time => 'ਸ਼ਹਿਰ ਵਿੱਚ ਸਮਾਂ';
	@override String get uv_low => 'ਘੱਟ';
	@override String get name3 => 'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';
	@override String get apparent_temperature_min => 'ਘੱਟੋ-ਘੱਟ ਸਪੱਸ਼ਟ ਤਾਪਮਾਨ';
	@override String get direction => 'ਦਿਸ਼ਾ';
	@override String get heavy_rains => 'ਮੀਂਹ ਦੀਆਂ ਝੜੀਆਂ';
	@override String get apparent_temperature_max => 'ਵੱਧ ਤੋਂ ਵੱਧ ਸਪੱਸ਼ਟ ਤਾਪਮਾਨ';
	@override String get k_12 => '12-ਘੰਟਾ';
	@override String get discord => 'ਡਿਸਕਾਰਡ';
	@override String get discard_changes => 'ਕੀ ਤੁਸੀਂ ਆਪਣੇ ਬਦਲਾਅ ਰੱਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get notifications => 'ਸੂਚਨਾਵਾਂ';
	@override String get mph => 'ਮੀਲ/ਘੰਟਾ';
	@override String get west => 'ਪੱਛਮ';
	@override String get validate90 => 'ਮੁੱਲ -90 ਅਤੇ 90 ਦੇ ਵਿਚਕਾਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';
	@override String get name2 => 'ਸੁਵਿਧਾਜਨਕ ਡਿਜ਼ਾਈਨ';
	@override String get feels => 'ਮਹਿਸੂਸ ਹੁੰਦਾ ਹੈ';
	@override String get precipitation_probability => 'ਬਰਸਾਤ ਦੀ ਸੰਭਾਵਨਾ';
	@override String get license => 'ਲਾਇਸੈਂਸ';
	@override String get widget_background => 'ਵਿਜੇਟ ਬੈਕਗ੍ਰਾਊਂਡ';
	@override String get large_element => 'ਵੱਡਾ ਮੌਸਮੀ ਡਿਸਪਲੇ';
	@override String get unsaved_changes => 'ਨਾ ਸੰਭਾਲੇ ਬਦਲਾਅ';
	@override String get drizzling_rain => 'ਜੰਮਣ ਵਾਲੀ ਬੂੰਦਾ-ਬਾਂਦੀ';
	@override String get cloudy => 'ਬੱਦਲਵਾਈ';
	@override String get widget => 'ਵਿਜੇਟ';
	@override String get precipitation => 'ਬਰਸਾਤ';
	@override String get delete => 'ਮਿਟਾਓ';
	@override String get deleted_cache_store => 'ਕੈਸ਼ ਸਾਫ਼ ਕਰ ਰਿਹਾ ਹੈ';
	@override String get map => 'ਨਕਸ਼ਾ';
	@override String get description3 => 'ਜੇ ਤੁਸੀਂ ਕੋਈ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰਦੇ ਹੋ, ਤਾਂ ਕਿਰਪਾ ਕਰਕੇ ਈਮੇਲ ਰਾਹੀਂ ਜਾਂ ਐਪਲੀਕੇਸ਼ਨ ਸਮੀਖਿਆਵਾਂ ਵਿੱਚ ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ।';
	@override String get north => 'ਉੱਤਰ';
	@override String get measurements => 'ਮਾਪ ਪ੍ਰਣਾਲੀ';
	@override String get start => 'ਸ਼ੁਰੂ ਕਰੋ';
	@override String get settings_full => 'ਸੈਟਿੰਗਾਂ';
	@override String get high => 'ਉੱਚ';
	@override String get daily_variables => 'ਰੋਜ਼ਾਨਾ ਮੌਸਮੀ ਵੇਰੀਏਬਲ';
	@override String get low => 'ਘੱਟ';
	@override String get on_inter => 'ਮੌਸਮੀ ਡੇਟਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਇੰਟਰਨੈੱਟ ਚਾਲੂ ਕਰੋ।';
	@override String get thunderstorm => 'ਗਰਜ-ਚਮਕ';
	@override String get version => 'ਐਪਲੀਕੇਸ਼ਨ ਵਰਜ਼ਨ';
	@override String get project => 'ਪ੍ਰੋਜੈਕਟ ਚਾਲੂ';
	@override String get amoled_theme => 'AMOLED ਥੀਮ';
	@override String get deleted_card_weather_query => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਸ਼ਹਿਰ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get northeast => 'ਉੱਤਰ-ਪੂਰਬ';
	@override String get add_widget => 'ਵਿਜੇਟ ਸ਼ਾਮਲ ਕਰੋ';
	@override String get fog => 'ਧੁੰਦ';
	@override String get description2 => 'ਸਾਰੀ ਨੈਵੀਗੇਸ਼ਨ ਐਪਲੀਕੇਸ਼ਨ ਨਾਲ ਜਿੰਨਾ ਸੰਭਵ ਹੋ ਸਕੇ ਸੁਵਿਧਾਜਨਕ ਅਤੇ ਤੇਜ਼ੀ ਨਾਲ ਗੱਲਬਾਤ ਕਰਨ ਲਈ ਡਿਜ਼ਾਈਨ ਕੀਤੀ ਗਈ ਹੈ।';
	@override String get mm => 'ਮਿ.ਮੀ';
	@override String get search_city => 'ਆਪਣਾ ਸ਼ਹਿਰ ਲੱਭੋ';
	@override String get weather_more => '12-ਦਿਨਾਂ ਦਾ ਮੌਸਮੀ ਪੂਰਵ-ਅਨੁਮਾਨ';
	@override String get round_degree => 'ਗੋਲ ਡਿਗਰੀ';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'ਸ਼ਹਿਰ ਡਾਟਾ ਲੱਭੋ ਜਾਂ ਮੈਨੂਅਲੀ ਦਰਜ ਕਰੋ';
	@override String get validate_name => 'ਕਿਰਪਾ ਕਰਕੇ ਨਾਮ ਦਰਜ ਕਰੋ';
	@override String get sunrise => 'ਸੂਰਜ ਚੜ੍ਹਨਾ';
	@override String get km => 'ਕਿ.ਮੀ';
	@override String get district => 'ਜ਼ਿਲ੍ਹਾ';
	@override String get southwest => 'ਦੱਖਣ-ਪੱਛਮ';
	@override String get degrees => 'ਡਿਗਰੀ';
	@override String get clear_cache_store => 'ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ';
	@override String get skip => 'ਛੱਡੋ';
	@override String get h_pa => 'ਹੈਕਟੋਪਾਸਕਲ';
	@override String get appearance => 'ਦਿੱਖ';
	@override String get time_start => 'ਸ਼ੁਰੂਆਤੀ ਸਮਾਂ';
	@override String get ready => 'ਤਿਆਰ';
	@override String get kph => 'ਕਿ.ਮੀ/ਘੰਟਾ';
	@override String get deleted_cache_store_query => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਕੈਸ਼ ਨੂੰ ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get widget_text => 'ਵਿਜੇਟ ਟੈਕਸਟ';
	@override String get support => 'ਦਾਨ ਕਰੋ';
	@override String get groups => 'ਸਾਡੇ ਸਮੂਹ';
	@override String get system => 'ਸਿਸਟਮ';
	@override String get sunset => 'ਸੂਰਜ ਡੁੱਬਣਾ';
	@override String get dewpoint => 'ਤ੍ਰੇਲ ਬਿੰਦੂ';
	@override String get shortwave_radiation => 'ਸ਼ਾਰਟਵੇਵ ਰੇਡੀਏਸ਼ਨ';
	@override String get language => 'ਭਾਸ਼ਾ';
	@override String get hide_map => 'ਨਕਸ਼ਾ ਲੁਕਾਓ';
	@override String get cancel => 'ਰੱਦ ਕਰੋ';
	@override String get loading => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';
	@override String get timeformat => 'ਸਮਾਂ ਫਾਰਮੈਟ';
	@override String get lat => 'ਅਕਸ਼ਾਂਸ਼';
	@override String get data => 'ਡੇਟਾ';
	@override String get visibility => 'ਦਿੱਖ';
	@override String get deleted_card_weather => 'ਸ਼ਹਿਰ ਮਿਟਾਓ';
	@override String get celsius => 'ਸੈਲਸੀਅਸ';
	@override String get no_location => 'ਮੌਜੂਦਾ ਸਥਾਨ ਲਈ ਮੌਸਮੀ ਡੇਟਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਸਥਾਨ ਸੇਵਾ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ।';
	@override String get create => 'ਬਣਾਓ';
	@override String get edit => 'ਸੰਪਾਦਿਤ ਕਰੋ';
	@override String get search => 'ਖੋਜੋ...';
	@override String get uv_extreme => 'ਬਹੁਤ ਜ਼ਿਆਦਾ';
	@override String get light => 'ਹਲਕਾ';
	@override String get cloudcover => 'ਬੱਦਲਾਂ ਦਾ ਢੱਕਣ';
	@override String get uv_very_high => 'ਬਹੁਤ ਉੱਚ';
	@override String get snow => 'ਬਰਫ਼';
	@override String get done => 'ਹੋ ਗਿਆ';
	@override String get theme => 'ਥੀਮ';
	@override String get name => 'ਮੌਸਮ';
	@override String get time_range => 'ਬਾਰੰਬਾਰਤਾ (ਘੰਟਿਆਂ ਵਿੱਚ)';
	@override String get about_app => 'ਐਪ ਬਾਰੇ';
	@override String get save => 'ਸੰਭਾਲੋ';
	@override String get evaporation => 'ਭਾਫ਼ ਬਣਨਾ';
	@override String get freezing_rain => 'ਜੰਮਣ ਵਾਲਾ ਮੀਂਹ';
	@override String get uv_average => 'ਮੱਧਮ';
	@override String get reset_color => 'ਡਿਫਾਲਟ ਤੇ ਰੀਸੈਟ ਕਰੋ';
	@override String get metric => 'ਮੈਟ੍ਰਿਕ';
	@override String get overcast => 'ਬੱਦਲਾਂ ਨਾਲ ਢੱਕਿਆ';
	@override String get pressure => 'ਦਬਾਅ';
	@override String get inch => 'ਇੰਚ';
	@override String get imperial => 'ਇੰਪੀਰੀਅਲ';
	@override String get location => 'ਸਥਾਨ';
	@override String get error_occurred => 'ਇੱਕ ਗਲਤੀ ਹੋਈ';
	@override String get validate_value => 'ਕਿਰਪਾ ਕਰਕੇ ਮੁੱਲ ਦਰਜ ਕਰੋ';
	@override String get lon => 'ਰੇਖਾਂਸ਼';
	@override String get wind => 'ਹਵਾ';
	@override String get normal => 'ਆਮ';
	@override String get dark => 'ਗੂੜ੍ਹਾ';
	@override String get settings => 'ਸੈਟਿੰਗਾਂ';
	@override String get south => 'ਦੱਖਣ';
	@override String get windgusts => 'ਹਵਾ ਦੇ ਝੱਕੜ';
	@override String get northwest => 'ਉੱਤਰ-ਪੱਛਮ';
	@override String get open_meteo => 'Open-Meteo ਤੋਂ ਡੇਟਾ (CC-BY 4.0)';
	@override String get rain => 'ਮੀਂਹ';
	@override String get mm_hg => 'ਮਿ.ਮੀ ਪਾਰਾ';
	@override String get validate180 => 'ਮੁੱਲ -180 ਅਤੇ 180 ਦੇ ਵਿਚਕਾਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';
	@override String get description => 'ਕਿਸੇ ਵੀ ਸਥਾਨ ਲਈ ਹਰ ਘੰਟੇ, ਦਿਨ ਅਤੇ ਹਫ਼ਤੇ ਲਈ ਅਪ-ਟੂ-ਡੇਟ ਪੂਰਵ-ਅਨੁਮਾਨ ਦੇ ਨਾਲ ਮੌਸਮ ਐਪਲੀਕੇਸ਼ਨ।';
	@override String get fahrenheit => 'ਫਾਰਨਹਾਈਟ';
	@override String get m_s => 'ਮੀ/ਸੈ';
	@override String get material_color => 'ਗਤੀਸ਼ੀਲ ਰੰਗ';
	@override String get confirm => 'ਸੰਭਾਲੋ';
	@override String get no_results => 'ਕੋਈ ਨਤੀਜੇ ਨਹੀਂ';
	@override String get cities_load_error => 'ਸ਼ਹਿਰ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕੇ';
	@override String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼';
	@override String get city_not_found => 'ਸ਼ਹਿਰ ਨਹੀਂ ਮਿਲਿਆ';
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
	@override String get last_updated => 'ਅਪਡੇਟ ਕੀਤਾ';
	@override String get app_font => 'ਫੌਂਟ';
	@override String get font_ubuntu => 'Ubuntu (app)';
	@override String get font_system => 'System';
	@override String get font_inter => 'Inter';
	@override String get font_open_sans => 'Open Sans';
	@override String get font_roboto => 'Roboto';
	@override String get font_barlow_condensed => 'Barlow Condensed';
	@override String get metric_help_apparent_temperature_min => 'Lowest perceived temperature for the day, combining wind chill, humidity, and solar radiation.';
	@override String get metric_help_apparent_temperature_max => 'Highest perceived temperature for the day, combining wind chill, humidity, and solar radiation.';
	@override String get metric_help_uv_index => 'Ultraviolet radiation strength. Higher values mean faster sunburn and greater eye damage risk.';
	@override String get metric_help_direction => 'Compass direction the wind blows from (meteorological convention).';
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

/// The flat map containing all translations for locale <pa-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPaIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ਇੰਟਰਨੈੱਟ ਨਹੀਂ',
			'edit_city_hint' => 'ਸ਼ਹਿਰ ਦੀ ਜਾਣਕਾਰੀ ਸੰਪਾਦਿਤ ਕਰੋ',
			'location_not_found' => 'ਤੁਹਾਡੀ ਸਥਿਤੀ ਦਾ ਪਤਾ ਨਹੀਂ ਲੱਗ ਸਕਿਆ',
			'mi' => 'ਮੀਲ',
			'next' => 'ਅਗਲਾ',
			'discard' => 'ਰੱਦ ਕਰੋ',
			'east' => 'ਪੂਰਬ',
			'time_end' => 'ਅੰਤ ਦਾ ਸਮਾਂ',
			'search_method' => 'ਖੋਜ ਜਾਂ ਭੂਗੋਲਿਕ ਸਥਾਨ ਦੀ ਵਰਤੋਂ ਕਰੋ',
			'hourly_variables' => 'ਘੰਟੇਵਾਰ ਮੌਸਮੀ ਵੇਰੀਏਬਲ',
			'uv_index' => 'ਯੂਵੀ ਸੂਚਕਾਂਕ',
			'clear_sky' => 'ਸਾਫ਼ ਅਸਮਾਨ',
			'k_24' => '24-ਘੰਟਾ',
			'no_weather_card' => 'ਸ਼ਹਿਰ ਸ਼ਾਮਲ ਕਰੋ',
			'drizzle' => 'ਬੂੰਦਾ-ਬਾਂਦੀ',
			'humidity' => 'ਨਮੀ',
			'telegram' => 'ਟੈਲੀਗ੍ਰਾਮ',
			'functions' => 'ਫੰਕਸ਼ਨਾਂ',
			'cities' => 'ਸ਼ਹਿਰ',
			'southeast' => 'ਦੱਖਣ-ਪੂਰਬ',
			'validate_number' => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ ਨੰਬਰ ਦਰਜ ਕਰੋ',
			'city' => 'ਸ਼ਹਿਰ',
			'uv_high' => 'ਉੱਚ',
			'time' => 'ਸ਼ਹਿਰ ਵਿੱਚ ਸਮਾਂ',
			'uv_low' => 'ਘੱਟ',
			'name3' => 'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ',
			'apparent_temperature_min' => 'ਘੱਟੋ-ਘੱਟ ਸਪੱਸ਼ਟ ਤਾਪਮਾਨ',
			'direction' => 'ਦਿਸ਼ਾ',
			'heavy_rains' => 'ਮੀਂਹ ਦੀਆਂ ਝੜੀਆਂ',
			'apparent_temperature_max' => 'ਵੱਧ ਤੋਂ ਵੱਧ ਸਪੱਸ਼ਟ ਤਾਪਮਾਨ',
			'k_12' => '12-ਘੰਟਾ',
			'discord' => 'ਡਿਸਕਾਰਡ',
			'discard_changes' => 'ਕੀ ਤੁਸੀਂ ਆਪਣੇ ਬਦਲਾਅ ਰੱਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'notifications' => 'ਸੂਚਨਾਵਾਂ',
			'mph' => 'ਮੀਲ/ਘੰਟਾ',
			'west' => 'ਪੱਛਮ',
			'validate90' => 'ਮੁੱਲ -90 ਅਤੇ 90 ਦੇ ਵਿਚਕਾਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ',
			'name2' => 'ਸੁਵਿਧਾਜਨਕ ਡਿਜ਼ਾਈਨ',
			'feels' => 'ਮਹਿਸੂਸ ਹੁੰਦਾ ਹੈ',
			'precipitation_probability' => 'ਬਰਸਾਤ ਦੀ ਸੰਭਾਵਨਾ',
			'license' => 'ਲਾਇਸੈਂਸ',
			'widget_background' => 'ਵਿਜੇਟ ਬੈਕਗ੍ਰਾਊਂਡ',
			'large_element' => 'ਵੱਡਾ ਮੌਸਮੀ ਡਿਸਪਲੇ',
			'unsaved_changes' => 'ਨਾ ਸੰਭਾਲੇ ਬਦਲਾਅ',
			'drizzling_rain' => 'ਜੰਮਣ ਵਾਲੀ ਬੂੰਦਾ-ਬਾਂਦੀ',
			'cloudy' => 'ਬੱਦਲਵਾਈ',
			'widget' => 'ਵਿਜੇਟ',
			'precipitation' => 'ਬਰਸਾਤ',
			'delete' => 'ਮਿਟਾਓ',
			'deleted_cache_store' => 'ਕੈਸ਼ ਸਾਫ਼ ਕਰ ਰਿਹਾ ਹੈ',
			'map' => 'ਨਕਸ਼ਾ',
			'description3' => 'ਜੇ ਤੁਸੀਂ ਕੋਈ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰਦੇ ਹੋ, ਤਾਂ ਕਿਰਪਾ ਕਰਕੇ ਈਮੇਲ ਰਾਹੀਂ ਜਾਂ ਐਪਲੀਕੇਸ਼ਨ ਸਮੀਖਿਆਵਾਂ ਵਿੱਚ ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ।',
			'north' => 'ਉੱਤਰ',
			'measurements' => 'ਮਾਪ ਪ੍ਰਣਾਲੀ',
			'start' => 'ਸ਼ੁਰੂ ਕਰੋ',
			'settings_full' => 'ਸੈਟਿੰਗਾਂ',
			'high' => 'ਉੱਚ',
			'daily_variables' => 'ਰੋਜ਼ਾਨਾ ਮੌਸਮੀ ਵੇਰੀਏਬਲ',
			'low' => 'ਘੱਟ',
			'on_inter' => 'ਮੌਸਮੀ ਡੇਟਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਇੰਟਰਨੈੱਟ ਚਾਲੂ ਕਰੋ।',
			'thunderstorm' => 'ਗਰਜ-ਚਮਕ',
			'version' => 'ਐਪਲੀਕੇਸ਼ਨ ਵਰਜ਼ਨ',
			'project' => 'ਪ੍ਰੋਜੈਕਟ ਚਾਲੂ',
			'amoled_theme' => 'AMOLED ਥੀਮ',
			'deleted_card_weather_query' => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਸ਼ਹਿਰ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'northeast' => 'ਉੱਤਰ-ਪੂਰਬ',
			'add_widget' => 'ਵਿਜੇਟ ਸ਼ਾਮਲ ਕਰੋ',
			'fog' => 'ਧੁੰਦ',
			'description2' => 'ਸਾਰੀ ਨੈਵੀਗੇਸ਼ਨ ਐਪਲੀਕੇਸ਼ਨ ਨਾਲ ਜਿੰਨਾ ਸੰਭਵ ਹੋ ਸਕੇ ਸੁਵਿਧਾਜਨਕ ਅਤੇ ਤੇਜ਼ੀ ਨਾਲ ਗੱਲਬਾਤ ਕਰਨ ਲਈ ਡਿਜ਼ਾਈਨ ਕੀਤੀ ਗਈ ਹੈ।',
			'mm' => 'ਮਿ.ਮੀ',
			'search_city' => 'ਆਪਣਾ ਸ਼ਹਿਰ ਲੱਭੋ',
			'weather_more' => '12-ਦਿਨਾਂ ਦਾ ਮੌਸਮੀ ਪੂਰਵ-ਅਨੁਮਾਨ',
			'round_degree' => 'ਗੋਲ ਡਿਗਰੀ',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'ਸ਼ਹਿਰ ਡਾਟਾ ਲੱਭੋ ਜਾਂ ਮੈਨੂਅਲੀ ਦਰਜ ਕਰੋ',
			'validate_name' => 'ਕਿਰਪਾ ਕਰਕੇ ਨਾਮ ਦਰਜ ਕਰੋ',
			'sunrise' => 'ਸੂਰਜ ਚੜ੍ਹਨਾ',
			'km' => 'ਕਿ.ਮੀ',
			'district' => 'ਜ਼ਿਲ੍ਹਾ',
			'southwest' => 'ਦੱਖਣ-ਪੱਛਮ',
			'degrees' => 'ਡਿਗਰੀ',
			'clear_cache_store' => 'ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ',
			'skip' => 'ਛੱਡੋ',
			'h_pa' => 'ਹੈਕਟੋਪਾਸਕਲ',
			'appearance' => 'ਦਿੱਖ',
			'time_start' => 'ਸ਼ੁਰੂਆਤੀ ਸਮਾਂ',
			'ready' => 'ਤਿਆਰ',
			'kph' => 'ਕਿ.ਮੀ/ਘੰਟਾ',
			'deleted_cache_store_query' => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਕੈਸ਼ ਨੂੰ ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'widget_text' => 'ਵਿਜੇਟ ਟੈਕਸਟ',
			'support' => 'ਦਾਨ ਕਰੋ',
			'groups' => 'ਸਾਡੇ ਸਮੂਹ',
			'system' => 'ਸਿਸਟਮ',
			'sunset' => 'ਸੂਰਜ ਡੁੱਬਣਾ',
			'dewpoint' => 'ਤ੍ਰੇਲ ਬਿੰਦੂ',
			'shortwave_radiation' => 'ਸ਼ਾਰਟਵੇਵ ਰੇਡੀਏਸ਼ਨ',
			'language' => 'ਭਾਸ਼ਾ',
			'hide_map' => 'ਨਕਸ਼ਾ ਲੁਕਾਓ',
			'cancel' => 'ਰੱਦ ਕਰੋ',
			'loading' => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...',
			'timeformat' => 'ਸਮਾਂ ਫਾਰਮੈਟ',
			'lat' => 'ਅਕਸ਼ਾਂਸ਼',
			'data' => 'ਡੇਟਾ',
			'visibility' => 'ਦਿੱਖ',
			'deleted_card_weather' => 'ਸ਼ਹਿਰ ਮਿਟਾਓ',
			'celsius' => 'ਸੈਲਸੀਅਸ',
			'no_location' => 'ਮੌਜੂਦਾ ਸਥਾਨ ਲਈ ਮੌਸਮੀ ਡੇਟਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਸਥਾਨ ਸੇਵਾ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ।',
			'create' => 'ਬਣਾਓ',
			'edit' => 'ਸੰਪਾਦਿਤ ਕਰੋ',
			'search' => 'ਖੋਜੋ...',
			'uv_extreme' => 'ਬਹੁਤ ਜ਼ਿਆਦਾ',
			'light' => 'ਹਲਕਾ',
			'cloudcover' => 'ਬੱਦਲਾਂ ਦਾ ਢੱਕਣ',
			'uv_very_high' => 'ਬਹੁਤ ਉੱਚ',
			'snow' => 'ਬਰਫ਼',
			'done' => 'ਹੋ ਗਿਆ',
			'theme' => 'ਥੀਮ',
			'name' => 'ਮੌਸਮ',
			'time_range' => 'ਬਾਰੰਬਾਰਤਾ (ਘੰਟਿਆਂ ਵਿੱਚ)',
			'about_app' => 'ਐਪ ਬਾਰੇ',
			'save' => 'ਸੰਭਾਲੋ',
			'evaporation' => 'ਭਾਫ਼ ਬਣਨਾ',
			'freezing_rain' => 'ਜੰਮਣ ਵਾਲਾ ਮੀਂਹ',
			'uv_average' => 'ਮੱਧਮ',
			'reset_color' => 'ਡਿਫਾਲਟ ਤੇ ਰੀਸੈਟ ਕਰੋ',
			'metric' => 'ਮੈਟ੍ਰਿਕ',
			'overcast' => 'ਬੱਦਲਾਂ ਨਾਲ ਢੱਕਿਆ',
			'pressure' => 'ਦਬਾਅ',
			'inch' => 'ਇੰਚ',
			'imperial' => 'ਇੰਪੀਰੀਅਲ',
			'location' => 'ਸਥਾਨ',
			'error_occurred' => 'ਇੱਕ ਗਲਤੀ ਹੋਈ',
			'validate_value' => 'ਕਿਰਪਾ ਕਰਕੇ ਮੁੱਲ ਦਰਜ ਕਰੋ',
			'lon' => 'ਰੇਖਾਂਸ਼',
			'wind' => 'ਹਵਾ',
			'normal' => 'ਆਮ',
			'dark' => 'ਗੂੜ੍ਹਾ',
			'settings' => 'ਸੈਟਿੰਗਾਂ',
			'south' => 'ਦੱਖਣ',
			'windgusts' => 'ਹਵਾ ਦੇ ਝੱਕੜ',
			'northwest' => 'ਉੱਤਰ-ਪੱਛਮ',
			'open_meteo' => 'Open-Meteo ਤੋਂ ਡੇਟਾ (CC-BY 4.0)',
			'rain' => 'ਮੀਂਹ',
			'mm_hg' => 'ਮਿ.ਮੀ ਪਾਰਾ',
			'validate180' => 'ਮੁੱਲ -180 ਅਤੇ 180 ਦੇ ਵਿਚਕਾਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ',
			'description' => 'ਕਿਸੇ ਵੀ ਸਥਾਨ ਲਈ ਹਰ ਘੰਟੇ, ਦਿਨ ਅਤੇ ਹਫ਼ਤੇ ਲਈ ਅਪ-ਟੂ-ਡੇਟ ਪੂਰਵ-ਅਨੁਮਾਨ ਦੇ ਨਾਲ ਮੌਸਮ ਐਪਲੀਕੇਸ਼ਨ।',
			'fahrenheit' => 'ਫਾਰਨਹਾਈਟ',
			'm_s' => 'ਮੀ/ਸੈ',
			'material_color' => 'ਗਤੀਸ਼ੀਲ ਰੰਗ',
			'confirm' => 'ਸੰਭਾਲੋ',
			'no_results' => 'ਕੋਈ ਨਤੀਜੇ ਨਹੀਂ',
			'cities_load_error' => 'ਸ਼ਹਿਰ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕੇ',
			'retry' => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼',
			'city_not_found' => 'ਸ਼ਹਿਰ ਨਹੀਂ ਮਿਲਿਆ',
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
			'last_updated' => 'ਅਪਡੇਟ ਕੀਤਾ',
			'app_font' => 'ਫੌਂਟ',
			'font_ubuntu' => 'Ubuntu (app)',
			'font_system' => 'System',
			'font_inter' => 'Inter',
			'font_open_sans' => 'Open Sans',
			'font_roboto' => 'Roboto',
			'font_barlow_condensed' => 'Barlow Condensed',
			'metric_help_apparent_temperature_min' => 'Lowest perceived temperature for the day, combining wind chill, humidity, and solar radiation.',
			'metric_help_apparent_temperature_max' => 'Highest perceived temperature for the day, combining wind chill, humidity, and solar radiation.',
			'metric_help_uv_index' => 'Ultraviolet radiation strength. Higher values mean faster sunburn and greater eye damage risk.',
			'metric_help_direction' => 'Compass direction the wind blows from (meteorological convention).',
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
