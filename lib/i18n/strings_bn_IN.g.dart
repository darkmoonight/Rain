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
class TranslationsBnIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsBnIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.bnIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <bn-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsBnIn _root = this; // ignore: unused_field

	@override 
	TranslationsBnIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsBnIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ইন্টারনেট নেই';
	@override String get edit_city_hint => 'শহরের তথ্য সম্পাদনা করুন';
	@override String get location_not_found => 'আপনার অবস্থান নির্ধারণ করা যায়নি';
	@override String get mi => 'মাইল';
	@override String get next => 'পরবর্তী';
	@override String get discard => 'বাতিল';
	@override String get east => 'পূর্ব';
	@override String get time_end => 'শেষ সময়';
	@override String get search_method => 'Use search or geolocation';
	@override String get hourly_variables => 'ঘণ্টায় আবহাওয়ার পরিবর্তনশীল';
	@override String get uv_index => 'আল্ট্রাভায়োলেট-সূচী';
	@override String get clear_sky => 'পরিষ্কার আকাশ';
	@override String get k_24 => '২৪-ঘণ্টা';
	@override String get no_weather_card => 'একটি শহর যোগ করুন';
	@override String get drizzle => 'বৃষ্টি বৃষ্টি';
	@override String get humidity => 'আর্দ্ধমন্দ';
	@override String get telegram => 'টেলিগ্রাম';
	@override String get functions => 'কার্য';
	@override String get cities => 'শহর';
	@override String get southeast => 'দক্ষিণপূর্ব';
	@override String get validate_number => 'দয়া করে একটি বৈধ সংখ্যা লিখুন';
	@override String get city => 'শহর';
	@override String get uv_high => 'উচ্চ';
	@override String get time => 'শহরে সময়';
	@override String get uv_low => 'নিম্ন';
	@override String get name3 => 'আমাদের সাথে যোগাযোগ করুন';
	@override String get apparent_temperature_min => 'ন্যায্য ন্যায্য তাপমাত্রা ন্যায্য ন্যায্য ন্যায্য ন্যায্য ন্যায্য ন্যায্য ন্যায্য';
	@override String get direction => 'দিশা';
	@override String get heavy_rains => 'Rain showers';
	@override String get apparent_temperature_max => 'সর্বাধিক ন্যায্য তাপমাত্রা';
	@override String get k_12 => '১২-ঘণ্টা';
	@override String get discord => 'ডিসকর্ড';
	@override String get discard_changes => 'আপনি কি নিশ্চিত যে আপনি আপনার পরিবর্তনগুলি বাতিল করতে চান?';
	@override String get notifications => 'বিজ্ঞপ্তি';
	@override String get mph => 'মাইল/ঘণ্টা';
	@override String get west => 'পশ্চিম';
	@override String get validate90 => 'মান -৯০ থেকে ৯০ মধ্যে হতে হবে';
	@override String get name2 => 'সুবিধাজনক ডিজাইন';
	@override String get feels => 'অনুভব';
	@override String get precipitation_probability => 'বৃষ্টিপাতের সম্ভাবনা';
	@override String get license => 'লাইসেন্স';
	@override String get widget_background => 'উইজেট পেশা';
	@override String get large_element => 'বড় আবহাওয়া ডিসপ্লে';
	@override String get unsaved_changes => 'সংরক্ষণ না করা পরিবর্তন';
	@override String get drizzling_rain => 'Freezing Drizzle';
	@override String get cloudy => 'মেঘলা';
	@override String get widget => 'উইজেট';
	@override String get precipitation => 'বৃষ্টিপাত';
	@override String get delete => 'মুছে ফেলুন';
	@override String get deleted_cache_store => 'ক্যাশ পরিষ্কার করা হচ্ছে';
	@override String get map => 'মানচিত্র';
	@override String get description3 => 'আপনার যদি কোনও সমস্যা হয়, অনুগ্রহ করে ইমেল বা অ্যাপ্লিকেশন পর্যালোচনার মাধ্যমে আমাদের সাথে যোগাযোগ করুন।';
	@override String get north => 'উত্তর';
	@override String get measurements => 'মাপনের সিস্টেম';
	@override String get start => 'শুরু করুন';
	@override String get settings_full => 'সেটিংস';
	@override String get high => 'উচ্চ';
	@override String get daily_variables => 'দৈনিক আবহাওয়ার পরিবর্তনশীল';
	@override String get low => 'নিম্ন';
	@override String get on_inter => 'মেটিয়োরোলজিক তথ্য পেতে ইন্টারনেট চালু করুন।';
	@override String get thunderstorm => 'বজ্রপাত';
	@override String get version => 'অ্যাপ্লিকেশন সংস্করণ';
	@override String get project => 'প্রকল্প';
	@override String get amoled_theme => 'এমোলেড-থিম';
	@override String get deleted_card_weather_query => 'আপনি কি নিশ্চিত যে আপনি শহরটি মুছতে চান?';
	@override String get northeast => 'উত্তরপূর্ব';
	@override String get add_widget => 'উইজেট যোগ করুন';
	@override String get fog => 'কুয়াশা';
	@override String get description2 => 'সমস্ত নেভিগেশনটি এমনভাবে তৈরি করা হয়েছে যাতে আপনি অ্যাপ্লিকেশনে সর্বোত্তম সুবিধায় এবং দ্রুত ইন্টারঅ্যাক্ট করতে পারেন।';
	@override String get mm => 'মিমি';
	@override String get no_desc_data => 'कोई डेटा नहीं';
	@override String get search_city => 'আপনার শহর খুঁজুন';
	@override String get weather_more => '১২-দিনের আবহাওয়া পূর্বানুমান';
	@override String get round_degree => 'ডিগ্রি রাউন্ড করুন';
	@override String get w_m2 => 'ডব্লিউ/মিটার বর্গ';
	@override String get create_city_hint => 'শহরের তথ্য অনুসন্ধান করুন বা ম্যানুয়ালি লিখুন';
	@override String get validate_name => 'দয়া করে নাম লিখুন';
	@override String get sunrise => 'সূর্যোদয়';
	@override String get km => 'কিমি';
	@override String get district => 'জেলা';
	@override String get southwest => 'দক্ষিণপশ্চিম';
	@override String get degrees => 'ডিগ্রি';
	@override String get clear_cache_store => 'ক্যাশ পরিষ্কার করুন';
	@override String get skip => 'এড়িয়ে যান';
	@override String get h_pa => 'হেক্টোপাস্কল';
	@override String get appearance => 'উপস্থিতি';
	@override String get time_start => 'শুরুর সময়';
	@override String get ready => 'প্রস্তুত';
	@override String get kph => 'কিমি/ঘণ্টা';
	@override String get deleted_cache_store_query => 'আপনি কি সত্যিই ক্যাশ পরিষ্কার করতে চান?';
	@override String get widget_text => 'উইজেট টেক্সট';
	@override String get support => 'সাহায্য';
	@override String get groups => 'আমাদের দলগুলি';
	@override String get system => 'সিস্টেম';
	@override String get sunset => 'সূর্যাস্ত';
	@override String get dewpoint => 'তুষার বিন্দু';
	@override String get shortwave_radiation => 'সংক্ষেপণ তরঙ্গ প্রকৃতি';
	@override String get language => 'ভাষা';
	@override String get hide_map => 'মানচিত্র লুকান';
	@override String get cancel => 'বাতিল করুন';
	@override String get loading => 'লোড হচ্ছে...';
	@override String get timeformat => 'সময় বিন্যাস';
	@override String get lat => 'অক্ষাংশ';
	@override String get data => 'ডেটা';
	@override String get visibility => 'দৃশ্যতা';
	@override String get deleted_card_weather => 'একটি শহর মুছে ফেলা হচ্ছে';
	@override String get celsius => 'সেলসিয়াস';
	@override String get no_location => 'বর্তমান অবস্থানের জন্য আবহাওয়া ডেটা পেতে অবস্থান সেবা সক্রিয় করুন।';
	@override String get create => 'তৈরি করুন';
	@override String get edit => 'সম্পাদনা';
	@override String get search => 'অনুসন্ধান...';
	@override String get uv_extreme => 'একাধিক';
	@override String get light => 'আলো';
	@override String get cloudcover => 'মেঘপর্দা';
	@override String get uv_very_high => 'অত্যন্ত উচ্চ';
	@override String get snow => 'তুষার';
	@override String get done => 'Done';
	@override String get theme => 'থিম';
	@override String get name => 'আবহাওয়া';
	@override String get time_range => 'সময় পরিস্থিতি (ঘণ্টায়)';
	@override String get about_app => 'অ্যাপ সম্পর্কে';
	@override String get save => 'সংরক্ষণ';
	@override String get evaporation => 'অবপাত ও প্রবাহ';
	@override String get freezing_rain => 'শীতল বৃষ্টি';
	@override String get uv_average => 'মধ্যম';
	@override String get reset_color => 'ডিফল্টে রিসেট করুন';
	@override String get metric => 'মেট্রিক';
	@override String get overcast => 'মেঘাচ্ছন্ন';
	@override String get pressure => 'চাপ';
	@override String get inch => 'ইঞ্চ';
	@override String get imperial => 'ইমপেরিয়াল';
	@override String get location => 'অবস্থান';
	@override String get error_occurred => 'একটি ত্রুটি হয়েছে';
	@override String get validate_value => 'দয়া করে একটি মান লিখুন';
	@override String get lon => 'দ্রাঘিমাংশ';
	@override String get wind => 'বায়ু';
	@override String get normal => 'সাধারণ';
	@override String get dark => 'ডার্ক';
	@override String get settings => 'সেটিংস';
	@override String get south => 'দক্ষিণ';
	@override String get windgusts => 'ঝংকার';
	@override String get northwest => 'উত্তরপশ্চিম';
	@override String get open_meteo => 'Open-Meteo থেকে ডেটা (CC-BY 4.0)';
	@override String get rain => 'বৃষ্টি';
	@override String get mm_hg => 'মিমি Hg';
	@override String get validate180 => 'মান -১৮০ থেকে ১৮০ মধ্যে হতে হবে';
	@override String get description => 'প্রতি ঘণ্টায়, দিনে এবং সপ্তাহের জন্য প্রতিষ্ঠানের জন্য সক্রিয় পূর্বাভাস সহ আবহাওয়া অ্যাপ্লিকেশন।';
	@override String get fahrenheit => 'ফারেনহাইট';
	@override String get m_s => 'মি/সে';
	@override String get material_color => 'গতিবিধির রঙ';
	@override String get confirm => 'সংরক্ষণ';
	@override String get no_results => 'কোনো ফলাফল নেই';
	@override String get cities_load_error => 'শহরগুলো লোড করা যায়নি';
	@override String get retry => 'আবার চেষ্টা';
	@override String get city_not_found => 'শহর পাওয়া যায়নি';
	@override String get air_quality => 'বায়ুর গুণমান';
	@override String get aqi_standard => 'AQI মান';
	@override String get aqi_european => 'ইউরোপীয় AQI';
	@override String get aqi_american => 'আমেরিকান AQI';
	@override String get aqi_good => 'ভালো';
	@override String get aqi_fair => 'মোটামুটি';
	@override String get aqi_moderate => 'মাঝারি';
	@override String get aqi_poor => 'খারাপ';
	@override String get aqi_very_poor => 'খুব খারাপ';
	@override String get aqi_extremely_poor => 'অত্যন্ত খারাপ';
	@override String get aqi_unhealthy_sensitive => 'সংবেদনশীলদের জন্য ক্ষতিকর';
	@override String get aqi_unhealthy => 'ক্ষতিকর';
	@override String get aqi_very_unhealthy => 'খুব ক্ষতিকর';
	@override String get aqi_hazardous => 'বিপজ্জনক';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'ইউরোপীয়';
	@override String get american => 'আমেরিকান';
	@override String get aqi_advice_good => 'Great air for outdoor activities.';
	@override String get aqi_advice_fair => 'Generally fine. Sensitive people may want to limit long outdoor exertion.';
	@override String get aqi_advice_moderate => 'Sensitive groups should reduce prolonged time outdoors.';
	@override String get aqi_advice_poor => 'Limit outdoor activity, especially if you are sensitive to air pollution.';
	@override String get aqi_advice_very_poor => 'Avoid prolonged outdoor exertion. Everyone may feel health effects.';
	@override String get aqi_advice_extremely_poor => 'Stay indoors if possible. Outdoor activity is not recommended.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Pollutants';
}

