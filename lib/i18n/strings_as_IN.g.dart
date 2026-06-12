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
class TranslationsAsIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAsIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.asIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <as-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAsIn _root = this; // ignore: unused_field

	@override 
	TranslationsAsIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAsIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ইণ্টাৰনেট নাই';
	@override String get edit_city_hint => 'চহৰৰ তথ্য সম্পাদনা কৰক';
	@override String get location_not_found => 'আপোনাৰ অৱস্থান নিৰ্ধাৰণ কৰিব পৰা নগ\'ল';
	@override String get mi => 'মাইল';
	@override String get next => 'পৰৱৰ্তী';
	@override String get discard => 'বাদ দিয়ক';
	@override String get east => 'পূব';
	@override String get time_end => 'শেষৰ সময়';
	@override String get search_method => 'অনুসন্ধান বা ভৌগোলিক অৱস্থান ব্যৱহাৰ কৰক';
	@override String get hourly_variables => 'ঘণ্টাভিত্তিক বতৰৰ চলক';
	@override String get uv_index => 'UV সূচক';
	@override String get clear_sky => 'পৰিষ্কাৰ আকাশ';
	@override String get k_24 => '24-ঘণ্টা';
	@override String get no_weather_card => 'চহৰ যোগ কৰক';
	@override String get drizzle => 'গুড়ি গুড়ি বৰষুণ';
	@override String get humidity => 'আৰ্দ্ৰতা';
	@override String get telegram => 'টেলিগ্ৰাম';
	@override String get functions => 'কাৰ্যসমূহ';
	@override String get cities => 'চহৰসমূহ';
	@override String get southeast => 'দক্ষিণ-পূব';
	@override String get validate_number => 'অনুগ্ৰহ কৰি এটা বৈধ সংখ্যা দিয়ক';
	@override String get city => 'চহৰ';
	@override String get uv_high => 'বেছি';
	@override String get time => 'চহৰত সময়';
	@override String get uv_low => 'কম';
	@override String get name3 => 'আমাৰ সৈতে যোগাযোগ কৰক';
	@override String get apparent_temperature_min => 'নূন্যতম স্পষ্ট উষ্ণতা';
	@override String get direction => 'দিশ';
	@override String get heavy_rains => 'বৰষুণৰ ধাৰা';
	@override String get apparent_temperature_max => 'সৰ্বোচ্চ স্পষ্ট উষ্ণতা';
	@override String get k_12 => '12-ঘণ্টা';
	@override String get discord => 'ডিস্কৰ্ড';
	@override String get discard_changes => 'আপুনি সঁচাকৈয়ে আপোনাৰ পৰিৱৰ্তনসমূহ বাদ দিব বিচাৰে নেকি?';
	@override String get notifications => 'জাননী';
	@override String get mph => 'মাইল/ঘণ্টা';
	@override String get west => 'পশ্চিম';
	@override String get validate90 => 'মান -90 আৰু 90 ৰ মাজত হ\'ব লাগিব';
	@override String get name2 => 'সুবিধাজনক ডিজাইন';
	@override String get feels => 'অনুভৱ হয়';
	@override String get precipitation_probability => 'বৰষুণৰ সম্ভাৱনা';
	@override String get license => 'অনুজ্ঞাপত্ৰ';
	@override String get widget_background => 'ৱিজেট পটভূমি';
	@override String get large_element => 'ডাঙৰ বতৰ প্ৰদৰ্শন';
	@override String get unsaved_changes => 'সংৰক্ষণ নকৰা পৰিৱৰ্তন';
	@override String get drizzling_rain => 'জমা হোৱা গুড়ি গুড়ি বৰষুণ';
	@override String get cloudy => 'মেঘাচ্ছন্ন';
	@override String get widget => 'ৱিজেট';
	@override String get precipitation => 'বৰষুণ';
	@override String get delete => 'মচক';
	@override String get deleted_cache_store => 'কেশ্ব পৰিষ্কাৰ কৰি আছে';
	@override String get map => 'মানচিত্ৰ';
	@override String get description3 => 'যদি আপুনি কোনো সমস্যাৰ সন্মুখীন হয়, অনুগ্ৰহ কৰি ইমেইলৰ জৰিয়তে বা এপ্লিকেচন পৰ্যালোচনাত আমাৰ সৈতে যোগাযোগ কৰক।';
	@override String get north => 'উত্তৰ';
	@override String get measurements => 'পৰিমাপ প্ৰণালী';
	@override String get start => 'আৰম্ভ কৰক';
	@override String get settings_full => 'ছেটিংছ';
	@override String get high => 'বেছি';
	@override String get daily_variables => 'দৈনিক বতৰৰ চলক';
	@override String get low => 'কম';
	@override String get on_inter => 'বতৰৰ তথ্য পাবলৈ ইণ্টাৰনেট অন কৰক।';
	@override String get thunderstorm => 'বজ্ৰবিদ্যুৎ';
	@override String get version => 'এপ্লিকেচন সংস্কৰণ';
	@override String get project => 'প্ৰকল্প চলি আছে';
	@override String get amoled_theme => 'AMOLED থিম';
	@override String get deleted_card_weather_query => 'আপুনি সঁচাকৈয়ে চহৰটো মচিব বিচাৰে নেকি?';
	@override String get northeast => 'উত্তৰ-পূব';
	@override String get add_widget => 'ৱিজেট যোগ কৰক';
	@override String get fog => 'কুঁৱলী';
	@override String get description2 => 'সকলো নেভিগেচন এপ্লিকেচনৰ সৈতে যিমান পাৰি সুবিধাজনক আৰু দ্ৰুতভাৱে যোগাযোগ কৰিবলৈ ডিজাইন কৰা হৈছে।';
	@override String get mm => 'মি.মি.';
	@override String get search_city => 'আপোনাৰ চহৰ বিচাৰি উলিয়াওক';
	@override String get weather_more => '12-দিনৰ বতৰৰ পূৰ্বাভাস';
	@override String get round_degree => 'ঘূৰণীয়া ডিগ্ৰী';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'চহৰৰ তথ্য বিচাৰক বা মেনুৱেলভাৱে প্ৰৱেশ কৰক';
	@override String get validate_name => 'অনুগ্ৰহ কৰি নাম দিয়ক';
	@override String get sunrise => 'সূৰ্যোদয়';
	@override String get km => 'কি.মি.';
	@override String get district => 'জিলা';
	@override String get southwest => 'দক্ষিণ-পশ্চিম';
	@override String get degrees => 'ডিগ্ৰী';
	@override String get clear_cache_store => 'কেশ্ব পৰিষ্কাৰ কৰক';
	@override String get skip => 'এৰি যোৱা';
	@override String get h_pa => 'হেক্টোপাস্কেল';
	@override String get appearance => 'ৰূপ';
	@override String get time_start => 'আৰম্ভণিৰ সময়';
	@override String get ready => 'সাজু';
	@override String get kph => 'কি.মি./ঘণ্টা';
	@override String get deleted_cache_store_query => 'আপুনি সঁচাকৈয়ে কেশ্ব পৰিষ্কাৰ কৰিব বিচাৰে নেকি?';
	@override String get widget_text => 'ৱিজেট পাঠ';
	@override String get support => 'দান কৰক';
	@override String get groups => 'আমাৰ গোট';
	@override String get system => 'ব্যৱস্থা';
	@override String get sunset => 'সূৰ্যাস্ত';
	@override String get dewpoint => 'শিশিৰ বিন্দু';
	@override String get shortwave_radiation => 'চুটি তৰংগ বিকিৰণ';
	@override String get language => 'ভাষা';
	@override String get hide_map => 'মানচিত্ৰ লুকুৱাওক';
	@override String get cancel => 'বাতিল কৰক';
	@override String get loading => 'লোড হৈ আছে...';
	@override String get timeformat => 'সময় বিন্যাস';
	@override String get lat => 'অক্ষাংশ';
	@override String get data => 'তথ্য';
	@override String get visibility => 'দৃশ্যমানতা';
	@override String get deleted_card_weather => 'চহৰ মচক';
	@override String get celsius => 'চেলছিয়াছ';
	@override String get no_location => 'বৰ্তমানৰ স্থানৰ বাবে বতৰৰ তথ্য পাবলৈ অৱস্থান সেৱা সক্ষম কৰক।';
	@override String get create => 'সৃষ্টি কৰক';
	@override String get edit => 'সম্পাদনা কৰক';
	@override String get search => 'বিচাৰক...';
	@override String get uv_extreme => 'চৰম';
	@override String get light => 'পোহৰ';
	@override String get cloudcover => 'মেঘৰ আৱৰণ';
	@override String get uv_very_high => 'অতি বেছি';
	@override String get snow => 'বৰফ';
	@override String get done => 'সম্পন্ন';
	@override String get theme => 'থিম';
	@override String get name => 'বতৰ';
	@override String get time_range => 'কম্পাঙ্ক (ঘণ্টাত)';
	@override String get about_app => 'এপৰ বিষয়ে';
	@override String get save => 'সংৰক্ষণ';
	@override String get evaporation => 'বাষ্পীভৱন';
	@override String get freezing_rain => 'জমা হোৱা বৰষুণ';
	@override String get uv_average => 'মধ্যম';
	@override String get reset_color => 'ডিফল্টলৈ ৰিছেট কৰক';
	@override String get metric => 'মেট্ৰিক';
	@override String get overcast => 'মেঘেৰে আবৃত';
	@override String get pressure => 'চাপ';
	@override String get inch => 'ইঞ্চি';
	@override String get imperial => 'ইম্পেৰিয়েল';
	@override String get location => 'স্থান';
	@override String get error_occurred => 'এটা ত্ৰুটি হৈছে';
	@override String get validate_value => 'অনুগ্ৰহ কৰি মান দিয়ক';
	@override String get lon => 'দ্ৰাঘিমাংশ';
	@override String get wind => 'বতাহ';
	@override String get normal => 'স্বাভাৱিক';
	@override String get dark => 'আন্ধাৰ';
	@override String get settings => 'ছেটিংছ';
	@override String get south => 'দক্ষিণ';
	@override String get windgusts => 'বতাহৰ ঝাপটা';
	@override String get northwest => 'উত্তৰ-পশ্চিম';
	@override String get open_meteo => 'Open-Meteo ৰ পৰা তথ্য (CC-BY 4.0)';
	@override String get rain => 'বৰষুণ';
	@override String get mm_hg => 'মি.মি. পাৰা';
	@override String get validate180 => 'মান -180 আৰু 180 ৰ মাজত হ\'ব লাগিব';
	@override String get description => 'যিকোনো স্থানৰ বাবে প্ৰতি ঘণ্টা, দিন আৰু সপ্তাহৰ বাবে আপডেট কৰা পূৰ্বাভাসৰ সৈতে বতৰ এপ্লিকেচন।';
	@override String get fahrenheit => 'ফাৰেনহাইট';
	@override String get m_s => 'মি./ছে.';
	@override String get material_color => 'গতিশীল ৰং';
	@override String get confirm => 'সংৰক্ষণ';
	@override String get no_results => 'কোনো ফলাফল নাই';
	@override String get cities_load_error => 'চহৰসমূহ ল\'ড কৰিব পৰা নগ\'ল';
	@override String get retry => 'পুনৰ চেষ্টা';
	@override String get city_not_found => 'চহৰ পোৱা নগ\'ল';
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
	@override String get last_updated => 'আপডেট কৰা হৈছে';
	@override String get app_font => 'ফন্ট';
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
	@override String get today => 'আজ';
	@override String get tomorrow => 'কাইলৈ';
}

