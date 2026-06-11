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
class TranslationsHiIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHiIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hiIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHiIn _root = this; // ignore: unused_field

	@override 
	TranslationsHiIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHiIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'कोई इंटरनेट नहीं है';
	@override String get edit_city_hint => 'शहर की जानकारी संपादित करें';
	@override String get location_not_found => 'आपका स्थान निर्धारित नहीं किया जा सका';
	@override String get mi => 'मील';
	@override String get next => 'आगे';
	@override String get discard => 'छोड़ें';
	@override String get east => 'पूर्व';
	@override String get time_end => 'समाप्ति समय';
	@override String get search_method => 'खोज या स्थानगति का उपयोग करें';
	@override String get hourly_variables => 'घंटेवार मौसम चर';
	@override String get uv_index => 'यूवी-सूचकांक';
	@override String get clear_sky => 'साफ आकाश';
	@override String get k_24 => '२४ घंटा';
	@override String get no_weather_card => 'शहर जोड़ें';
	@override String get drizzle => 'बूंदाबांदी';
	@override String get humidity => 'नमी';
	@override String get telegram => 'टेलीग्राम';
	@override String get functions => 'कार्य';
	@override String get cities => 'शहर';
	@override String get southeast => 'दक्षिण-पूर्व';
	@override String get validate_number => 'कृपया एक मान्य संख्या दर्ज करें';
	@override String get city => 'शहर';
	@override String get uv_high => 'उच्च';
	@override String get time => 'शहर में समय';
	@override String get uv_low => 'कम';
	@override String get name3 => 'हमे संपर्क करें';
	@override String get apparent_temperature_min => 'न्यूनतम प्रतीत तापमान';
	@override String get direction => 'दिशा';
	@override String get heavy_rains => 'बारिश की बौछारें';
	@override String get apparent_temperature_max => 'अधिकतम प्रतीत तापमान';
	@override String get k_12 => '१२ घंटा';
	@override String get discord => 'डिस्कॉर्ड';
	@override String get discard_changes => 'क्या आप वाकई अपने बदलावों को छोड़ना चाहते हैं?';
	@override String get notifications => 'सूचनाएं';
	@override String get mph => 'मील/घंटा';
	@override String get west => 'पश्चिम';
	@override String get validate90 => 'मान -९० और ९० के बीच होना चाहिए';
	@override String get name2 => 'आसान डिजाइन';
	@override String get feels => 'अनुभव';
	@override String get precipitation_probability => 'वर्षा संभावना';
	@override String get license => 'लाइसेंस';
	@override String get widget_background => 'विजेट कि पृष्ठभूमि';
	@override String get large_element => 'बड़े मौसम का प्रदर्शन';
	@override String get unsaved_changes => 'सहेजे नहीं गए बदलाव';
	@override String get drizzling_rain => 'हिमवृष्टि';
	@override String get cloudy => 'मेघपाली';
	@override String get widget => 'विजेट';
	@override String get precipitation => 'वर्षा';
	@override String get delete => 'हटाएँ';
	@override String get deleted_cache_store => 'कैश साफ़ हो रहा है';
	@override String get map => 'मानचित्र';
	@override String get description3 => 'यदि आपको कोई समस्या आती है, तो कृपया हमसे ईमेल या एप्लिकेशन समीक्षा के माध्यम से संपर्क करें।';
	@override String get north => 'उत्तर';
	@override String get measurements => 'मापन प्रणाली';
	@override String get start => 'शुरू करें';
	@override String get settings_full => 'सेटिंग्स';
	@override String get high => 'उच्च';
	@override String get daily_variables => 'दैनिक मौसम चर';
	@override String get low => 'निम्न';
	@override String get on_inter => 'मौसमी आंकड़े प्राप्त करने के लिए इंटरनेट को चालू करें।';
	@override String get thunderstorm => 'बिजली चमक';
	@override String get version => 'एप्लिकेशन संस्करण';
	@override String get project => 'परियोजना पर';
	@override String get amoled_theme => 'AMOLED थीम';
	@override String get deleted_card_weather_query => 'क्या आप वाकई शहर को हटाना चाहते हैं?';
	@override String get northeast => 'उत्तर-पूर्व';
	@override String get add_widget => 'विजेट जोड़ें';
	@override String get fog => 'कोहरा';
	@override String get description2 => 'सभी नेविगेशन को इस प्रकार तैयार किया गया है ताकि आप एप्लिकेशन के साथ सर्वोत्तम रूप से और तेजी से संवाद कर सकें।';
	@override String get mm => 'मिलीमीटर';
	@override String get search_city => 'अपना शहर खोजें';
	@override String get weather_more => '१२ - दिवसीय मौसम पूर';
	@override String get round_degree => 'डिग्री गोली मारें';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'शहर डेटा खोजें या मैन्युअल रूप से दर्ज करें';
	@override String get validate_name => 'कृपया नाम दर्ज करें';
	@override String get sunrise => 'सूर्योदय';
	@override String get km => 'किमी';
	@override String get district => 'जिला';
	@override String get southwest => 'दक्षिण-पश्चिम';
	@override String get degrees => 'डिग्री';
	@override String get clear_cache_store => 'कैश साफ़ करें';
	@override String get skip => 'छोड़ें';
	@override String get h_pa => 'हेक्टोपास्कल';
	@override String get appearance => 'दिखावट';
	@override String get time_start => 'प्रारंभ समय';
	@override String get ready => 'तैयार';
	@override String get kph => 'किमी/घंटा';
	@override String get deleted_cache_store_query => 'क्या आप वाकई कैश साफ़ करना चाहते हैं?';
	@override String get widget_text => 'विजेट पाठ';
	@override String get support => 'समर्थन';
	@override String get groups => 'हमारे समूह';
	@override String get system => 'सिस्टम';
	@override String get sunset => 'सूर्यास्त';
	@override String get dewpoint => 'बर्फ़ के बिंदु';
	@override String get shortwave_radiation => 'शॉर्टवेव विकिरण';
	@override String get language => 'भाषा';
	@override String get hide_map => 'मानचित्र छिपाएँ';
	@override String get cancel => 'रद्द करें';
	@override String get loading => 'लोड हो रहा है...';
	@override String get timeformat => 'समय प्रारूप';
	@override String get lat => 'अक्षांश';
	@override String get data => 'डेटा';
	@override String get visibility => 'दृश्यता';
	@override String get deleted_card_weather => 'शहर हटाना';
	@override String get celsius => 'सेल्सियस';
	@override String get no_location => 'वर्तमान स्थान के लिए मौसम डेटा प्राप्त करने के';
	@override String get create => 'बनाएँ';
	@override String get edit => 'संपादित करें';
	@override String get search => 'खोजें...';
	@override String get uv_extreme => 'अत्यधिक';
	@override String get light => 'लाइट';
	@override String get cloudcover => 'बादलों का कवर';
	@override String get uv_very_high => 'बहुत उच्च';
	@override String get snow => 'बर्फबारी';
	@override String get done => 'किया';
	@override String get theme => 'थीम';
	@override String get name => 'मौसम';
	@override String get time_range => 'अवधि (घंटों में)';
	@override String get about_app => 'ऐप के बारे में';
	@override String get save => 'सहेजें';
	@override String get evaporation => 'वाष्पीकरण';
	@override String get freezing_rain => 'हिमस्खलन';
	@override String get uv_average => 'माध्यम';
	@override String get reset_color => 'डिफ़ॉल्ट पर रीसेट करें';
	@override String get metric => 'मीट्रिक';
	@override String get overcast => 'बादलबस्ती';
	@override String get pressure => 'दबाव';
	@override String get inch => 'इंच';
	@override String get imperial => 'इम्पीरियल';
	@override String get location => 'स्थान';
	@override String get error_occurred => 'एक त्रुटि हुई';
	@override String get validate_value => 'कृपया मान दर्ज करें';
	@override String get lon => 'देशांतर';
	@override String get wind => 'हवा';
	@override String get normal => 'सामान्य';
	@override String get dark => 'डार्क';
	@override String get settings => 'सेटिंग्स';
	@override String get south => 'दक्षिण';
	@override String get windgusts => 'गुस्त';
	@override String get northwest => 'उत्तर-पश्चिम';
	@override String get open_meteo => 'Open-Meteo से डेटा (CC-BY 4.0)';
	@override String get rain => 'बारिश';
	@override String get mm_hg => 'मिमी एचजी';
	@override String get validate180 => 'मान -१८० और १८० के बीच होना चाहिए';
	@override String get description => 'प्रति घंटे, दिन और सप्ताह के लिए किसी भी स्थान के लिए आधुनिक पूर्वानुमान के साथ मौसम एप्लिकेशन।';
	@override String get fahrenheit => 'फ़ारेनहाइट';
	@override String get m_s => 'मी/से';
	@override String get material_color => 'गतिशील रंग';
	@override String get confirm => 'सहेजें';
	@override String get no_results => 'कोई परिणाम नहीं';
	@override String get cities_load_error => 'शहर लोड नहीं हो सके';
	@override String get retry => 'पुनः प्रयास';
	@override String get city_not_found => 'शहर नहीं मिला';
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
	@override String get last_updated => 'अपडेट किया गया';
	@override String get app_font => 'फ़ॉन्ट';
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

