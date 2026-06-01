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
class TranslationsMrIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsMrIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.mrIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <mr-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsMrIn _root = this; // ignore: unused_field

	@override 
	TranslationsMrIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsMrIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'इंटरनेट नाही';
	@override String get edit_city_hint => 'शहराची माहिती संपादित करा';
	@override String get location_not_found => 'तुमचे स्थान निर्धारित करता आले नाही';
	@override String get mi => 'मैल';
	@override String get next => 'पुढे';
	@override String get discard => 'रद्द करा';
	@override String get east => 'पूर्व';
	@override String get time_end => 'शेवटची वेळ';
	@override String get search_method => 'शोध किंवा भौगोलिक स्थान वापरा';
	@override String get hourly_variables => 'तासाभराचे हवामान चल';
	@override String get uv_index => 'यूव्ही निर्देशांक';
	@override String get clear_sky => 'स्वच्छ आकाश';
	@override String get k_24 => '24-तास';
	@override String get no_weather_card => 'शहर जोडा';
	@override String get drizzle => 'रिमझिम पाऊस';
	@override String get humidity => 'आर्द्रता';
	@override String get telegram => 'टेलिग्राम';
	@override String get functions => 'कार्ये';
	@override String get cities => 'शहरे';
	@override String get southeast => 'आग्नेय';
	@override String get validate_number => 'कृपया वैध संख्या प्रविष्ट करा';
	@override String get city => 'शहर';
	@override String get uv_high => 'जास्त';
	@override String get time => 'शहरातील वेळ';
	@override String get uv_low => 'कमी';
	@override String get name3 => 'आमच्याशी संपर्क साधा';
	@override String get apparent_temperature_min => 'किमान स्पष्ट तापमान';
	@override String get direction => 'दिशा';
	@override String get heavy_rains => 'पावसाचे सरी';
	@override String get apparent_temperature_max => 'कमाल स्पष्ट तापमान';
	@override String get k_12 => '12-तास';
	@override String get discord => 'डिस्कॉर्ड';
	@override String get discard_changes => 'तुम्हाला खरोखर तुमचे बदल रद्द करायचे आहेत का?';
	@override String get notifications => 'सूचना';
	@override String get mph => 'मैल/तास';
	@override String get west => 'पश्चिम';
	@override String get validate90 => 'मूल्य -90 आणि 90 दरम्यान असावे';
	@override String get name2 => 'सोयीस्कर डिझाइन';
	@override String get feels => 'वाटते';
	@override String get precipitation_probability => 'पर्जन्याची शक्यता';
	@override String get license => 'परवाने';
	@override String get widget_background => 'विजेट पार्श्वभूमी';
	@override String get large_element => 'मोठे हवामान प्रदर्शन';
	@override String get unsaved_changes => 'न संचयित केलेले बदल';
	@override String get drizzling_rain => 'गोठणारा रिमझिम पाऊस';
	@override String get cloudy => 'ढगाळ';
	@override String get widget => 'विजेट';
	@override String get precipitation => 'पर्जन्य';
	@override String get delete => 'हटवा';
	@override String get deleted_cache_store => 'कॅशे साफ करत आहे';
	@override String get map => 'नकाशा';
	@override String get description3 => 'तुम्हाला कोणत्याही समस्या आल्यास, कृपया ईमेलद्वारे किंवा अनुप्रयोग पुनरावलोकनांमध्ये आमच्याशी संपर्क साधा.';
	@override String get north => 'उत्तर';
	@override String get measurements => 'मापन प्रणाली';
	@override String get start => 'सुरू करा';
	@override String get settings_full => 'सेटिंग्ज';
	@override String get high => 'जास्त';
	@override String get daily_variables => 'दैनंदिन हवामान चल';
	@override String get low => 'कमी';
	@override String get on_inter => 'हवामान डेटा मिळविण्यासाठी इंटरनेट चालू करा.';
	@override String get thunderstorm => 'मेघगर्जना';
	@override String get version => 'अनुप्रयोग आवृत्ती';
	@override String get project => 'प्रकल्प चालू';
	@override String get amoled_theme => 'AMOLED थीम';
	@override String get deleted_card_weather_query => 'तुम्हाला खरोखर शहर हटवायचे आहे का?';
	@override String get northeast => 'ईशान्य';
	@override String get add_widget => 'विजेट जोडा';
	@override String get fog => 'धुके';
	@override String get description2 => 'सर्व नेव्हिगेशन अनुप्रयोगाशी शक्य तितक्या सोयीस्कर आणि जलदगतीने संवाद साधण्यासाठी डिझाइन केले आहे.';
	@override String get mm => 'मिमी';
	@override String get no_desc_data => 'डेटा नाही';
	@override String get search_city => 'तुमचे शहर शोधा';
	@override String get weather_more => '12-दिवसांचा हवामान अंदाज';
	@override String get round_degree => 'गोल अंश';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'शहर डेटा शोधा किंवा मॅन्युअली प्रविष्ट करा';
	@override String get validate_name => 'कृपया नाव प्रविष्ट करा';
	@override String get sunrise => 'सूर्योदय';
	@override String get km => 'किमी';
	@override String get district => 'जिल्हा';
	@override String get southwest => 'नैऋत्य';
	@override String get degrees => 'अंश';
	@override String get clear_cache_store => 'कॅशे साफ करा';
	@override String get skip => 'वगळा';
	@override String get h_pa => 'हेक्टोपास्कल';
	@override String get appearance => 'दिसणे';
	@override String get time_start => 'सुरुवातीची वेळ';
	@override String get ready => 'तयार';
	@override String get kph => 'किमी/तास';
	@override String get deleted_cache_store_query => 'तुम्हाला खरोखर कॅशे साफ करायचे आहे का?';
	@override String get widget_text => 'विजेट मजकूर';
	@override String get support => 'दान करा';
	@override String get groups => 'आमचे गट';
	@override String get system => 'प्रणाली';
	@override String get sunset => 'सूर्यास्त';
	@override String get dewpoint => 'दवबिंदू';
	@override String get shortwave_radiation => 'शॉर्टवेव्ह रेडिएशन';
	@override String get language => 'भाषा';
	@override String get hide_map => 'नकाशा लपवा';
	@override String get cancel => 'रद्द करा';
	@override String get loading => 'लोड होत आहे...';
	@override String get timeformat => 'वेळ स्वरूप';
	@override String get lat => 'अक्षांश';
	@override String get data => 'डेटा';
	@override String get visibility => 'दृश्यता';
	@override String get deleted_card_weather => 'शहर हटवा';
	@override String get celsius => 'सेल्सिअस';
	@override String get no_location => 'सध्याच्या स्थानासाठी हवामान डेटा मिळविण्यासाठी स्थान सेवा सक्षम करा.';
	@override String get create => 'तयार करा';
	@override String get edit => 'संपादित करा';
	@override String get search => 'शोधा...';
	@override String get uv_extreme => 'अत्यंत';
	@override String get light => 'हलका';
	@override String get cloudcover => 'ढग आच्छादन';
	@override String get uv_very_high => 'खूप जास्त';
	@override String get snow => 'बर्फ';
	@override String get done => 'पूर्ण';
	@override String get theme => 'थीम';
	@override String get name => 'हवामान';
	@override String get time_range => 'वारंवारता (तासांमध्ये)';
	@override String get about_app => 'अॅप बद्दल';
	@override String get save => 'संचयित करा';
	@override String get evaporation => 'बाष्पीभवन';
	@override String get freezing_rain => 'गोठणारा पाऊस';
	@override String get uv_average => 'मध्यम';
	@override String get reset_color => 'डीफॉल्टवर रीसेट करा';
	@override String get metric => 'मेट्रिक';
	@override String get overcast => 'ढगांनी व्यापलेले';
	@override String get pressure => 'दाब';
	@override String get inch => 'इंच';
	@override String get imperial => 'इम्पीरियल';
	@override String get location => 'स्थान';
	@override String get error_occurred => 'एक त्रुटी आली';
	@override String get validate_value => 'कृपया मूल्य प्रविष्ट करा';
	@override String get lon => 'रेखांश';
	@override String get wind => 'वारा';
	@override String get normal => 'सामान्य';
	@override String get dark => 'गडद';
	@override String get settings => 'सेटिंग्ज';
	@override String get south => 'दक्षिण';
	@override String get windgusts => 'वाऱ्याचे झुळके';
	@override String get northwest => 'वायव्य';
	@override String get open_meteo => 'Open-Meteo कडून डेटा (CC-BY 4.0)';
	@override String get rain => 'पाऊस';
	@override String get mm_hg => 'मिमी पारा';
	@override String get validate180 => 'मूल्य -180 आणि 180 दरम्यान असावे';
	@override String get description => 'कोणत्याही स्थानासाठी प्रत्येक तास, दिवस आणि आठवड्यासाठी अद्ययावत अंदाजासह हवामान अनुप्रयोग.';
	@override String get fahrenheit => 'फॅरेनहाइट';
	@override String get m_s => 'मी/से';
	@override String get material_color => 'डायनॅमिक रंग';
	@override String get confirm => 'संचयित करा';
	@override String get no_results => 'कोणतेही परिणाम नाहीत';
}