/// The flat map containing all translations for locale <as-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAsIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ইণ্টাৰনেট নাই',
			'edit_city_hint' => 'চহৰৰ তথ্য সম্পাদনা কৰক',
			'location_not_found' => 'আপোনাৰ অৱস্থান নিৰ্ধাৰণ কৰিব পৰা নগ\'ল',
			'mi' => 'মাইল',
			'next' => 'পৰৱৰ্তী',
			'discard' => 'বাদ দিয়ক',
			'east' => 'পূব',
			'time_end' => 'শেষৰ সময়',
			'search_method' => 'অনুসন্ধান বা ভৌগোলিক অৱস্থান ব্যৱহাৰ কৰক',
			'hourly_variables' => 'ঘণ্টাভিত্তিক বতৰৰ চলক',
			'uv_index' => 'UV সূচক',
			'clear_sky' => 'পৰিষ্কাৰ আকাশ',
			'k_24' => '24-ঘণ্টা',
			'no_weather_card' => 'চহৰ যোগ কৰক',
			'drizzle' => 'গুড়ি গুড়ি বৰষুণ',
			'humidity' => 'আৰ্দ্ৰতা',
			'telegram' => 'টেলিগ্ৰাম',
			'functions' => 'কাৰ্যসমূহ',
			'cities' => 'চহৰসমূহ',
			'southeast' => 'দক্ষিণ-পূব',
			'validate_number' => 'অনুগ্ৰহ কৰি এটা বৈধ সংখ্যা দিয়ক',
			'city' => 'চহৰ',
			'uv_high' => 'বেছি',
			'time' => 'চহৰত সময়',
			'uv_low' => 'কম',
			'name3' => 'আমাৰ সৈতে যোগাযোগ কৰক',
			'apparent_temperature_min' => 'নূন্যতম স্পষ্ট উষ্ণতা',
			'direction' => 'দিশ',
			'heavy_rains' => 'বৰষুণৰ ধাৰা',
			'apparent_temperature_max' => 'সৰ্বোচ্চ স্পষ্ট উষ্ণতা',
			'k_12' => '12-ঘণ্টা',
			'discord' => 'ডিস্কৰ্ড',
			'discard_changes' => 'আপুনি সঁচাকৈয়ে আপোনাৰ পৰিৱৰ্তনসমূহ বাদ দিব বিচাৰে নেকি?',
			'notifications' => 'জাননী',
			'mph' => 'মাইল/ঘণ্টা',
			'west' => 'পশ্চিম',
			'validate90' => 'মান -90 আৰু 90 ৰ মাজত হ\'ব লাগিব',
			'name2' => 'সুবিধাজনক ডিজাইন',
			'feels' => 'অনুভৱ হয়',
			'precipitation_probability' => 'বৰষুণৰ সম্ভাৱনা',
			'license' => 'অনুজ্ঞাপত্ৰ',
			'widget_background' => 'ৱিজেট পটভূমি',
			'large_element' => 'ডাঙৰ বতৰ প্ৰদৰ্শন',
			'unsaved_changes' => 'সংৰক্ষণ নকৰা পৰিৱৰ্তন',
			'drizzling_rain' => 'জমা হোৱা গুড়ি গুড়ি বৰষুণ',
			'cloudy' => 'মেঘাচ্ছন্ন',
			'widget' => 'ৱিজেট',
			'precipitation' => 'বৰষুণ',
			'delete' => 'মচক',
			'deleted_cache_store' => 'কেশ্ব পৰিষ্কাৰ কৰি আছে',
			'map' => 'মানচিত্ৰ',
			'description3' => 'যদি আপুনি কোনো সমস্যাৰ সন্মুখীন হয়, অনুগ্ৰহ কৰি ইমেইলৰ জৰিয়তে বা এপ্লিকেচন পৰ্যালোচনাত আমাৰ সৈতে যোগাযোগ কৰক।',
			'north' => 'উত্তৰ',
			'measurements' => 'পৰিমাপ প্ৰণালী',
			'start' => 'আৰম্ভ কৰক',
			'settings_full' => 'ছেটিংছ',
			'high' => 'বেছি',
			'daily_variables' => 'দৈনিক বতৰৰ চলক',
			'low' => 'কম',
			'on_inter' => 'বতৰৰ তথ্য পাবলৈ ইণ্টাৰনেট অন কৰক।',
			'thunderstorm' => 'বজ্ৰবিদ্যুৎ',
			'version' => 'এপ্লিকেচন সংস্কৰণ',
			'project' => 'প্ৰকল্প চলি আছে',
			'amoled_theme' => 'AMOLED থিম',
			'deleted_card_weather_query' => 'আপুনি সঁচাকৈয়ে চহৰটো মচিব বিচাৰে নেকি?',
			'northeast' => 'উত্তৰ-পূব',
			'add_widget' => 'ৱিজেট যোগ কৰক',
			'fog' => 'কুঁৱলী',
			'description2' => 'সকলো নেভিগেচন এপ্লিকেচনৰ সৈতে যিমান পাৰি সুবিধাজনক আৰু দ্ৰুতভাৱে যোগাযোগ কৰিবলৈ ডিজাইন কৰা হৈছে।',
			'mm' => 'মি.মি.',
			'search_city' => 'আপোনাৰ চহৰ বিচাৰি উলিয়াওক',
			'weather_more' => '12-দিনৰ বতৰৰ পূৰ্বাভাস',
			'round_degree' => 'ঘূৰণীয়া ডিগ্ৰী',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'চহৰৰ তথ্য বিচাৰক বা মেনুৱেলভাৱে প্ৰৱেশ কৰক',
			'validate_name' => 'অনুগ্ৰহ কৰি নাম দিয়ক',
			'sunrise' => 'সূৰ্যোদয়',
			'km' => 'কি.মি.',
			'district' => 'জিলা',
			'southwest' => 'দক্ষিণ-পশ্চিম',
			'degrees' => 'ডিগ্ৰী',
			'clear_cache_store' => 'কেশ্ব পৰিষ্কাৰ কৰক',
			'skip' => 'এৰি যোৱা',
			'h_pa' => 'হেক্টোপাস্কেল',
			'appearance' => 'ৰূপ',
			'time_start' => 'আৰম্ভণিৰ সময়',
			'ready' => 'সাজু',
			'kph' => 'কি.মি./ঘণ্টা',
			'deleted_cache_store_query' => 'আপুনি সঁচাকৈয়ে কেশ্ব পৰিষ্কাৰ কৰিব বিচাৰে নেকি?',
			'widget_text' => 'ৱিজেট পাঠ',
			'support' => 'দান কৰক',
			'groups' => 'আমাৰ গোট',
			'system' => 'ব্যৱস্থা',
			'sunset' => 'সূৰ্যাস্ত',
			'dewpoint' => 'শিশিৰ বিন্দু',
			'shortwave_radiation' => 'চুটি তৰংগ বিকিৰণ',
			'language' => 'ভাষা',
			'hide_map' => 'মানচিত্ৰ লুকুৱাওক',
			'cancel' => 'বাতিল কৰক',
			'loading' => 'লোড হৈ আছে...',
			'timeformat' => 'সময় বিন্যাস',
			'lat' => 'অক্ষাংশ',
			'data' => 'তথ্য',
			'visibility' => 'দৃশ্যমানতা',
			'deleted_card_weather' => 'চহৰ মচক',
			'celsius' => 'চেলছিয়াছ',
			'no_location' => 'বৰ্তমানৰ স্থানৰ বাবে বতৰৰ তথ্য পাবলৈ অৱস্থান সেৱা সক্ষম কৰক।',
			'create' => 'সৃষ্টি কৰক',
			'edit' => 'সম্পাদনা কৰক',
			'search' => 'বিচাৰক...',
			'uv_extreme' => 'চৰম',
			'light' => 'পোহৰ',
			'cloudcover' => 'মেঘৰ আৱৰণ',
			'uv_very_high' => 'অতি বেছি',
			'snow' => 'বৰফ',
			'done' => 'সম্পন্ন',
			'theme' => 'থিম',
			'name' => 'বতৰ',
			'time_range' => 'কম্পাঙ্ক (ঘণ্টাত)',
			'about_app' => 'এপৰ বিষয়ে',
			'save' => 'সংৰক্ষণ',
			'evaporation' => 'বাষ্পীভৱন',
			'freezing_rain' => 'জমা হোৱা বৰষুণ',
			'uv_average' => 'মধ্যম',
			'reset_color' => 'ডিফল্টলৈ ৰিছেট কৰক',
			'metric' => 'মেট্ৰিক',
			'overcast' => 'মেঘেৰে আবৃত',
			'pressure' => 'চাপ',
			'inch' => 'ইঞ্চি',
			'imperial' => 'ইম্পেৰিয়েল',
			'location' => 'স্থান',
			'error_occurred' => 'এটা ত্ৰুটি হৈছে',
			'validate_value' => 'অনুগ্ৰহ কৰি মান দিয়ক',
			'lon' => 'দ্ৰাঘিমাংশ',
			'wind' => 'বতাহ',
			'normal' => 'স্বাভাৱিক',
			'dark' => 'আন্ধাৰ',
			'settings' => 'ছেটিংছ',
			'south' => 'দক্ষিণ',
			'windgusts' => 'বতাহৰ ঝাপটা',
			'northwest' => 'উত্তৰ-পশ্চিম',
			'open_meteo' => 'Open-Meteo ৰ পৰা তথ্য (CC-BY 4.0)',
			'rain' => 'বৰষুণ',
			'mm_hg' => 'মি.মি. পাৰা',
			'validate180' => 'মান -180 আৰু 180 ৰ মাজত হ\'ব লাগিব',
			'description' => 'যিকোনো স্থানৰ বাবে প্ৰতি ঘণ্টা, দিন আৰু সপ্তাহৰ বাবে আপডেট কৰা পূৰ্বাভাসৰ সৈতে বতৰ এপ্লিকেচন।',
			'fahrenheit' => 'ফাৰেনহাইট',
			'm_s' => 'মি./ছে.',
			'material_color' => 'গতিশীল ৰং',
			'confirm' => 'সংৰক্ষণ',
			'no_results' => 'কোনো ফলাফল নাই',
			'cities_load_error' => 'চহৰসমূহ ল\'ড কৰিব পৰা নগ\'ল',
			'retry' => 'পুনৰ চেষ্টা',
			'city_not_found' => 'চহৰ পোৱা নগ\'ল',
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
			'last_updated' => 'আপডেট কৰা হৈছে',
			'app_font' => 'ফন্ট',
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
			'today' => 'আজ',
			'tomorrow' => 'কাইলৈ',
			_ => null,
		};
	}
}
