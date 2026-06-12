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
class TranslationsUrPk extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsUrPk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.urPk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ur-PK>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsUrPk _root = this; // ignore: unused_field

	@override 
	TranslationsUrPk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUrPk(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'انٹرنیٹ نہیں ہے';
	@override String get edit_city_hint => 'شہر کی معلومات میں ترمیم';
	@override String get location_not_found => 'آپ کا مقام معلوم نہیں کیا جا سکا';
	@override String get mi => 'میل';
	@override String get next => 'اگلا';
	@override String get discard => 'مسترد';
	@override String get east => 'مشرق';
	@override String get time_end => 'مختتم کا وقت';
	@override String get search_method => 'تلاش یا جغرافیائی مقام استعمال کریں';
	@override String get hourly_variables => 'ہر گھنٹے کے موسمی متغیرات';
	@override String get uv_index => 'یووی-انڈیکس';
	@override String get clear_sky => 'صاف آسمان';
	@override String get k_24 => '24-گھنٹے';
	@override String get no_weather_card => 'شہر شامل کریں';
	@override String get drizzle => 'بوند بوند بارش';
	@override String get humidity => 'نمائش';
	@override String get telegram => 'ٹیلیگرام';
	@override String get functions => 'فنکشنز';
	@override String get cities => 'شہر';
	@override String get southeast => 'جنوب مشرق';
	@override String get validate_number => 'براہ کرم ایک عدد درج کریں';
	@override String get city => 'شہر';
	@override String get uv_high => 'زیادہ';
	@override String get time => 'شہر میں وقت';
	@override String get uv_low => 'کم';
	@override String get name3 => 'ہم سے رابطہ کریں';
	@override String get apparent_temperature_min => 'کم درج حرارت محسوس';
	@override String get direction => 'سمت';
	@override String get heavy_rains => 'زوردار بارشیں';
	@override String get apparent_temperature_max => 'زیادہ درج حرارت محسوس';
	@override String get k_12 => '12-گھنٹے';
	@override String get discord => 'ڈسکورڈ';
	@override String get discard_changes => 'کیا آپ واقعی اپنی تبدیلیوں کو مسترد کرنا چاہتے ہیں؟';
	@override String get notifications => 'خبریں';
	@override String get mph => 'میل فی گھنٹہ';
	@override String get west => 'مغرب';
	@override String get validate90 => 'قدر -90 سے 90 کے اندر ہونی چاہئے';
	@override String get name2 => 'آسان ڈیزائن';
	@override String get feels => 'محسوس ہوتا ہے';
	@override String get precipitation_probability => 'برسات کی ممکنیت';
	@override String get license => 'لائسنس';
	@override String get widget_background => 'ویجٹ کا پس منظر';
	@override String get large_element => 'بڑے موسم کا ڈسپلے';
	@override String get unsaved_changes => 'غیر محفوظ شدہ تبدیلیاں';
	@override String get drizzling_rain => 'چھچھوندار بارش';
	@override String get cloudy => 'بادلوں سے بھرپور';
	@override String get widget => 'ویجٹ';
	@override String get precipitation => 'برسات';
	@override String get delete => 'حذف کریں';
	@override String get deleted_cache_store => 'کیچ صاف کی جارہی ہے';
	@override String get map => 'نقشہ';
	@override String get description3 => 'اگر آپ کسی بھی مسائل کا سامنا کریں، براہ کرم ای میل یا ایپلیکیشن کے جوابات میں ہم سے رابطہ کریں۔';
	@override String get north => 'شمال';
	@override String get measurements => 'پیمائش کی نظام';
	@override String get start => 'شروع';
	@override String get settings_full => 'ترتیبات';
	@override String get high => 'زیادہ';
	@override String get daily_variables => 'روزانہ کے موسمی متغیرات';
	@override String get low => 'کم';
	@override String get on_inter => 'موسمی معلومات حاصل کرنے کے لئے انٹرنیٹ کو چالنے دیں۔';
	@override String get thunderstorm => 'طوفانی بارش';
	@override String get version => 'ایپ کی ورژن';
	@override String get project => 'پروجیکٹ';
	@override String get amoled_theme => 'AMOLED تھیم';
	@override String get deleted_card_weather_query => 'کیا آپ واقعی شہر کو حذف کرنا چاہتے ہیں؟';
	@override String get northeast => 'شمال مشرق';
	@override String get add_widget => 'ویجٹ شامل کریں';
	@override String get fog => 'کھسک';
	@override String get description2 => 'تمام نیویگیشن کو ایسا ترتیب دیا گیا ہے کہ آپ ایپلیکیشن کے ساتھ سب سے زیادہ آسان اور تیزی سے تعامل کر سکیں۔';
	@override String get mm => 'ملی میٹر';
	@override String get search_city => 'اپنا شہر تلاش کریں';
	@override String get weather_more => '12 دنوں کی موسمی توقعات';
	@override String get round_degree => 'ڈگری گھیریں';
	@override String get w_m2 => 'واٹ/میٹر مربع';
	@override String get create_city_hint => 'شہر کا ڈیٹا تلاش کریں یا دستی طور پر درج کریں';
	@override String get validate_name => 'براہ کرم نام درج کریں';
	@override String get sunrise => 'طلوع آفتاب';
	@override String get km => 'کلومیٹر';
	@override String get district => 'ضلع';
	@override String get southwest => 'جنوب مغرب';
	@override String get degrees => 'درجہ';
	@override String get clear_cache_store => 'کیچ صاف کریں';
	@override String get skip => 'چھوڑیں';
	@override String get h_pa => 'ہیکٹو پاسکل';
	@override String get appearance => 'ظاہریت';
	@override String get time_start => 'شروع کا وقت';
	@override String get ready => 'تیار';
	@override String get kph => 'کلومیٹر فی گھنٹہ';
	@override String get deleted_cache_store_query => 'کیا آپ واقعی کیچ صاف کرنا چاہتے ہیں؟';
	@override String get widget_text => 'ویجٹ کا مواد';
	@override String get support => 'حمایت';
	@override String get groups => 'ہماری گروپس';
	@override String get system => 'سسٹم';
	@override String get sunset => 'غروب آفتاب';
	@override String get dewpoint => 'دھوا پوائنٹ';
	@override String get shortwave_radiation => 'چھوٹی موجی شعاع';
	@override String get language => 'زبان';
	@override String get hide_map => 'نقشہ چھپائیں';
	@override String get cancel => 'منسوخ کریں';
	@override String get loading => 'لوڈ ہو رہا ہے...';
	@override String get timeformat => 'وقت کی شکل';
	@override String get lat => 'عرض';
	@override String get data => 'ڈیٹا';
	@override String get visibility => 'دیکھنے کی صلاحیت';
	@override String get deleted_card_weather => 'شہر کو حذف کر رہا ہے';
	@override String get celsius => 'سینٹی گریڈ';
	@override String get no_location => 'موسمی معلومات حاصل کرنے کے لئے مقام کی تشخیص کی خدمات کو چالنے دیں۔';
	@override String get create => 'تخلیق کریں';
	@override String get edit => 'ترمیم';
	@override String get search => 'تلاش کریں...';
	@override String get uv_extreme => 'بہتی کٹھن';
	@override String get light => 'روشن';
	@override String get cloudcover => 'ابری پردہ';
	@override String get uv_very_high => 'بہت زیادہ';
	@override String get snow => 'برف';
	@override String get done => 'ہوگیا';
	@override String get theme => 'تھیم';
	@override String get name => 'موسم';
	@override String get time_range => 'وقت کی مدت (گھنٹوں میں)';
	@override String get about_app => 'ایپ کے بارے میں';
	@override String get save => 'محفوظ';
	@override String get evaporation => 'بخاری';
	@override String get freezing_rain => 'ٹھنڈی بارش';
	@override String get uv_average => 'معتدل';
	@override String get reset_color => 'ڈیفالٹ پر بحال کریں';
	@override String get metric => 'میٹرک';
	@override String get overcast => 'دھندلے';
	@override String get pressure => 'دباؤ';
	@override String get inch => 'انچ';
	@override String get imperial => 'امپیریل';
	@override String get location => 'مقام';
	@override String get error_occurred => 'ایک خرابی پیش آئی';
	@override String get validate_value => 'براہ کرم قدر درج کریں';
	@override String get lon => 'طول';
	@override String get wind => 'باد';
	@override String get normal => 'عام';
	@override String get dark => 'اندھیری';
	@override String get settings => 'ترتیبات';
	@override String get south => 'جنوب';
	@override String get windgusts => 'گرج';
	@override String get northwest => 'شمال مغرب';
	@override String get open_meteo => 'Open-Meteo سے ڈیٹا (CC-BY 4.0)';
	@override String get rain => 'بارش';
	@override String get mm_hg => 'ملی میٹر مرکری';
	@override String get validate180 => 'قدر -180 سے 180 کے اندر ہونی چاہئے';
	@override String get description => 'ہر جگہ کے لیے ہر گھنٹے، ہر دن اور ہر ہفتے کے لیے مواقع پر تازہ پیشگوئیوں کے ساتھ موسم کا ایپلیکیشن۔';
	@override String get fahrenheit => 'فارن ہائٹ';
	@override String get m_s => 'میٹر/سیکنڈ';
	@override String get material_color => 'موادی رنگیں';
	@override String get confirm => 'محفوظ';
	@override String get no_results => 'کوئی نتائج نہیں';
	@override String get cities_load_error => 'شہر لوڈ نہیں ہو سکے';
	@override String get retry => 'دوبارہ کوشش';
	@override String get city_not_found => 'شہر نہیں ملا';
	@override String get air_quality => 'ہوا کی کوالٹی';
	@override String get aqi_standard => 'AQI معیار';
	@override String get aqi_european => 'یورپی AQI';
	@override String get aqi_american => 'امریکی AQI';
	@override String get aqi_good => 'اچھا';
	@override String get aqi_fair => 'ٹھیک';
	@override String get aqi_moderate => 'درمیانہ';
	@override String get aqi_poor => 'خراب';
	@override String get aqi_very_poor => 'بہت خراب';
	@override String get aqi_extremely_poor => 'انتہائی خراب';
	@override String get aqi_unhealthy_sensitive => 'حساس افراد کے لیے نقصان دہ';
	@override String get aqi_unhealthy => 'نقصان دہ';
	@override String get aqi_very_unhealthy => 'بہت نقصان دہ';
	@override String get aqi_hazardous => 'خطرناک';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'یورپی';
	@override String get american => 'امریکی';
	@override String get aqi_advice_good => 'بیرونی سرگرمیوں کے لیے اچھا ہوا۔';
	@override String get aqi_advice_fair => 'مجموعی طور پر ٹھیک ہے۔ حساس افراد طویل بیرونی سرگرمی محدود کر سکتے ہیں۔';
	@override String get aqi_advice_moderate => 'حساس گروہوں کو بیرون وقت کم کرنا چاہیے۔';
	@override String get aqi_advice_poor => 'بیرونی سرگرمی محدود کریں، خاص طور پر اگر آپ آلودگی کے حساس ہیں۔';
	@override String get aqi_advice_very_poor => 'طویل بیرونی سرگرمی سے بچیں۔ سب کو صحت پر اثر محسوس ہو سکتا ہے۔';
	@override String get aqi_advice_extremely_poor => 'اگر ممکن ہو تو اندر رہیں۔ بیرونی سرگرمی کی سفارش نہیں کی جاتی۔';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'آلودگی';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'اپ ڈیٹ';
	@override String get app_font => 'فونٹ';
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
	@override String get today => 'آج';
	@override String get tomorrow => 'کل';
}