/// The flat map containing all translations for locale <bn-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsBnIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ইন্টারনেট নেই',
			'edit_city_hint' => 'শহরের তথ্য সম্পাদনা করুন',
			'location_not_found' => 'আপনার অবস্থান নির্ধারণ করা যায়নি',
			'mi' => 'মাইল',
			'next' => 'পরবর্তী',
			'discard' => 'বাতিল',
			'east' => 'পূর্ব',
			'time_end' => 'শেষ সময়',
			'search_method' => 'Use search or geolocation',
			'hourly_variables' => 'ঘণ্টায় আবহাওয়ার পরিবর্তনশীল',
			'uv_index' => 'আল্ট্রাভায়োলেট-সূচী',
			'clear_sky' => 'পরিষ্কার আকাশ',
			'k_24' => '২৪-ঘণ্টা',
			'no_weather_card' => 'একটি শহর যোগ করুন',
			'drizzle' => 'বৃষ্টি বৃষ্টি',
			'humidity' => 'আর্দ্ধমন্দ',
			'telegram' => 'টেলিগ্রাম',
			'functions' => 'কার্য',
			'cities' => 'শহর',
			'southeast' => 'দক্ষিণপূর্ব',
			'validate_number' => 'দয়া করে একটি বৈধ সংখ্যা লিখুন',
			'city' => 'শহর',
			'uv_high' => 'উচ্চ',
			'time' => 'শহরে সময়',
			'uv_low' => 'নিম্ন',
			'name3' => 'আমাদের সাথে যোগাযোগ করুন',
			'apparent_temperature_min' => 'ন্যায্য ন্যায্য তাপমাত্রা ন্যায্য ন্যায্য ন্যায্য ন্যায্য ন্যায্য ন্যায্য ন্যায্য',
			'direction' => 'দিশা',
			'heavy_rains' => 'Rain showers',
			'apparent_temperature_max' => 'সর্বাধিক ন্যায্য তাপমাত্রা',
			'k_12' => '১২-ঘণ্টা',
			'discord' => 'ডিসকর্ড',
			'discard_changes' => 'আপনি কি নিশ্চিত যে আপনি আপনার পরিবর্তনগুলি বাতিল করতে চান?',
			'notifications' => 'বিজ্ঞপ্তি',
			'mph' => 'মাইল/ঘণ্টা',
			'west' => 'পশ্চিম',
			'validate90' => 'মান -৯০ থেকে ৯০ মধ্যে হতে হবে',
			'name2' => 'সুবিধাজনক ডিজাইন',
			'feels' => 'অনুভব',
			'precipitation_probability' => 'বৃষ্টিপাতের সম্ভাবনা',
			'license' => 'লাইসেন্স',
			'widget_background' => 'উইজেট পেশা',
			'large_element' => 'বড় আবহাওয়া ডিসপ্লে',
			'unsaved_changes' => 'সংরক্ষণ না করা পরিবর্তন',
			'drizzling_rain' => 'Freezing Drizzle',
			'cloudy' => 'মেঘলা',
			'widget' => 'উইজেট',
			'precipitation' => 'বৃষ্টিপাত',
			'delete' => 'মুছে ফেলুন',
			'deleted_cache_store' => 'ক্যাশ পরিষ্কার করা হচ্ছে',
			'map' => 'মানচিত্র',
			'description3' => 'আপনার যদি কোনও সমস্যা হয়, অনুগ্রহ করে ইমেল বা অ্যাপ্লিকেশন পর্যালোচনার মাধ্যমে আমাদের সাথে যোগাযোগ করুন।',
			'north' => 'উত্তর',
			'measurements' => 'মাপনের সিস্টেম',
			'start' => 'শুরু করুন',
			'settings_full' => 'সেটিংস',
			'high' => 'উচ্চ',
			'daily_variables' => 'দৈনিক আবহাওয়ার পরিবর্তনশীল',
			'low' => 'নিম্ন',
			'on_inter' => 'মেটিয়োরোলজিক তথ্য পেতে ইন্টারনেট চালু করুন।',
			'thunderstorm' => 'বজ্রপাত',
			'version' => 'অ্যাপ্লিকেশন সংস্করণ',
			'project' => 'প্রকল্প',
			'amoled_theme' => 'এমোলেড-থিম',
			'deleted_card_weather_query' => 'আপনি কি নিশ্চিত যে আপনি শহরটি মুছতে চান?',
			'northeast' => 'উত্তরপূর্ব',
			'add_widget' => 'উইজেট যোগ করুন',
			'fog' => 'কুয়াশা',
			'description2' => 'সমস্ত নেভিগেশনটি এমনভাবে তৈরি করা হয়েছে যাতে আপনি অ্যাপ্লিকেশনে সর্বোত্তম সুবিধায় এবং দ্রুত ইন্টারঅ্যাক্ট করতে পারেন।',
			'mm' => 'মিমি',
			'no_desc_data' => 'कोई डेटा नहीं',
			'search_city' => 'আপনার শহর খুঁজুন',
			'weather_more' => '১২-দিনের আবহাওয়া পূর্বানুমান',
			'round_degree' => 'ডিগ্রি রাউন্ড করুন',
			'w_m2' => 'ডব্লিউ/মিটার বর্গ',
			'create_city_hint' => 'শহরের তথ্য অনুসন্ধান করুন বা ম্যানুয়ালি লিখুন',
			'validate_name' => 'দয়া করে নাম লিখুন',
			'sunrise' => 'সূর্যোদয়',
			'km' => 'কিমি',
			'district' => 'জেলা',
			'southwest' => 'দক্ষিণপশ্চিম',
			'degrees' => 'ডিগ্রি',
			'clear_cache_store' => 'ক্যাশ পরিষ্কার করুন',
			'skip' => 'এড়িয়ে যান',
			'h_pa' => 'হেক্টোপাস্কল',
			'appearance' => 'উপস্থিতি',
			'time_start' => 'শুরুর সময়',
			'ready' => 'প্রস্তুত',
			'kph' => 'কিমি/ঘণ্টা',
			'deleted_cache_store_query' => 'আপনি কি সত্যিই ক্যাশ পরিষ্কার করতে চান?',
			'widget_text' => 'উইজেট টেক্সট',
			'support' => 'সাহায্য',
			'groups' => 'আমাদের দলগুলি',
			'system' => 'সিস্টেম',
			'sunset' => 'সূর্যাস্ত',
			'dewpoint' => 'তুষার বিন্দু',
			'shortwave_radiation' => 'সংক্ষেপণ তরঙ্গ প্রকৃতি',
			'language' => 'ভাষা',
			'hide_map' => 'মানচিত্র লুকান',
			'cancel' => 'বাতিল করুন',
			'loading' => 'লোড হচ্ছে...',
			'timeformat' => 'সময় বিন্যাস',
			'lat' => 'অক্ষাংশ',
			'data' => 'ডেটা',
			'visibility' => 'দৃশ্যতা',
			'deleted_card_weather' => 'একটি শহর মুছে ফেলা হচ্ছে',
			'celsius' => 'সেলসিয়াস',
			'no_location' => 'বর্তমান অবস্থানের জন্য আবহাওয়া ডেটা পেতে অবস্থান সেবা সক্রিয় করুন।',
			'create' => 'তৈরি করুন',
			'edit' => 'সম্পাদনা',
			'search' => 'অনুসন্ধান...',
			'uv_extreme' => 'একাধিক',
			'light' => 'আলো',
			'cloudcover' => 'মেঘপর্দা',
			'uv_very_high' => 'অত্যন্ত উচ্চ',
			'snow' => 'তুষার',
			'done' => 'Done',
			'theme' => 'থিম',
			'name' => 'আবহাওয়া',
			'time_range' => 'সময় পরিস্থিতি (ঘণ্টায়)',
			'about_app' => 'অ্যাপ সম্পর্কে',
			'save' => 'সংরক্ষণ',
			'evaporation' => 'অবপাত ও প্রবাহ',
			'freezing_rain' => 'শীতল বৃষ্টি',
			'uv_average' => 'মধ্যম',
			'reset_color' => 'ডিফল্টে রিসেট করুন',
			'metric' => 'মেট্রিক',
			'overcast' => 'মেঘাচ্ছন্ন',
			'pressure' => 'চাপ',
			'inch' => 'ইঞ্চ',
			'imperial' => 'ইমপেরিয়াল',
			'location' => 'অবস্থান',
			'error_occurred' => 'একটি ত্রুটি হয়েছে',
			'validate_value' => 'দয়া করে একটি মান লিখুন',
			'lon' => 'দ্রাঘিমাংশ',
			'wind' => 'বায়ু',
			'normal' => 'সাধারণ',
			'dark' => 'ডার্ক',
			'settings' => 'সেটিংস',
			'south' => 'দক্ষিণ',
			'windgusts' => 'ঝংকার',
			'northwest' => 'উত্তরপশ্চিম',
			'open_meteo' => 'Open-Meteo থেকে ডেটা (CC-BY 4.0)',
			'rain' => 'বৃষ্টি',
			'mm_hg' => 'মিমি Hg',
			'validate180' => 'মান -১৮০ থেকে ১৮০ মধ্যে হতে হবে',
			'description' => 'প্রতি ঘণ্টায়, দিনে এবং সপ্তাহের জন্য প্রতিষ্ঠানের জন্য সক্রিয় পূর্বাভাস সহ আবহাওয়া অ্যাপ্লিকেশন।',
			'fahrenheit' => 'ফারেনহাইট',
			'm_s' => 'মি/সে',
			'material_color' => 'গতিবিধির রঙ',
			'confirm' => 'সংরক্ষণ',
			'no_results' => 'কোনো ফলাফল নেই',
			'cities_load_error' => 'শহরগুলো লোড করা যায়নি',
			'retry' => 'আবার চেষ্টা',
			'city_not_found' => 'শহর পাওয়া যায়নি',
			'air_quality' => 'বায়ুর গুণমান',
			'aqi_standard' => 'AQI মান',
			'aqi_european' => 'ইউরোপীয় AQI',
			'aqi_american' => 'আমেরিকান AQI',
			'aqi_good' => 'ভালো',
			'aqi_fair' => 'মোটামুটি',
			'aqi_moderate' => 'মাঝারি',
			'aqi_poor' => 'খারাপ',
			'aqi_very_poor' => 'খুব খারাপ',
			'aqi_extremely_poor' => 'অত্যন্ত খারাপ',
			'aqi_unhealthy_sensitive' => 'সংবেদনশীলদের জন্য ক্ষতিকর',
			'aqi_unhealthy' => 'ক্ষতিকর',
			'aqi_very_unhealthy' => 'খুব ক্ষতিকর',
			'aqi_hazardous' => 'বিপজ্জনক',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'ইউরোপীয়',
			'american' => 'আমেরিকান',
			'aqi_advice_good' => 'Great air for outdoor activities.',
			'aqi_advice_fair' => 'Generally fine. Sensitive people may want to limit long outdoor exertion.',
			'aqi_advice_moderate' => 'Sensitive groups should reduce prolonged time outdoors.',
			'aqi_advice_poor' => 'Limit outdoor activity, especially if you are sensitive to air pollution.',
			'aqi_advice_very_poor' => 'Avoid prolonged outdoor exertion. Everyone may feel health effects.',
			'aqi_advice_extremely_poor' => 'Stay indoors if possible. Outdoor activity is not recommended.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Pollutants',
			_ => null,
		};
	}
}
