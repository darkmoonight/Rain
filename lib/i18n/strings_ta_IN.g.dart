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
class TranslationsTaIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTaIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.taIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ta-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTaIn _root = this; // ignore: unused_field

	@override 
	TranslationsTaIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTaIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'இணையம் இல்லை';
	@override String get edit_city_hint => 'நகர தகவலை திருத்தவும்';
	@override String get location_not_found => 'உங்கள் இருப்பிடத்தைத் தீர்மானிக்க முடியவில்லை';
	@override String get mi => 'மைல்';
	@override String get next => 'அடுத்து';
	@override String get discard => 'நிராகரி';
	@override String get east => 'கிழக்கு';
	@override String get time_end => 'முடிவு நேரம்';
	@override String get search_method => 'தேடல் அல்லது புவியிடத்தைப் பயன்படுத்தவும்';
	@override String get hourly_variables => 'மணிநேர வானிலை மாறிகள்';
	@override String get uv_index => 'யுவி குறியீடு';
	@override String get clear_sky => 'தெளிவான வானம்';
	@override String get k_24 => '24-மணி';
	@override String get no_weather_card => 'நகரத்தைச் சேர்க்கவும்';
	@override String get drizzle => 'தூறல்';
	@override String get humidity => 'ஈரப்பதம்';
	@override String get telegram => 'டெலிகிராம்';
	@override String get functions => 'செயல்பாடுகள்';
	@override String get cities => 'நகரங்கள்';
	@override String get southeast => 'தென்கிழக்கு';
	@override String get validate_number => 'தயவுசெய்து சரியான எண்ணை உள்ளிடவும்';
	@override String get city => 'நகரம்';
	@override String get uv_high => 'அதிகம்';
	@override String get time => 'நகரத்தில் நேரம்';
	@override String get uv_low => 'குறைவு';
	@override String get name3 => 'எங்களை தொடர்பு கொள்ளுங்கள்';
	@override String get apparent_temperature_min => 'குறைந்தபட்ச வெளிப்படையான வெப்பநிலை';
	@override String get direction => 'திசை';
	@override String get heavy_rains => 'மழை பொழிவு';
	@override String get apparent_temperature_max => 'அதிகபட்ச வெளிப்படையான வெப்பநிலை';
	@override String get k_12 => '12-மணி';
	@override String get discord => 'டிஸ்கார்டு';
	@override String get discard_changes => 'உங்கள் மாற்றங்களை நிராகரிக்க விரும்புகிறீர்களா?';
	@override String get notifications => 'அறிவிப்புகள்';
	@override String get mph => 'மைல்/மணி';
	@override String get west => 'மேற்கு';
	@override String get validate90 => 'மதிப்பு -90 மற்றும் 90 க்கு இடையில் இருக்க வேண்டும்';
	@override String get name2 => 'வசதியான வடிவமைப்பு';
	@override String get feels => 'உணர்கிறது';
	@override String get precipitation_probability => 'மழைப்பொழிவு சாத்தியம்';
	@override String get license => 'உரிமங்கள்';
	@override String get widget_background => 'விட்ஜெட் பின்னணி';
	@override String get large_element => 'பெரிய வானிலை காட்சி';
	@override String get unsaved_changes => 'சேமிக்கப்படாத மாற்றங்கள்';
	@override String get drizzling_rain => 'உறைந்த தூறல்';
	@override String get cloudy => 'மேகமூட்டம்';
	@override String get widget => 'விட்ஜெட்';
	@override String get precipitation => 'மழைப்பொழிவு';
	@override String get delete => 'நீக்கு';
	@override String get deleted_cache_store => 'கேச் அழிக்கிறது';
	@override String get map => 'வரைபடம்';
	@override String get description3 => 'நீங்கள் ஏதேனும் சிக்கல்களை எதிர்கொண்டால், தயவுசெய்து மின்னஞ்சல் மூலம் அல்லது பயன்பாட்டு மதிப்புரைகளில் எங்களை தொடர்பு கொள்ளுங்கள்.';
	@override String get north => 'வடக்கு';
	@override String get measurements => 'அளவீட்டு முறை';
	@override String get start => 'தொடங்கு';
	@override String get settings_full => 'அமைப்புகள்';
	@override String get high => 'அதிகம்';
	@override String get daily_variables => 'தினசரி வானிலை மாறிகள்';
	@override String get low => 'குறைவு';
	@override String get on_inter => 'வானிலை தரவைப் பெற இணையத்தை இயக்கவும்.';
	@override String get thunderstorm => 'இடியுடன் கூடிய மழை';
	@override String get version => 'பயன்பாட்டு பதிப்பு';
	@override String get project => 'திட்டம் இயங்குகிறது';
	@override String get amoled_theme => 'AMOLED தீம்';
	@override String get deleted_card_weather_query => 'நீங்கள் உண்மையில் நகரத்தை நீக்க விரும்புகிறீர்களா?';
	@override String get northeast => 'வடகிழக்கு';
	@override String get add_widget => 'விட்ஜெட் சேர்க்கவும்';
	@override String get fog => 'மூடுபனி';
	@override String get description2 => 'அனைத்து வழிசெலுத்தலும் பயன்பாட்டுடன் முடிந்தவரை வசதியாகவும் விரைவாகவும் தொடர்பு கொள்ள வடிவமைக்கப்பட்டுள்ளது.';
	@override String get mm => 'மி.மீ';
	@override String get no_desc_data => 'தரவு இல்லை';
	@override String get search_city => 'உங்கள் நகரத்தைக் கண்டறியுங்கள்';
	@override String get weather_more => '12-நாள் வானிலை முன்னறிவிப்பு';
	@override String get round_degree => 'வட்ட டிகிரி';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'நகர தரவை தேடுகவும் அல்லே manually உள்ளிடவும்';
	@override String get validate_name => 'தயவுசெய்து பெயரை உள்ளிடவும்';
	@override String get sunrise => 'சூரிய உதயம்';
	@override String get km => 'கி.மீ';
	@override String get district => 'மாவட்டம்';
	@override String get southwest => 'தென்மேற்கு';
	@override String get degrees => 'டிகிரி';
	@override String get clear_cache_store => 'கேச் அழிக்கவும்';
	@override String get skip => 'தவிர்';
	@override String get h_pa => 'ஹெக்டோபாஸ்கல்';
	@override String get appearance => 'தோற்றம்';
	@override String get time_start => 'தொடக்க நேரம்';
	@override String get ready => 'தயார்';
	@override String get kph => 'கி.மீ/மணி';
	@override String get deleted_cache_store_query => 'நீங்கள் உண்மையில் கேச்சை அழிக்க விரும்புகிறீர்களா?';
	@override String get widget_text => 'விட்ஜெட் உரை';
	@override String get support => 'நன்கொடை';
	@override String get groups => 'எங்கள் குழுக்கள்';
	@override String get system => 'அமைப்பு';
	@override String get sunset => 'சூரிய அஸ்தமனம்';
	@override String get dewpoint => 'பனிப்புள்ளி';
	@override String get shortwave_radiation => 'குறுகிய அலை கதிர்வீச்சு';
	@override String get language => 'மொழி';
	@override String get hide_map => 'வரைபடத்தை மறைக்கவும்';
	@override String get cancel => 'ரத்து செய்';
	@override String get loading => 'ஏற்றுகிறது...';
	@override String get timeformat => 'நேர வடிவம்';
	@override String get lat => 'அட்சரேகை';
	@override String get data => 'தரவு';
	@override String get visibility => 'தெரிவுநிலை';
	@override String get deleted_card_weather => 'நகரத்தை நீக்கு';
	@override String get celsius => 'செல்சியஸ்';
	@override String get no_location => 'தற்போதைய இடத்திற்கான வானிலை தரவைப் பெற இடச் சேவையை இயக்கவும்.';
	@override String get create => 'உருவாக்கு';
	@override String get edit => 'திருத்து';
	@override String get search => 'தேடு...';
	@override String get uv_extreme => 'தீவிரம்';
	@override String get light => 'வெளிச்சம்';
	@override String get cloudcover => 'மேக மூடுதல்';
	@override String get uv_very_high => 'மிக அதிகம்';
	@override String get snow => 'பனி';
	@override String get done => 'முடிந்தது';
	@override String get theme => 'தீம்';
	@override String get name => 'வானிலை';
	@override String get time_range => 'அதிர்வெண் (மணிநேரங்களில்)';
	@override String get about_app => 'பயன்பாடு பற்றி';
	@override String get save => 'சேமி';
	@override String get evaporation => 'ஆவியாதல்';
	@override String get freezing_rain => 'உறைந்த மழை';
	@override String get uv_average => 'மிதமான';
	@override String get reset_color => 'இயல்புநிலைக்கு மீட்டமைக்கவும்';
	@override String get metric => 'மெட்ரிக்';
	@override String get overcast => 'மேகமூட்டம்';
	@override String get pressure => 'அழுத்தம்';
	@override String get inch => 'அங்குலம்';
	@override String get imperial => 'இம்பீரியல்';
	@override String get location => 'இடம்';
	@override String get error_occurred => 'ஒரு பிழை ஏற்பட்டது';
	@override String get validate_value => 'தயவுசெய்து மதிப்பை உள்ளிடவும்';
	@override String get lon => 'தீர்க்கரேகை';
	@override String get wind => 'காற்று';
	@override String get normal => 'சாதாரண';
	@override String get dark => 'இருண்ட';
	@override String get settings => 'அமைப்புகள்';
	@override String get south => 'தெற்கு';
	@override String get windgusts => 'காற்றின் வேகம்';
	@override String get northwest => 'வடமேற்கு';
	@override String get open_meteo => 'Open-Meteo இலிருந்து தரவு (CC-BY 4.0)';
	@override String get rain => 'மழை';
	@override String get mm_hg => 'மி.மீ பாதரசம்';
	@override String get validate180 => 'மதிப்பு -180 மற்றும் 180 க்கு இடையில் இருக்க வேண்டும்';
	@override String get description => 'எந்த இடத்திற்கும் ஒவ்வொரு மணிநேரம், நாள் மற்றும் வாரத்திற்கும் புதுப்பிக்கப்பட்ட முன்னறிவிப்புடன் வானிலை பயன்பாடு.';
	@override String get fahrenheit => 'பாரன்ஹீட்';
	@override String get m_s => 'மீ/வி';
	@override String get material_color => 'டைனமிக் நிறங்கள்';
	@override String get confirm => 'சேமி';
	@override String get no_results => 'முடிவுகள் இல்லை';
	@override String get cities_load_error => 'நகரங்களை ஏற்ற முடியவில்லை';
	@override String get retry => 'மீண்டும்';
	@override String get city_not_found => 'நகரம் கிடைக்கவில்லை';
	@override String get air_quality => 'Air quality';
	@override String get aqi_standard => 'AQI standard';
	@override String get aqi_european => 'European AQI';
	@override String get aqi_american => 'US AQI';
	@override String get aqi_good => 'Good';
	@override String get aqi_fair => 'Fair';
	@override String get aqi_moderate => 'Moderate';
	@override String get aqi_poor => 'Poor';
	@override String get aqi_very_poor => 'Very poor';
	@override String get aqi_extremely_poor => 'Extremely poor';
	@override String get aqi_unhealthy_sensitive => 'Unhealthy for sensitive groups';
	@override String get aqi_unhealthy => 'Unhealthy';
	@override String get aqi_very_unhealthy => 'Very unhealthy';
	@override String get aqi_hazardous => 'Hazardous';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'European';
	@override String get american => 'American';
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

