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
class TranslationsOrIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsOrIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.orIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <or-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsOrIn _root = this; // ignore: unused_field

	@override 
	TranslationsOrIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsOrIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ଇଣ୍ଟରନେଟ୍ ନାହିଁ';
	@override String get edit_city_hint => 'ସହର ସୂଚନା ସମ୍ପାଦନ କରନ୍ତୁ';
	@override String get location_not_found => 'ଆପଣଙ୍କର ଅବସ୍ଥାନ ନିର୍ଦ୍ଧାରଣ କରାଯାଇପାରିଲା ନାହିଁ';
	@override String get mi => 'ମାଇଲ୍';
	@override String get next => 'ପରବର୍ତ୍ତୀ';
	@override String get discard => 'ବାତିଲ';
	@override String get east => 'ପୂର୍ବ';
	@override String get time_end => 'ଶେଷ ସମୟ';
	@override String get search_method => 'ସନ୍ଧାନ କିମ୍ବା ଜିଓଲୋକେସନ୍ ବ୍ୟବହାର କରନ୍ତୁ';
	@override String get hourly_variables => 'ଘଣ୍ଟାଭିତ୍ତିକ ପାଣିପାଗ ଭେରିଏବଲ୍';
	@override String get uv_index => 'UV ସୂଚକାଙ୍କ';
	@override String get clear_sky => 'ସ୍ୱଚ୍ଛ ଆକାଶ';
	@override String get k_24 => '24-ଘଣ୍ଟା';
	@override String get no_weather_card => 'ସହର ଯୋଗ କରନ୍ତୁ';
	@override String get drizzle => 'ଝିରିମିରି ବର୍ଷା';
	@override String get humidity => 'ଆର୍ଦ୍ରତା';
	@override String get telegram => 'ଟେଲିଗ୍ରାମ';
	@override String get functions => 'କାର୍ଯ୍ୟଗୁଡ଼ିକ';
	@override String get cities => 'ସହରଗୁଡ଼ିକ';
	@override String get southeast => 'ଦକ୍ଷିଣ-ପୂର୍ବ';
	@override String get validate_number => 'ଦୟାକରି ଏକ ବୈଧ ସଂଖ୍ୟା ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get city => 'ସହର';
	@override String get uv_high => 'ଅଧିକ';
	@override String get time => 'ସହରରେ ସମୟ';
	@override String get uv_low => 'କମ୍';
	@override String get name3 => 'ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ';
	@override String get apparent_temperature_min => 'ସର୍ବନିମ୍ନ ସ୍ପଷ୍ଟ ତାପମାତ୍ରା';
	@override String get direction => 'ଦିଗ';
	@override String get heavy_rains => 'ବର୍ଷାର ଝଡ଼';
	@override String get apparent_temperature_max => 'ସର୍ବାଧିକ ସ୍ପଷ୍ଟ ତାପମାତ୍ରା';
	@override String get k_12 => '12-ଘଣ୍ଟା';
	@override String get discord => 'ଡିସ୍କର୍ଡ';
	@override String get discard_changes => 'ଆପଣ ନିଶ୍ଚିତ ରୂପେ ଆପଣଙ୍କର ପରିବର୍ତ୍ତନଗୁଡିକୁ ବାତିଲ କରିବାକୁ ଚାହାଁନ୍ତି କି?';
	@override String get notifications => 'ବିଜ୍ଞପ୍ତି';
	@override String get mph => 'ମାଇଲ୍/ଘଣ୍ଟା';
	@override String get west => 'ପଶ୍ଚିମ';
	@override String get validate90 => 'ମୂଲ୍ୟ -90 ଏବଂ 90 ମଧ୍ୟରେ ହେବା ଆବଶ୍ୟକ';
	@override String get name2 => 'ସୁବିଧାଜନକ ଡିଜାଇନ୍';
	@override String get feels => 'ଅନୁଭବ ହୁଏ';
	@override String get precipitation_probability => 'ବୃଷ୍ଟିପାତର ସମ୍ଭାବନା';
	@override String get license => 'ଲାଇସେନ୍ସ';
	@override String get widget_background => 'ୱିଜେଟ୍ ପୃଷ୍ଠଭୂମି';
	@override String get large_element => 'ବଡ଼ ପାଣିପାଗ ପ୍ରଦର୍ଶନ';
	@override String get unsaved_changes => 'ସଂରକ୍ଷିତ ନହୋଇଥିବା ପରିବର୍ତ୍ତନ';
	@override String get drizzling_rain => 'ଜମାଟ ବାନ୍ଧୁଥିବା ଝିରିମିରି ବର୍ଷା';
	@override String get cloudy => 'ମେଘାଚ୍ଛନ୍ନ';
	@override String get widget => 'ୱିଜେଟ୍';
	@override String get precipitation => 'ବୃଷ୍ଟିପାତ';
	@override String get delete => 'ଡିଲିଟ୍ କରନ୍ତୁ';
	@override String get deleted_cache_store => 'କ୍ୟାଶ୍ ସଫା କରୁଛି';
	@override String get map => 'ମାନଚିତ୍ର';
	@override String get description3 => 'ଯଦି ଆପଣ କୌଣସି ସମସ୍ୟାର ସମ୍ମୁଖୀନ ହୁଅନ୍ତି, ଦୟାକରି ଇମେଲ୍ ମାଧ୍ୟମରେ କିମ୍ବା ଆପ୍ଲିକେସନ୍ ସମୀକ୍ଷାରେ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।';
	@override String get north => 'ଉତ୍ତର';
	@override String get measurements => 'ମାପ ପ୍ରଣାଳୀ';
	@override String get start => 'ଆରମ୍ଭ କରନ୍ତୁ';
	@override String get settings_full => 'ସେଟିଂସ୍';
	@override String get high => 'ଅଧିକ';
	@override String get daily_variables => 'ଦୈନିକ ପାଣିପାଗ ଭେରିଏବଲ୍';
	@override String get low => 'କମ୍';
	@override String get on_inter => 'ପାଣିପାଗ ତଥ୍ୟ ପାଇବା ପାଇଁ ଇଣ୍ଟରନେଟ୍ ଅନ୍ କରନ୍ତୁ।';
	@override String get thunderstorm => 'ବଜ୍ରବିଦ୍ୟୁତ୍';
	@override String get version => 'ଆପ୍ଲିକେସନ୍ ସଂସ୍କରଣ';
	@override String get project => 'ପ୍ରୋଜେକ୍ଟ ଚାଲୁଛି';
	@override String get amoled_theme => 'AMOLED ଥିମ୍';
	@override String get deleted_card_weather_query => 'ଆପଣ ପ୍ରକୃତରେ ସହରକୁ ଡିଲିଟ୍ କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?';
	@override String get northeast => 'ଉତ୍ତର-ପୂର୍ବ';
	@override String get add_widget => 'ୱିଜେଟ୍ ଯୋଗ କରନ୍ତୁ';
	@override String get fog => 'କୁହୁଡ଼ି';
	@override String get description2 => 'ସମସ୍ତ ନେଭିଗେସନ୍ ଆପ୍ଲିକେସନ୍ ସହିତ ଯଥାସମ୍ଭବ ସୁବିଧାଜନକ ଏବଂ ଶୀଘ୍ର ଯୋଗାଯୋଗ କରିବା ପାଇଁ ଡିଜାଇନ୍ କରାଯାଇଛି।';
	@override String get mm => 'ମି.ମି.';
	@override String get search_city => 'ଆପଣଙ୍କ ସହର ଖୋଜନ୍ତୁ';
	@override String get weather_more => '12-ଦିନର ପାଣିପାଗ ପୂର୍ବାନୁମାନ';
	@override String get round_degree => 'ଗୋଲାକାର ଡିଗ୍ରୀ';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'ସହର ଡାଟା ଅନୁସନ୍ଧାନ କରନ୍ତୁ କିମ୍ବା ମାନୁଆଲ୍ ଭାବରେ ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get validate_name => 'ଦୟାକରି ନାମ ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get sunrise => 'ସୂର୍ଯ୍ୟୋଦୟ';
	@override String get km => 'କି.ମି.';
	@override String get district => 'ଜିଲ୍ଲା';
	@override String get southwest => 'ଦକ୍ଷିଣ-ପଶ୍ଚିମ';
	@override String get degrees => 'ଡିଗ୍ରୀ';
	@override String get clear_cache_store => 'କ୍ୟାଶ୍ ସଫା କରନ୍ତୁ';
	@override String get skip => 'ଛାଡନ୍ତୁ';
	@override String get h_pa => 'ହେକ୍ଟୋପାସ୍କାଲ୍';
	@override String get appearance => 'ରୂପ';
	@override String get time_start => 'ଆରମ୍ଭ ସମୟ';
	@override String get ready => 'ପ୍ରସ୍ତୁତ';
	@override String get kph => 'କି.ମି./ଘଣ୍ଟା';
	@override String get deleted_cache_store_query => 'ଆପଣ ପ୍ରକୃତରେ କ୍ୟାଶ୍ ସଫା କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?';
	@override String get widget_text => 'ୱିଜେଟ୍ ଟେକ୍ସଟ୍';
	@override String get support => 'ଦାନ କରନ୍ତୁ';
	@override String get groups => 'ଆମର ଗୋଷ୍ଠୀ';
	@override String get system => 'ସିଷ୍ଟମ୍';
	@override String get sunset => 'ସୂର୍ଯ୍ୟାସ୍ତ';
	@override String get dewpoint => 'ଶିଶିର ବିନ୍ଦୁ';
	@override String get shortwave_radiation => 'ସର୍ଟୱେଭ୍ ବିକିରଣ';
	@override String get language => 'ଭାଷା';
	@override String get hide_map => 'ମାନଚିତ୍ର ଲୁଚାନ୍ତୁ';
	@override String get cancel => 'ବାତିଲ୍ କରନ୍ତୁ';
	@override String get loading => 'ଲୋଡ୍ ହେଉଛି...';
	@override String get timeformat => 'ସମୟ ଫର୍ମାଟ୍';
	@override String get lat => 'ଅକ୍ଷାଂଶ';
	@override String get data => 'ତଥ୍ୟ';
	@override String get visibility => 'ଦୃଶ୍ୟମାନତା';
	@override String get deleted_card_weather => 'ସହର ଡିଲିଟ୍ କରନ୍ତୁ';
	@override String get celsius => 'ସେଲସିୟସ୍';
	@override String get no_location => 'ବର୍ତ୍ତମାନର ସ୍ଥାନ ପାଇଁ ପାଣିପାଗ ତଥ୍ୟ ପାଇବା ପାଇଁ ଲୋକେସନ୍ ସେବା ସକ୍ଷମ କରନ୍ତୁ।';
	@override String get create => 'ସୃଷ୍ଟି କରନ୍ତୁ';
	@override String get edit => 'ସମ୍ପାଦନା କରନ୍ତୁ';
	@override String get search => 'ଖୋଜନ୍ତୁ...';
	@override String get uv_extreme => 'ଅତ୍ୟଧିକ';
	@override String get light => 'ଆଲୋକ';
	@override String get cloudcover => 'ମେଘ ଆବରଣ';
	@override String get uv_very_high => 'ବହୁତ ଅଧିକ';
	@override String get snow => 'ବରଫ';
	@override String get done => 'ସମ୍ପନ୍ନ';
	@override String get theme => 'ଥିମ୍';
	@override String get name => 'ପାଣିପାଗ';
	@override String get time_range => 'ଆବୃତ୍ତି (ଘଣ୍ଟାରେ)';
	@override String get about_app => 'ଆପ ବିଷୟରେ';
	@override String get save => 'ସଂରକ୍ଷଣ';
	@override String get evaporation => 'ବାଷ୍ପୀଭବନ';
	@override String get freezing_rain => 'ଜମାଟ ବାନ୍ଧୁଥିବା ବର୍ଷା';
	@override String get uv_average => 'ମଧ୍ୟମ';
	@override String get reset_color => 'ଡିଫଲ୍ଟକୁ ରିସେଟ୍ କରନ୍ତୁ';
	@override String get metric => 'ମେଟ୍ରିକ୍';
	@override String get overcast => 'ମେଘରେ ଆବୃତ';
	@override String get pressure => 'ଚାପ';
	@override String get inch => 'ଇଞ୍ଚ';
	@override String get imperial => 'ଇମ୍ପେରିଆଲ୍';
	@override String get location => 'ସ୍ଥାନ';
	@override String get error_occurred => 'ଏକ ତ୍ରୁଟି ଘଟିଛି';
	@override String get validate_value => 'ଦୟାକରି ମୂଲ୍ୟ ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get lon => 'ରେଖାଂଶ';
	@override String get wind => 'ପବନ';
	@override String get normal => 'ସାଧାରଣ';
	@override String get dark => 'ଅନ୍ଧାର';
	@override String get settings => 'ସେଟିଂସ୍';
	@override String get south => 'ଦକ୍ଷିଣ';
	@override String get windgusts => 'ପବନର ଝଟକା';
	@override String get northwest => 'ଉତ୍ତର-ପଶ୍ଚିମ';
	@override String get open_meteo => 'Open-Meteo ରୁ ତଥ୍ୟ (CC-BY 4.0)';
	@override String get rain => 'ବର୍ଷା';
	@override String get mm_hg => 'ମି.ମି. ପାରଦ';
	@override String get validate180 => 'ମୂଲ୍ୟ -180 ଏବଂ 180 ମଧ୍ୟରେ ହେବା ଆବଶ୍ୟକ';
	@override String get description => 'ଯେକୌଣସି ସ୍ଥାନ ପାଇଁ ପ୍ରତି ଘଣ୍ଟା, ଦିନ ଏବଂ ସପ୍ତାହ ପାଇଁ ଅପଡେଟ୍ ହୋଇଥିବା ପୂର୍ବାନୁମାନ ସହିତ ପାଣିପାଗ ଆପ୍ଲିକେସନ୍।';
	@override String get fahrenheit => 'ଫାରେନହାଇଟ୍';
	@override String get m_s => 'ମି./ସେ.';
	@override String get material_color => 'ଗତିଶୀଳ ରଙ୍ଗ';
	@override String get confirm => 'ସଂରକ୍ଷଣ';
	@override String get no_results => 'କୌଣସି ଫଳାଫଳ ନାହିଁ';
	@override String get cities_load_error => 'ସହରଗୁଡ଼ିକ ଲୋଡ୍ ହେଲା ନାହିଁ';
	@override String get retry => 'ପୁନଃଚେଷ୍ଟା';
	@override String get city_not_found => 'ସହର ମିଳିଲା ନାହିଁ';
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
	@override String get last_updated => 'ଅପଡେଟ୍ ହୋଇଛି';
	@override String get app_font => 'ଫଣ୍ଟ';
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