/// The flat map containing all translations for locale <mr-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsMrIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'इंटरनेट नाही',
			'edit_city_hint' => 'शहराची माहिती संपादित करा',
			'location_not_found' => 'तुमचे स्थान निर्धारित करता आले नाही',
			'mi' => 'मैल',
			'next' => 'पुढे',
			'discard' => 'रद्द करा',
			'east' => 'पूर्व',
			'time_end' => 'शेवटची वेळ',
			'search_method' => 'शोध किंवा भौगोलिक स्थान वापरा',
			'hourly_variables' => 'तासाभराचे हवामान चल',
			'uv_index' => 'यूव्ही निर्देशांक',
			'clear_sky' => 'स्वच्छ आकाश',
			'k_24' => '24-तास',
			'no_weather_card' => 'शहर जोडा',
			'drizzle' => 'रिमझिम पाऊस',
			'humidity' => 'आर्द्रता',
			'telegram' => 'टेलिग्राम',
			'functions' => 'कार्ये',
			'cities' => 'शहरे',
			'southeast' => 'आग्नेय',
			'validate_number' => 'कृपया वैध संख्या प्रविष्ट करा',
			'city' => 'शहर',
			'uv_high' => 'जास्त',
			'time' => 'शहरातील वेळ',
			'uv_low' => 'कमी',
			'name3' => 'आमच्याशी संपर्क साधा',
			'apparent_temperature_min' => 'किमान स्पष्ट तापमान',
			'direction' => 'दिशा',
			'heavy_rains' => 'पावसाचे सरी',
			'apparent_temperature_max' => 'कमाल स्पष्ट तापमान',
			'k_12' => '12-तास',
			'discord' => 'डिस्कॉर्ड',
			'discard_changes' => 'तुम्हाला खरोखर तुमचे बदल रद्द करायचे आहेत का?',
			'notifications' => 'सूचना',
			'mph' => 'मैल/तास',
			'west' => 'पश्चिम',
			'validate90' => 'मूल्य -90 आणि 90 दरम्यान असावे',
			'name2' => 'सोयीस्कर डिझाइन',
			'feels' => 'वाटते',
			'precipitation_probability' => 'पर्जन्याची शक्यता',
			'license' => 'परवाने',
			'widget_background' => 'विजेट पार्श्वभूमी',
			'large_element' => 'मोठे हवामान प्रदर्शन',
			'unsaved_changes' => 'न संचयित केलेले बदल',
			'drizzling_rain' => 'गोठणारा रिमझिम पाऊस',
			'cloudy' => 'ढगाळ',
			'widget' => 'विजेट',
			'precipitation' => 'पर्जन्य',
			'delete' => 'हटवा',
			'deleted_cache_store' => 'कॅशे साफ करत आहे',
			'map' => 'नकाशा',
			'description3' => 'तुम्हाला कोणत्याही समस्या आल्यास, कृपया ईमेलद्वारे किंवा अनुप्रयोग पुनरावलोकनांमध्ये आमच्याशी संपर्क साधा.',
			'north' => 'उत्तर',
			'measurements' => 'मापन प्रणाली',
			'start' => 'सुरू करा',
			'settings_full' => 'सेटिंग्ज',
			'high' => 'जास्त',
			'daily_variables' => 'दैनंदिन हवामान चल',
			'low' => 'कमी',
			'on_inter' => 'हवामान डेटा मिळविण्यासाठी इंटरनेट चालू करा.',
			'thunderstorm' => 'मेघगर्जना',
			'version' => 'अनुप्रयोग आवृत्ती',
			'project' => 'प्रकल्प चालू',
			'amoled_theme' => 'AMOLED थीम',
			'deleted_card_weather_query' => 'तुम्हाला खरोखर शहर हटवायचे आहे का?',
			'northeast' => 'ईशान्य',
			'add_widget' => 'विजेट जोडा',
			'fog' => 'धुके',
			'description2' => 'सर्व नेव्हिगेशन अनुप्रयोगाशी शक्य तितक्या सोयीस्कर आणि जलदगतीने संवाद साधण्यासाठी डिझाइन केले आहे.',
			'mm' => 'मिमी',
			'no_desc_data' => 'डेटा नाही',
			'search_city' => 'तुमचे शहर शोधा',
			'weather_more' => '12-दिवसांचा हवामान अंदाज',
			'round_degree' => 'गोल अंश',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'शहर डेटा शोधा किंवा मॅन्युअली प्रविष्ट करा',
			'validate_name' => 'कृपया नाव प्रविष्ट करा',
			'sunrise' => 'सूर्योदय',
			'km' => 'किमी',
			'district' => 'जिल्हा',
			'southwest' => 'नैऋत्य',
			'degrees' => 'अंश',
			'clear_cache_store' => 'कॅशे साफ करा',
			'skip' => 'वगळा',
			'h_pa' => 'हेक्टोपास्कल',
			'appearance' => 'दिसणे',
			'time_start' => 'सुरुवातीची वेळ',
			'ready' => 'तयार',
			'kph' => 'किमी/तास',
			'deleted_cache_store_query' => 'तुम्हाला खरोखर कॅशे साफ करायचे आहे का?',
			'widget_text' => 'विजेट मजकूर',
			'support' => 'दान करा',
			'groups' => 'आमचे गट',
			'system' => 'प्रणाली',
			'sunset' => 'सूर्यास्त',
			'dewpoint' => 'दवबिंदू',
			'shortwave_radiation' => 'शॉर्टवेव्ह रेडिएशन',
			'language' => 'भाषा',
			'hide_map' => 'नकाशा लपवा',
			'cancel' => 'रद्द करा',
			'loading' => 'लोड होत आहे...',
			'timeformat' => 'वेळ स्वरूप',
			'lat' => 'अक्षांश',
			'data' => 'डेटा',
			'visibility' => 'दृश्यता',
			'deleted_card_weather' => 'शहर हटवा',
			'celsius' => 'सेल्सिअस',
			'no_location' => 'सध्याच्या स्थानासाठी हवामान डेटा मिळविण्यासाठी स्थान सेवा सक्षम करा.',
			'create' => 'तयार करा',
			'edit' => 'संपादित करा',
			'search' => 'शोधा...',
			'uv_extreme' => 'अत्यंत',
			'light' => 'हलका',
			'cloudcover' => 'ढग आच्छादन',
			'uv_very_high' => 'खूप जास्त',
			'snow' => 'बर्फ',
			'done' => 'पूर्ण',
			'theme' => 'थीम',
			'name' => 'हवामान',
			'time_range' => 'वारंवारता (तासांमध्ये)',
			'about_app' => 'अॅप बद्दल',
			'save' => 'संचयित करा',
			'evaporation' => 'बाष्पीभवन',
			'freezing_rain' => 'गोठणारा पाऊस',
			'uv_average' => 'मध्यम',
			'reset_color' => 'डीफॉल्टवर रीसेट करा',
			'metric' => 'मेट्रिक',
			'overcast' => 'ढगांनी व्यापलेले',
			'pressure' => 'दाब',
			'inch' => 'इंच',
			'imperial' => 'इम्पीरियल',
			'location' => 'स्थान',
			'error_occurred' => 'एक त्रुटी आली',
			'validate_value' => 'कृपया मूल्य प्रविष्ट करा',
			'lon' => 'रेखांश',
			'wind' => 'वारा',
			'normal' => 'सामान्य',
			'dark' => 'गडद',
			'settings' => 'सेटिंग्ज',
			'south' => 'दक्षिण',
			'windgusts' => 'वाऱ्याचे झुळके',
			'northwest' => 'वायव्य',
			'open_meteo' => 'Open-Meteo कडून डेटा (CC-BY 4.0)',
			'rain' => 'पाऊस',
			'mm_hg' => 'मिमी पारा',
			'validate180' => 'मूल्य -180 आणि 180 दरम्यान असावे',
			'description' => 'कोणत्याही स्थानासाठी प्रत्येक तास, दिवस आणि आठवड्यासाठी अद्ययावत अंदाजासह हवामान अनुप्रयोग.',
			'fahrenheit' => 'फॅरेनहाइट',
			'm_s' => 'मी/से',
			'material_color' => 'डायनॅमिक रंग',
			'confirm' => 'संचयित करा',
			'no_results' => 'कोणतेही परिणाम नाहीत',
			_ => null,
		};
	}
}