/// The flat map containing all translations for locale <ta-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTaIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'இணையம் இல்லை',
			'edit_city_hint' => 'நகர தகவலை திருத்தவும்',
			'location_not_found' => 'உங்கள் இருப்பிடத்தைத் தீர்மானிக்க முடியவில்லை',
			'mi' => 'மைல்',
			'next' => 'அடுத்து',
			'discard' => 'நிராகரி',
			'east' => 'கிழக்கு',
			'time_end' => 'முடிவு நேரம்',
			'search_method' => 'தேடல் அல்லது புவியிடத்தைப் பயன்படுத்தவும்',
			'hourly_variables' => 'மணிநேர வானிலை மாறிகள்',
			'uv_index' => 'யுவி குறியீடு',
			'clear_sky' => 'தெளிவான வானம்',
			'k_24' => '24-மணி',
			'no_weather_card' => 'நகரத்தைச் சேர்க்கவும்',
			'drizzle' => 'தூறல்',
			'humidity' => 'ஈரப்பதம்',
			'telegram' => 'டெலிகிராம்',
			'functions' => 'செயல்பாடுகள்',
			'cities' => 'நகரங்கள்',
			'southeast' => 'தென்கிழக்கு',
			'validate_number' => 'தயவுசெய்து சரியான எண்ணை உள்ளிடவும்',
			'city' => 'நகரம்',
			'uv_high' => 'அதிகம்',
			'time' => 'நகரத்தில் நேரம்',
			'uv_low' => 'குறைவு',
			'name3' => 'எங்களை தொடர்பு கொள்ளுங்கள்',
			'apparent_temperature_min' => 'குறைந்தபட்ச வெளிப்படையான வெப்பநிலை',
			'direction' => 'திசை',
			'heavy_rains' => 'மழை பொழிவு',
			'apparent_temperature_max' => 'அதிகபட்ச வெளிப்படையான வெப்பநிலை',
			'k_12' => '12-மணி',
			'discord' => 'டிஸ்கார்டு',
			'discard_changes' => 'உங்கள் மாற்றங்களை நிராகரிக்க விரும்புகிறீர்களா?',
			'notifications' => 'அறிவிப்புகள்',
			'mph' => 'மைல்/மணி',
			'west' => 'மேற்கு',
			'validate90' => 'மதிப்பு -90 மற்றும் 90 க்கு இடையில் இருக்க வேண்டும்',
			'name2' => 'வசதியான வடிவமைப்பு',
			'feels' => 'உணர்கிறது',
			'precipitation_probability' => 'மழைப்பொழிவு சாத்தியம்',
			'license' => 'உரிமங்கள்',
			'widget_background' => 'விட்ஜெட் பின்னணி',
			'large_element' => 'பெரிய வானிலை காட்சி',
			'unsaved_changes' => 'சேமிக்கப்படாத மாற்றங்கள்',
			'drizzling_rain' => 'உறைந்த தூறல்',
			'cloudy' => 'மேகமூட்டம்',
			'widget' => 'விட்ஜெட்',
			'precipitation' => 'மழைப்பொழிவு',
			'delete' => 'நீக்கு',
			'deleted_cache_store' => 'கேச் அழிக்கிறது',
			'map' => 'வரைபடம்',
			'description3' => 'நீங்கள் ஏதேனும் சிக்கல்களை எதிர்கொண்டால், தயவுசெய்து மின்னஞ்சல் மூலம் அல்லது பயன்பாட்டு மதிப்புரைகளில் எங்களை தொடர்பு கொள்ளுங்கள்.',
			'north' => 'வடக்கு',
			'measurements' => 'அளவீட்டு முறை',
			'start' => 'தொடங்கு',
			'settings_full' => 'அமைப்புகள்',
			'high' => 'அதிகம்',
			'daily_variables' => 'தினசரி வானிலை மாறிகள்',
			'low' => 'குறைவு',
			'on_inter' => 'வானிலை தரவைப் பெற இணையத்தை இயக்கவும்.',
			'thunderstorm' => 'இடியுடன் கூடிய மழை',
			'version' => 'பயன்பாட்டு பதிப்பு',
			'project' => 'திட்டம் இயங்குகிறது',
			'amoled_theme' => 'AMOLED தீம்',
			'deleted_card_weather_query' => 'நீங்கள் உண்மையில் நகரத்தை நீக்க விரும்புகிறீர்களா?',
			'northeast' => 'வடகிழக்கு',
			'add_widget' => 'விட்ஜெட் சேர்க்கவும்',
			'fog' => 'மூடுபனி',
			'description2' => 'அனைத்து வழிசெலுத்தலும் பயன்பாட்டுடன் முடிந்தவரை வசதியாகவும் விரைவாகவும் தொடர்பு கொள்ள வடிவமைக்கப்பட்டுள்ளது.',
			'mm' => 'மி.மீ',
			'no_desc_data' => 'தரவு இல்லை',
			'search_city' => 'உங்கள் நகரத்தைக் கண்டறியுங்கள்',
			'weather_more' => '12-நாள் வானிலை முன்னறிவிப்பு',
			'round_degree' => 'வட்ட டிகிரி',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'நகர தரவை தேடுகவும் அல்லே manually உள்ளிடவும்',
			'validate_name' => 'தயவுசெய்து பெயரை உள்ளிடவும்',
			'sunrise' => 'சூரிய உதயம்',
			'km' => 'கி.மீ',
			'district' => 'மாவட்டம்',
			'southwest' => 'தென்மேற்கு',
			'degrees' => 'டிகிரி',
			'clear_cache_store' => 'கேச் அழிக்கவும்',
			'skip' => 'தவிர்',
			'h_pa' => 'ஹெக்டோபாஸ்கல்',
			'appearance' => 'தோற்றம்',
			'time_start' => 'தொடக்க நேரம்',
			'ready' => 'தயார்',
			'kph' => 'கி.மீ/மணி',
			'deleted_cache_store_query' => 'நீங்கள் உண்மையில் கேச்சை அழிக்க விரும்புகிறீர்களா?',
			'widget_text' => 'விட்ஜெட் உரை',
			'support' => 'நன்கொடை',
			'groups' => 'எங்கள் குழுக்கள்',
			'system' => 'அமைப்பு',
			'sunset' => 'சூரிய அஸ்தமனம்',
			'dewpoint' => 'பனிப்புள்ளி',
			'shortwave_radiation' => 'குறுகிய அலை கதிர்வீச்சு',
			'language' => 'மொழி',
			'hide_map' => 'வரைபடத்தை மறைக்கவும்',
			'cancel' => 'ரத்து செய்',
			'loading' => 'ஏற்றுகிறது...',
			'timeformat' => 'நேர வடிவம்',
			'lat' => 'அட்சரேகை',
			'data' => 'தரவு',
			'visibility' => 'தெரிவுநிலை',
			'deleted_card_weather' => 'நகரத்தை நீக்கு',
			'celsius' => 'செல்சியஸ்',
			'no_location' => 'தற்போதைய இடத்திற்கான வானிலை தரவைப் பெற இடச் சேவையை இயக்கவும்.',
			'create' => 'உருவாக்கு',
			'edit' => 'திருத்து',
			'search' => 'தேடு...',
			'uv_extreme' => 'தீவிரம்',
			'light' => 'வெளிச்சம்',
			'cloudcover' => 'மேக மூடுதல்',
			'uv_very_high' => 'மிக அதிகம்',
			'snow' => 'பனி',
			'done' => 'முடிந்தது',
			'theme' => 'தீம்',
			'name' => 'வானிலை',
			'time_range' => 'அதிர்வெண் (மணிநேரங்களில்)',
			'about_app' => 'பயன்பாடு பற்றி',
			'save' => 'சேமி',
			'evaporation' => 'ஆவியாதல்',
			'freezing_rain' => 'உறைந்த மழை',
			'uv_average' => 'மிதமான',
			'reset_color' => 'இயல்புநிலைக்கு மீட்டமைக்கவும்',
			'metric' => 'மெட்ரிக்',
			'overcast' => 'மேகமூட்டம்',
			'pressure' => 'அழுத்தம்',
			'inch' => 'அங்குலம்',
			'imperial' => 'இம்பீரியல்',
			'location' => 'இடம்',
			'error_occurred' => 'ஒரு பிழை ஏற்பட்டது',
			'validate_value' => 'தயவுசெய்து மதிப்பை உள்ளிடவும்',
			'lon' => 'தீர்க்கரேகை',
			'wind' => 'காற்று',
			'normal' => 'சாதாரண',
			'dark' => 'இருண்ட',
			'settings' => 'அமைப்புகள்',
			'south' => 'தெற்கு',
			'windgusts' => 'காற்றின் வேகம்',
			'northwest' => 'வடமேற்கு',
			'open_meteo' => 'Open-Meteo இலிருந்து தரவு (CC-BY 4.0)',
			'rain' => 'மழை',
			'mm_hg' => 'மி.மீ பாதரசம்',
			'validate180' => 'மதிப்பு -180 மற்றும் 180 க்கு இடையில் இருக்க வேண்டும்',
			'description' => 'எந்த இடத்திற்கும் ஒவ்வொரு மணிநேரம், நாள் மற்றும் வாரத்திற்கும் புதுப்பிக்கப்பட்ட முன்னறிவிப்புடன் வானிலை பயன்பாடு.',
			'fahrenheit' => 'பாரன்ஹீட்',
			'm_s' => 'மீ/வி',
			'material_color' => 'டைனமிக் நிறங்கள்',
			'confirm' => 'சேமி',
			'no_results' => 'முடிவுகள் இல்லை',
			'cities_load_error' => 'நகரங்களை ஏற்ற முடியவில்லை',
			'retry' => 'மீண்டும்',
			'city_not_found' => 'நகரம் கிடைக்கவில்லை',
			'air_quality' => 'Air quality',
			'aqi_standard' => 'AQI standard',
			'aqi_european' => 'European AQI',
			'aqi_american' => 'US AQI',
			'aqi_good' => 'Good',
			'aqi_fair' => 'Fair',
			'aqi_moderate' => 'Moderate',
			'aqi_poor' => 'Poor',
			'aqi_very_poor' => 'Very poor',
			'aqi_extremely_poor' => 'Extremely poor',
			'aqi_unhealthy_sensitive' => 'Unhealthy for sensitive groups',
			'aqi_unhealthy' => 'Unhealthy',
			'aqi_very_unhealthy' => 'Very unhealthy',
			'aqi_hazardous' => 'Hazardous',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'European',
			'american' => 'American',
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