/// The flat map containing all translations for locale <ur-PK>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsUrPk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'انٹرنیٹ نہیں ہے',
			'edit_city_hint' => 'شہر کی معلومات میں ترمیم',
			'location_not_found' => 'آپ کا مقام معلوم نہیں کیا جا سکا',
			'mi' => 'میل',
			'next' => 'اگلا',
			'discard' => 'مسترد',
			'east' => 'مشرق',
			'time_end' => 'مختتم کا وقت',
			'search_method' => 'تلاش یا جغرافیائی مقام استعمال کریں',
			'hourly_variables' => 'ہر گھنٹے کے موسمی متغیرات',
			'uv_index' => 'یووی-انڈیکس',
			'clear_sky' => 'صاف آسمان',
			'k_24' => '24-گھنٹے',
			'no_weather_card' => 'شہر شامل کریں',
			'drizzle' => 'بوند بوند بارش',
			'humidity' => 'نمائش',
			'telegram' => 'ٹیلیگرام',
			'functions' => 'فنکشنز',
			'cities' => 'شہر',
			'southeast' => 'جنوب مشرق',
			'validate_number' => 'براہ کرم ایک عدد درج کریں',
			'city' => 'شہر',
			'uv_high' => 'زیادہ',
			'time' => 'شہر میں وقت',
			'uv_low' => 'کم',
			'name3' => 'ہم سے رابطہ کریں',
			'apparent_temperature_min' => 'کم درج حرارت محسوس',
			'direction' => 'سمت',
			'heavy_rains' => 'زوردار بارشیں',
			'apparent_temperature_max' => 'زیادہ درج حرارت محسوس',
			'k_12' => '12-گھنٹے',
			'discord' => 'ڈسکورڈ',
			'discard_changes' => 'کیا آپ واقعی اپنی تبدیلیوں کو مسترد کرنا چاہتے ہیں؟',
			'notifications' => 'خبریں',
			'mph' => 'میل فی گھنٹہ',
			'west' => 'مغرب',
			'validate90' => 'قدر -90 سے 90 کے اندر ہونی چاہئے',
			'name2' => 'آسان ڈیزائن',
			'feels' => 'محسوس ہوتا ہے',
			'precipitation_probability' => 'برسات کی ممکنیت',
			'license' => 'لائسنس',
			'widget_background' => 'ویجٹ کا پس منظر',
			'large_element' => 'بڑے موسم کا ڈسپلے',
			'unsaved_changes' => 'غیر محفوظ شدہ تبدیلیاں',
			'drizzling_rain' => 'چھچھوندار بارش',
			'cloudy' => 'بادلوں سے بھرپور',
			'widget' => 'ویجٹ',
			'precipitation' => 'برسات',
			'delete' => 'حذف کریں',
			'deleted_cache_store' => 'کیچ صاف کی جارہی ہے',
			'map' => 'نقشہ',
			'description3' => 'اگر آپ کسی بھی مسائل کا سامنا کریں، براہ کرم ای میل یا ایپلیکیشن کے جوابات میں ہم سے رابطہ کریں۔',
			'north' => 'شمال',
			'measurements' => 'پیمائش کی نظام',
			'start' => 'شروع',
			'settings_full' => 'ترتیبات',
			'high' => 'زیادہ',
			'daily_variables' => 'روزانہ کے موسمی متغیرات',
			'low' => 'کم',
			'on_inter' => 'موسمی معلومات حاصل کرنے کے لئے انٹرنیٹ کو چالنے دیں۔',
			'thunderstorm' => 'طوفانی بارش',
			'version' => 'ایپ کی ورژن',
			'project' => 'پروجیکٹ',
			'amoled_theme' => 'AMOLED تھیم',
			'deleted_card_weather_query' => 'کیا آپ واقعی شہر کو حذف کرنا چاہتے ہیں؟',
			'northeast' => 'شمال مشرق',
			'add_widget' => 'ویجٹ شامل کریں',
			'fog' => 'کھسک',
			'description2' => 'تمام نیویگیشن کو ایسا ترتیب دیا گیا ہے کہ آپ ایپلیکیشن کے ساتھ سب سے زیادہ آسان اور تیزی سے تعامل کر سکیں۔',
			'mm' => 'ملی میٹر',
			'search_city' => 'اپنا شہر تلاش کریں',
			'weather_more' => '12 دنوں کی موسمی توقعات',
			'round_degree' => 'ڈگری گھیریں',
			'w_m2' => 'واٹ/میٹر مربع',
			'create_city_hint' => 'شہر کا ڈیٹا تلاش کریں یا دستی طور پر درج کریں',
			'validate_name' => 'براہ کرم نام درج کریں',
			'sunrise' => 'طلوع آفتاب',
			'km' => 'کلومیٹر',
			'district' => 'ضلع',
			'southwest' => 'جنوب مغرب',
			'degrees' => 'درجہ',
			'clear_cache_store' => 'کیچ صاف کریں',
			'skip' => 'چھوڑیں',
			'h_pa' => 'ہیکٹو پاسکل',
			'appearance' => 'ظاہریت',
			'time_start' => 'شروع کا وقت',
			'ready' => 'تیار',
			'kph' => 'کلومیٹر فی گھنٹہ',
			'deleted_cache_store_query' => 'کیا آپ واقعی کیچ صاف کرنا چاہتے ہیں؟',
			'widget_text' => 'ویجٹ کا مواد',
			'support' => 'حمایت',
			'groups' => 'ہماری گروپس',
			'system' => 'سسٹم',
			'sunset' => 'غروب آفتاب',
			'dewpoint' => 'دھوا پوائنٹ',
			'shortwave_radiation' => 'چھوٹی موجی شعاع',
			'language' => 'زبان',
			'hide_map' => 'نقشہ چھپائیں',
			'cancel' => 'منسوخ کریں',
			'loading' => 'لوڈ ہو رہا ہے...',
			'timeformat' => 'وقت کی شکل',
			'lat' => 'عرض',
			'data' => 'ڈیٹا',
			'visibility' => 'دیکھنے کی صلاحیت',
			'deleted_card_weather' => 'شہر کو حذف کر رہا ہے',
			'celsius' => 'سینٹی گریڈ',
			'no_location' => 'موسمی معلومات حاصل کرنے کے لئے مقام کی تشخیص کی خدمات کو چالنے دیں۔',
			'create' => 'تخلیق کریں',
			'edit' => 'ترمیم',
			'search' => 'تلاش کریں...',
			'uv_extreme' => 'بہتی کٹھن',
			'light' => 'روشن',
			'cloudcover' => 'ابری پردہ',
			'uv_very_high' => 'بہت زیادہ',
			'snow' => 'برف',
			'done' => 'ہوگیا',
			'theme' => 'تھیم',
			'name' => 'موسم',
			'time_range' => 'وقت کی مدت (گھنٹوں میں)',
			'about_app' => 'ایپ کے بارے میں',
			'save' => 'محفوظ',
			'evaporation' => 'بخاری',
			'freezing_rain' => 'ٹھنڈی بارش',
			'uv_average' => 'معتدل',
			'reset_color' => 'ڈیفالٹ پر بحال کریں',
			'metric' => 'میٹرک',
			'overcast' => 'دھندلے',
			'pressure' => 'دباؤ',
			'inch' => 'انچ',
			'imperial' => 'امپیریل',
			'location' => 'مقام',
			'error_occurred' => 'ایک خرابی پیش آئی',
			'validate_value' => 'براہ کرم قدر درج کریں',
			'lon' => 'طول',
			'wind' => 'باد',
			'normal' => 'عام',
			'dark' => 'اندھیری',
			'settings' => 'ترتیبات',
			'south' => 'جنوب',
			'windgusts' => 'گرج',
			'northwest' => 'شمال مغرب',
			'open_meteo' => 'Open-Meteo سے ڈیٹا (CC-BY 4.0)',
			'rain' => 'بارش',
			'mm_hg' => 'ملی میٹر مرکری',
			'validate180' => 'قدر -180 سے 180 کے اندر ہونی چاہئے',
			'description' => 'ہر جگہ کے لیے ہر گھنٹے، ہر دن اور ہر ہفتے کے لیے مواقع پر تازہ پیشگوئیوں کے ساتھ موسم کا ایپلیکیشن۔',
			'fahrenheit' => 'فارن ہائٹ',
			'm_s' => 'میٹر/سیکنڈ',
			'material_color' => 'موادی رنگیں',
			'confirm' => 'محفوظ',
			'no_results' => 'کوئی نتائج نہیں',
			'cities_load_error' => 'شہر لوڈ نہیں ہو سکے',
			'retry' => 'دوبارہ کوشش',
			'city_not_found' => 'شہر نہیں ملا',
			'air_quality' => 'ہوا کی کوالٹی',
			'aqi_standard' => 'AQI معیار',
			'aqi_european' => 'یورپی AQI',
			'aqi_american' => 'امریکی AQI',
			'aqi_good' => 'اچھا',
			'aqi_fair' => 'ٹھیک',
			'aqi_moderate' => 'درمیانہ',
			'aqi_poor' => 'خراب',
			'aqi_very_poor' => 'بہت خراب',
			'aqi_extremely_poor' => 'انتہائی خراب',
			'aqi_unhealthy_sensitive' => 'حساس افراد کے لیے نقصان دہ',
			'aqi_unhealthy' => 'نقصان دہ',
			'aqi_very_unhealthy' => 'بہت نقصان دہ',
			'aqi_hazardous' => 'خطرناک',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'یورپی',
			'american' => 'امریکی',
			'aqi_advice_good' => 'بیرونی سرگرمیوں کے لیے اچھا ہوا۔',
			'aqi_advice_fair' => 'مجموعی طور پر ٹھیک ہے۔ حساس افراد طویل بیرونی سرگرمی محدود کر سکتے ہیں۔',
			'aqi_advice_moderate' => 'حساس گروہوں کو بیرون وقت کم کرنا چاہیے۔',
			'aqi_advice_poor' => 'بیرونی سرگرمی محدود کریں، خاص طور پر اگر آپ آلودگی کے حساس ہیں۔',
			'aqi_advice_very_poor' => 'طویل بیرونی سرگرمی سے بچیں۔ سب کو صحت پر اثر محسوس ہو سکتا ہے۔',
			'aqi_advice_extremely_poor' => 'اگر ممکن ہو تو اندر رہیں۔ بیرونی سرگرمی کی سفارش نہیں کی جاتی۔',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'آلودگی',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'اپ ڈیٹ',
			'app_font' => 'فونٹ',
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
			'today' => 'آج',
			'tomorrow' => 'کل',
			_ => null,
		};
	}
}