/// The flat map containing all translations for locale <hi-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHiIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'कोई इंटरनेट नहीं है',
			'edit_city_hint' => 'शहर की जानकारी संपादित करें',
			'location_not_found' => 'आपका स्थान निर्धारित नहीं किया जा सका',
			'mi' => 'मील',
			'next' => 'आगे',
			'discard' => 'छोड़ें',
			'east' => 'पूर्व',
			'time_end' => 'समाप्ति समय',
			'search_method' => 'खोज या स्थानगति का उपयोग करें',
			'hourly_variables' => 'घंटेवार मौसम चर',
			'uv_index' => 'यूवी-सूचकांक',
			'clear_sky' => 'साफ आकाश',
			'k_24' => '२४ घंटा',
			'no_weather_card' => 'शहर जोड़ें',
			'drizzle' => 'बूंदाबांदी',
			'humidity' => 'नमी',
			'telegram' => 'टेलीग्राम',
			'functions' => 'कार्य',
			'cities' => 'शहर',
			'southeast' => 'दक्षिण-पूर्व',
			'validate_number' => 'कृपया एक मान्य संख्या दर्ज करें',
			'city' => 'शहर',
			'uv_high' => 'उच्च',
			'time' => 'शहर में समय',
			'uv_low' => 'कम',
			'name3' => 'हमे संपर्क करें',
			'apparent_temperature_min' => 'न्यूनतम प्रतीत तापमान',
			'direction' => 'दिशा',
			'heavy_rains' => 'बारिश की बौछारें',
			'apparent_temperature_max' => 'अधिकतम प्रतीत तापमान',
			'k_12' => '१२ घंटा',
			'discord' => 'डिस्कॉर्ड',
			'discard_changes' => 'क्या आप वाकई अपने बदलावों को छोड़ना चाहते हैं?',
			'notifications' => 'सूचनाएं',
			'mph' => 'मील/घंटा',
			'west' => 'पश्चिम',
			'validate90' => 'मान -९० और ९० के बीच होना चाहिए',
			'name2' => 'आसान डिजाइन',
			'feels' => 'अनुभव',
			'precipitation_probability' => 'वर्षा संभावना',
			'license' => 'लाइसेंस',
			'widget_background' => 'विजेट कि पृष्ठभूमि',
			'large_element' => 'बड़े मौसम का प्रदर्शन',
			'unsaved_changes' => 'सहेजे नहीं गए बदलाव',
			'drizzling_rain' => 'हिमवृष्टि',
			'cloudy' => 'मेघपाली',
			'widget' => 'विजेट',
			'precipitation' => 'वर्षा',
			'delete' => 'हटाएँ',
			'deleted_cache_store' => 'कैश साफ़ हो रहा है',
			'map' => 'मानचित्र',
			'description3' => 'यदि आपको कोई समस्या आती है, तो कृपया हमसे ईमेल या एप्लिकेशन समीक्षा के माध्यम से संपर्क करें।',
			'north' => 'उत्तर',
			'measurements' => 'मापन प्रणाली',
			'start' => 'शुरू करें',
			'settings_full' => 'सेटिंग्स',
			'high' => 'उच्च',
			'daily_variables' => 'दैनिक मौसम चर',
			'low' => 'निम्न',
			'on_inter' => 'मौसमी आंकड़े प्राप्त करने के लिए इंटरनेट को चालू करें।',
			'thunderstorm' => 'बिजली चमक',
			'version' => 'एप्लिकेशन संस्करण',
			'project' => 'परियोजना पर',
			'amoled_theme' => 'AMOLED थीम',
			'deleted_card_weather_query' => 'क्या आप वाकई शहर को हटाना चाहते हैं?',
			'northeast' => 'उत्तर-पूर्व',
			'add_widget' => 'विजेट जोड़ें',
			'fog' => 'कोहरा',
			'description2' => 'सभी नेविगेशन को इस प्रकार तैयार किया गया है ताकि आप एप्लिकेशन के साथ सर्वोत्तम रूप से और तेजी से संवाद कर सकें।',
			'mm' => 'मिलीमीटर',
			'search_city' => 'अपना शहर खोजें',
			'weather_more' => '१२ - दिवसीय मौसम पूर',
			'round_degree' => 'डिग्री गोली मारें',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'शहर डेटा खोजें या मैन्युअल रूप से दर्ज करें',
			'validate_name' => 'कृपया नाम दर्ज करें',
			'sunrise' => 'सूर्योदय',
			'km' => 'किमी',
			'district' => 'जिला',
			'southwest' => 'दक्षिण-पश्चिम',
			'degrees' => 'डिग्री',
			'clear_cache_store' => 'कैश साफ़ करें',
			'skip' => 'छोड़ें',
			'h_pa' => 'हेक्टोपास्कल',
			'appearance' => 'दिखावट',
			'time_start' => 'प्रारंभ समय',
			'ready' => 'तैयार',
			'kph' => 'किमी/घंटा',
			'deleted_cache_store_query' => 'क्या आप वाकई कैश साफ़ करना चाहते हैं?',
			'widget_text' => 'विजेट पाठ',
			'support' => 'समर्थन',
			'groups' => 'हमारे समूह',
			'system' => 'सिस्टम',
			'sunset' => 'सूर्यास्त',
			'dewpoint' => 'बर्फ़ के बिंदु',
			'shortwave_radiation' => 'शॉर्टवेव विकिरण',
			'language' => 'भाषा',
			'hide_map' => 'मानचित्र छिपाएँ',
			'cancel' => 'रद्द करें',
			'loading' => 'लोड हो रहा है...',
			'timeformat' => 'समय प्रारूप',
			'lat' => 'अक्षांश',
			'data' => 'डेटा',
			'visibility' => 'दृश्यता',
			'deleted_card_weather' => 'शहर हटाना',
			'celsius' => 'सेल्सियस',
			'no_location' => 'वर्तमान स्थान के लिए मौसम डेटा प्राप्त करने के',
			'create' => 'बनाएँ',
			'edit' => 'संपादित करें',
			'search' => 'खोजें...',
			'uv_extreme' => 'अत्यधिक',
			'light' => 'लाइट',
			'cloudcover' => 'बादलों का कवर',
			'uv_very_high' => 'बहुत उच्च',
			'snow' => 'बर्फबारी',
			'done' => 'किया',
			'theme' => 'थीम',
			'name' => 'मौसम',

			'today' => 'आज',
			'tomorrow' => 'कल',
			'time_range' => 'अवधि (घंटों में)',
			'about_app' => 'ऐप के बारे में',
			'save' => 'सहेजें',
			'evaporation' => 'वाष्पीकरण',
			'freezing_rain' => 'हिमस्खलन',
			'uv_average' => 'माध्यम',
			'reset_color' => 'डिफ़ॉल्ट पर रीसेट करें',
			'metric' => 'मीट्रिक',
			'overcast' => 'बादलबस्ती',
			'pressure' => 'दबाव',
			'inch' => 'इंच',
			'imperial' => 'इम्पीरियल',
			'location' => 'स्थान',
			'error_occurred' => 'एक त्रुटि हुई',
			'validate_value' => 'कृपया मान दर्ज करें',
			'lon' => 'देशांतर',
			'wind' => 'हवा',
			'normal' => 'सामान्य',
			'dark' => 'डार्क',
			'settings' => 'सेटिंग्स',
			'south' => 'दक्षिण',
			'windgusts' => 'गुस्त',
			'northwest' => 'उत्तर-पश्चिम',
			'open_meteo' => 'Open-Meteo से डेटा (CC-BY 4.0)',
			'rain' => 'बारिश',
			'mm_hg' => 'मिमी एचजी',
			'validate180' => 'मान -१८० और १८० के बीच होना चाहिए',
			'description' => 'प्रति घंटे, दिन और सप्ताह के लिए किसी भी स्थान के लिए आधुनिक पूर्वानुमान के साथ मौसम एप्लिकेशन।',
			'fahrenheit' => 'फ़ारेनहाइट',
			'm_s' => 'मी/से',
			'material_color' => 'गतिशील रंग',
			'confirm' => 'सहेजें',
			'no_results' => 'कोई परिणाम नहीं',
			'cities_load_error' => 'शहर लोड नहीं हो सके',
			'retry' => 'पुनः प्रयास',
			'city_not_found' => 'शहर नहीं मिला',
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
			'last_updated' => 'अपडेट किया गया',
			'app_font' => 'फ़ॉन्ट',
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