/// The flat map containing all translations for locale <or-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsOrIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ଇଣ୍ଟରନେଟ୍ ନାହିଁ',
			'edit_city_hint' => 'ସହର ସୂଚନା ସମ୍ପାଦନ କରନ୍ତୁ',
			'location_not_found' => 'ଆପଣଙ୍କର ଅବସ୍ଥାନ ନିର୍ଦ୍ଧାରଣ କରାଯାଇପାରିଲା ନାହିଁ',
			'mi' => 'ମାଇଲ୍',
			'next' => 'ପରବର୍ତ୍ତୀ',
			'discard' => 'ବାତିଲ',
			'east' => 'ପୂର୍ବ',
			'time_end' => 'ଶେଷ ସମୟ',
			'search_method' => 'ସନ୍ଧାନ କିମ୍ବା ଜିଓଲୋକେସନ୍ ବ୍ୟବହାର କରନ୍ତୁ',
			'hourly_variables' => 'ଘଣ୍ଟାଭିତ୍ତିକ ପାଣିପାଗ ଭେରିଏବଲ୍',
			'uv_index' => 'UV ସୂଚକାଙ୍କ',
			'clear_sky' => 'ସ୍ୱଚ୍ଛ ଆକାଶ',
			'k_24' => '24-ଘଣ୍ଟା',
			'no_weather_card' => 'ସହର ଯୋଗ କରନ୍ତୁ',
			'drizzle' => 'ଝିରିମିରି ବର୍ଷା',
			'humidity' => 'ଆର୍ଦ୍ରତା',
			'telegram' => 'ଟେଲିଗ୍ରାମ',
			'functions' => 'କାର୍ଯ୍ୟଗୁଡ଼ିକ',
			'cities' => 'ସହରଗୁଡ଼ିକ',
			'southeast' => 'ଦକ୍ଷିଣ-ପୂର୍ବ',
			'validate_number' => 'ଦୟାକରି ଏକ ବୈଧ ସଂଖ୍ୟା ପ୍ରବେଶ କରନ୍ତୁ',
			'city' => 'ସହର',
			'uv_high' => 'ଅଧିକ',
			'time' => 'ସହରରେ ସମୟ',
			'uv_low' => 'କମ୍',
			'name3' => 'ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ',
			'apparent_temperature_min' => 'ସର୍ବନିମ୍ନ ସ୍ପଷ୍ଟ ତାପମାତ୍ରା',
			'direction' => 'ଦିଗ',
			'heavy_rains' => 'ବର୍ଷାର ଝଡ଼',
			'apparent_temperature_max' => 'ସର୍ବାଧିକ ସ୍ପଷ୍ଟ ତାପମାତ୍ରା',
			'k_12' => '12-ଘଣ୍ଟା',
			'discord' => 'ଡିସ୍କର୍ଡ',
			'discard_changes' => 'ଆପଣ ନିଶ୍ଚିତ ରୂପେ ଆପଣଙ୍କର ପରିବର୍ତ୍ତନଗୁଡିକୁ ବାତିଲ କରିବାକୁ ଚାହାଁନ୍ତି କି?',
			'notifications' => 'ବିଜ୍ଞପ୍ତି',
			'mph' => 'ମାଇଲ୍/ଘଣ୍ଟା',
			'west' => 'ପଶ୍ଚିମ',
			'validate90' => 'ମୂଲ୍ୟ -90 ଏବଂ 90 ମଧ୍ୟରେ ହେବା ଆବଶ୍ୟକ',
			'name2' => 'ସୁବିଧାଜନକ ଡିଜାଇନ୍',
			'feels' => 'ଅନୁଭବ ହୁଏ',
			'precipitation_probability' => 'ବୃଷ୍ଟିପାତର ସମ୍ଭାବନା',
			'license' => 'ଲାଇସେନ୍ସ',
			'widget_background' => 'ୱିଜେଟ୍ ପୃଷ୍ଠଭୂମି',
			'large_element' => 'ବଡ଼ ପାଣିପାଗ ପ୍ରଦର୍ଶନ',
			'unsaved_changes' => 'ସଂରକ୍ଷିତ ନହୋଇଥିବା ପରିବର୍ତ୍ତନ',
			'drizzling_rain' => 'ଜମାଟ ବାନ୍ଧୁଥିବା ଝିରିମିରି ବର୍ଷା',
			'cloudy' => 'ମେଘାଚ୍ଛନ୍ନ',
			'widget' => 'ୱିଜେଟ୍',
			'precipitation' => 'ବୃଷ୍ଟିପାତ',
			'delete' => 'ଡିଲିଟ୍ କରନ୍ତୁ',
			'deleted_cache_store' => 'କ୍ୟାଶ୍ ସଫା କରୁଛି',
			'map' => 'ମାନଚିତ୍ର',
			'description3' => 'ଯଦି ଆପଣ କୌଣସି ସମସ୍ୟାର ସମ୍ମୁଖୀନ ହୁଅନ୍ତି, ଦୟାକରି ଇମେଲ୍ ମାଧ୍ୟମରେ କିମ୍ବା ଆପ୍ଲିକେସନ୍ ସମୀକ୍ଷାରେ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
			'north' => 'ଉତ୍ତର',
			'measurements' => 'ମାପ ପ୍ରଣାଳୀ',
			'start' => 'ଆରମ୍ଭ କରନ୍ତୁ',
			'settings_full' => 'ସେଟିଂସ୍',
			'high' => 'ଅଧିକ',
			'daily_variables' => 'ଦୈନିକ ପାଣିପାଗ ଭେରିଏବଲ୍',
			'low' => 'କମ୍',
			'on_inter' => 'ପାଣିପାଗ ତଥ୍ୟ ପାଇବା ପାଇଁ ଇଣ୍ଟରନେଟ୍ ଅନ୍ କରନ୍ତୁ।',
			'thunderstorm' => 'ବଜ୍ରବିଦ୍ୟୁତ୍',
			'version' => 'ଆପ୍ଲିକେସନ୍ ସଂସ୍କରଣ',
			'project' => 'ପ୍ରୋଜେକ୍ଟ ଚାଲୁଛି',
			'amoled_theme' => 'AMOLED ଥିମ୍',
			'deleted_card_weather_query' => 'ଆପଣ ପ୍ରକୃତରେ ସହରକୁ ଡିଲିଟ୍ କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?',
			'northeast' => 'ଉତ୍ତର-ପୂର୍ବ',
			'add_widget' => 'ୱିଜେଟ୍ ଯୋଗ କରନ୍ତୁ',
			'fog' => 'କୁହୁଡ଼ି',
			'description2' => 'ସମସ୍ତ ନେଭିଗେସନ୍ ଆପ୍ଲିକେସନ୍ ସହିତ ଯଥାସମ୍ଭବ ସୁବିଧାଜନକ ଏବଂ ଶୀଘ୍ର ଯୋଗାଯୋଗ କରିବା ପାଇଁ ଡିଜାଇନ୍ କରାଯାଇଛି।',
			'mm' => 'ମି.ମି.',
			'search_city' => 'ଆପଣଙ୍କ ସହର ଖୋଜନ୍ତୁ',
			'weather_more' => '12-ଦିନର ପାଣିପାଗ ପୂର୍ବାନୁମାନ',
			'round_degree' => 'ଗୋଲାକାର ଡିଗ୍ରୀ',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'ସହର ଡାଟା ଅନୁସନ୍ଧାନ କରନ୍ତୁ କିମ୍ବା ମାନୁଆଲ୍ ଭାବରେ ପ୍ରବେଶ କରନ୍ତୁ',
			'validate_name' => 'ଦୟାକରି ନାମ ପ୍ରବେଶ କରନ୍ତୁ',
			'sunrise' => 'ସୂର୍ଯ୍ୟୋଦୟ',
			'km' => 'କି.ମି.',
			'district' => 'ଜିଲ୍ଲା',
			'southwest' => 'ଦକ୍ଷିଣ-ପଶ୍ଚିମ',
			'degrees' => 'ଡିଗ୍ରୀ',
			'clear_cache_store' => 'କ୍ୟାଶ୍ ସଫା କରନ୍ତୁ',
			'skip' => 'ଛାଡନ୍ତୁ',
			'h_pa' => 'ହେକ୍ଟୋପାସ୍କାଲ୍',
			'appearance' => 'ରୂପ',
			'time_start' => 'ଆରମ୍ଭ ସମୟ',
			'ready' => 'ପ୍ରସ୍ତୁତ',
			'kph' => 'କି.ମି./ଘଣ୍ଟା',
			'deleted_cache_store_query' => 'ଆପଣ ପ୍ରକୃତରେ କ୍ୟାଶ୍ ସଫା କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?',
			'widget_text' => 'ୱିଜେଟ୍ ଟେକ୍ସଟ୍',
			'support' => 'ଦାନ କରନ୍ତୁ',
			'groups' => 'ଆମର ଗୋଷ୍ଠୀ',
			'system' => 'ସିଷ୍ଟମ୍',
			'sunset' => 'ସୂର୍ଯ୍ୟାସ୍ତ',
			'dewpoint' => 'ଶିଶିର ବିନ୍ଦୁ',
			'shortwave_radiation' => 'ସର୍ଟୱେଭ୍ ବିକିରଣ',
			'language' => 'ଭାଷା',
			'hide_map' => 'ମାନଚିତ୍ର ଲୁଚାନ୍ତୁ',
			'cancel' => 'ବାତିଲ୍ କରନ୍ତୁ',
			'loading' => 'ଲୋଡ୍ ହେଉଛି...',
			'timeformat' => 'ସମୟ ଫର୍ମାଟ୍',
			'lat' => 'ଅକ୍ଷାଂଶ',
			'data' => 'ତଥ୍ୟ',
			'visibility' => 'ଦୃଶ୍ୟମାନତା',
			'deleted_card_weather' => 'ସହର ଡିଲିଟ୍ କରନ୍ତୁ',
			'celsius' => 'ସେଲସିୟସ୍',
			'no_location' => 'ବର୍ତ୍ତମାନର ସ୍ଥାନ ପାଇଁ ପାଣିପାଗ ତଥ୍ୟ ପାଇବା ପାଇଁ ଲୋକେସନ୍ ସେବା ସକ୍ଷମ କରନ୍ତୁ।',
			'create' => 'ସୃଷ୍ଟି କରନ୍ତୁ',
			'edit' => 'ସମ୍ପାଦନା କରନ୍ତୁ',
			'search' => 'ଖୋଜନ୍ତୁ...',
			'uv_extreme' => 'ଅତ୍ୟଧିକ',
			'light' => 'ଆଲୋକ',
			'cloudcover' => 'ମେଘ ଆବରଣ',
			'uv_very_high' => 'ବହୁତ ଅଧିକ',
			'snow' => 'ବରଫ',
			'done' => 'ସମ୍ପନ୍ନ',
			'theme' => 'ଥିମ୍',
			'name' => 'ପାଣିପାଗ',

			'today' => 'ଆଜି',
			'tomorrow' => 'ଆଗାମିକାଲି',
			'time_range' => 'ଆବୃତ୍ତି (ଘଣ୍ଟାରେ)',
			'about_app' => 'ଆପ ବିଷୟରେ',
			'save' => 'ସଂରକ୍ଷଣ',
			'evaporation' => 'ବାଷ୍ପୀଭବନ',
			'freezing_rain' => 'ଜମାଟ ବାନ୍ଧୁଥିବା ବର୍ଷା',
			'uv_average' => 'ମଧ୍ୟମ',
			'reset_color' => 'ଡିଫଲ୍ଟକୁ ରିସେଟ୍ କରନ୍ତୁ',
			'metric' => 'ମେଟ୍ରିକ୍',
			'overcast' => 'ମେଘରେ ଆବୃତ',
			'pressure' => 'ଚାପ',
			'inch' => 'ଇଞ୍ଚ',
			'imperial' => 'ଇମ୍ପେରିଆଲ୍',
			'location' => 'ସ୍ଥାନ',
			'error_occurred' => 'ଏକ ତ୍ରୁଟି ଘଟିଛି',
			'validate_value' => 'ଦୟାକରି ମୂଲ୍ୟ ପ୍ରବେଶ କରନ୍ତୁ',
			'lon' => 'ରେଖାଂଶ',
			'wind' => 'ପବନ',
			'normal' => 'ସାଧାରଣ',
			'dark' => 'ଅନ୍ଧାର',
			'settings' => 'ସେଟିଂସ୍',
			'south' => 'ଦକ୍ଷିଣ',
			'windgusts' => 'ପବନର ଝଟକା',
			'northwest' => 'ଉତ୍ତର-ପଶ୍ଚିମ',
			'open_meteo' => 'Open-Meteo ରୁ ତଥ୍ୟ (CC-BY 4.0)',
			'rain' => 'ବର୍ଷା',
			'mm_hg' => 'ମି.ମି. ପାରଦ',
			'validate180' => 'ମୂଲ୍ୟ -180 ଏବଂ 180 ମଧ୍ୟରେ ହେବା ଆବଶ୍ୟକ',
			'description' => 'ଯେକୌଣସି ସ୍ଥାନ ପାଇଁ ପ୍ରତି ଘଣ୍ଟା, ଦିନ ଏବଂ ସପ୍ତାହ ପାଇଁ ଅପଡେଟ୍ ହୋଇଥିବା ପୂର୍ବାନୁମାନ ସହିତ ପାଣିପାଗ ଆପ୍ଲିକେସନ୍।',
			'fahrenheit' => 'ଫାରେନହାଇଟ୍',
			'm_s' => 'ମି./ସେ.',
			'material_color' => 'ଗତିଶୀଳ ରଙ୍ଗ',
			'confirm' => 'ସଂରକ୍ଷଣ',
			'no_results' => 'କୌଣସି ଫଳାଫଳ ନାହିଁ',
			'cities_load_error' => 'ସହରଗୁଡ଼ିକ ଲୋଡ୍ ହେଲା ନାହିଁ',
			'retry' => 'ପୁନଃଚେଷ୍ଟା',
			'city_not_found' => 'ସହର ମିଳିଲା ନାହିଁ',
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
			'last_updated' => 'ଅପଡେଟ୍ ହୋଇଛି',
			'app_font' => 'ଫଣ୍ଟ',
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
