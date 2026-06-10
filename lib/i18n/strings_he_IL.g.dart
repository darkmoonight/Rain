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
class TranslationsHeIl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHeIl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.heIl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he-IL>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHeIl _root = this; // ignore: unused_field

	@override 
	TranslationsHeIl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHeIl(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'אין אינטרנט';
	@override String get edit_city_hint => 'עריכת מידע על העיר';
	@override String get location_not_found => 'לא ניתן לקבוע את מיקומך';
	@override String get mi => 'מייל';
	@override String get next => 'הבא';
	@override String get discard => 'בטל';
	@override String get east => 'מזרח';
	@override String get time_end => 'זמן סיום';
	@override String get search_method => 'השתמש בחיפוש או במיקום גיאוגרפי';
	@override String get hourly_variables => 'משתני מזג אויר שעתיים';
	@override String get uv_index => 'מדד UV';
	@override String get clear_sky => 'שמיים בהירים';
	@override String get k_24 => '24 שעות';
	@override String get no_weather_card => 'הוסף עיר';
	@override String get drizzle => 'טפטוף';
	@override String get humidity => 'לחות';
	@override String get telegram => 'טלגרם';
	@override String get functions => 'פונקציות';
	@override String get cities => 'ערים';
	@override String get southeast => 'דרום מזרח';
	@override String get validate_number => 'אנא הזן מספר תקין';
	@override String get city => 'עיר';
	@override String get uv_high => 'גבוה';
	@override String get time => 'זמן בעיר';
	@override String get uv_low => 'נמוך';
	@override String get name3 => 'צור קשר';
	@override String get apparent_temperature_min => 'טמפרטורה נתפסת מינימלית';
	@override String get direction => 'כיוון';
	@override String get heavy_rains => 'ממטרים';
	@override String get apparent_temperature_max => 'טמפרטורה נתפסת מקסימלית';
	@override String get k_12 => '12 שעות';
	@override String get discord => 'דיסקורד';
	@override String get discard_changes => 'האם אתה בטוח שברצונך לבטל את השינויים?';
	@override String get notifications => 'התראות';
	@override String get mph => 'מייל/שעה';
	@override String get west => 'מערב';
	@override String get validate90 => 'הערך חייב להיות בין -90 ל-90';
	@override String get name2 => 'עיצוב נוח';
	@override String get feels => 'מרגיש כמו';
	@override String get precipitation_probability => 'הסתברות למשקעים';
	@override String get license => 'רישיונות';
	@override String get widget_background => 'רקע ווידג\'ט';
	@override String get large_element => 'תצוגת מזג אויר גדולה';
	@override String get unsaved_changes => 'שינויים שלא נשמרו';
	@override String get drizzling_rain => 'טפטוף קפוא';
	@override String get cloudy => 'מעונן';
	@override String get widget => 'ווידג\'ט';
	@override String get precipitation => 'משקעים';
	@override String get delete => 'מחק';
	@override String get deleted_cache_store => 'ניקוי מטמון';
	@override String get map => 'מפה';
	@override String get description3 => 'אם אתה נתקל בבעיות, אנא צור קשר איתנו באמצעות דוא"ל או בביקורות האפליקציה.';
	@override String get north => 'צפון';
	@override String get measurements => 'מערכת מדידה';
	@override String get start => 'התחל';
	@override String get settings_full => 'הגדרות';
	@override String get high => 'גבוה';
	@override String get daily_variables => 'משתני מזג אויר יומיים';
	@override String get low => 'נמוך';
	@override String get on_inter => 'הפעל את האינטרנט כדי לקבל נתוני מזג אויר.';
	@override String get thunderstorm => 'סופת רעמים';
	@override String get version => 'גרסת האפליקציה';
	@override String get project => 'פרויקט ב';
	@override String get amoled_theme => 'ערכת נושא AMOLED';
	@override String get deleted_card_weather_query => 'האם אתה בטוח שברצונך למחוק את העיר?';
	@override String get northeast => 'צפון מזרח';
	@override String get add_widget => 'הוסף ווידג\'ט';
	@override String get fog => 'ערפל';
	@override String get description2 => 'כל הניווט מעוצב לאינטראקציה עם האפליקציה בצורה הנוחה והמהירה ביותר.';
	@override String get mm => 'מ"מ';
	@override String get no_desc_data => 'אין נתונים';
	@override String get search_city => 'מצא את העיר שלך';
	@override String get weather_more => 'תחזית מזג אויר ל-12 ימים';
	@override String get round_degree => 'מעלות מעוגלות';
	@override String get w_m2 => 'וואט/מ²';
	@override String get create_city_hint => 'חפש או הזן נתוני עיר ידנית';
	@override String get validate_name => 'אנא הזן שם';
	@override String get sunrise => 'זריחה';
	@override String get km => 'ק"מ';
	@override String get district => 'מחוז';
	@override String get southwest => 'דרום מערב';
	@override String get degrees => 'מעלות';
	@override String get clear_cache_store => 'נקה מטמון';
	@override String get skip => 'דלג';
	@override String get h_pa => 'הקטופסקל';
	@override String get appearance => 'מראה';
	@override String get time_start => 'זמן התחלה';
	@override String get ready => 'מוכן';
	@override String get kph => 'קמ"ש';
	@override String get deleted_cache_store_query => 'האם אתה בטוח שברצונך לנקות את המטמון?';
	@override String get widget_text => 'טקסט ווידג\'ט';
	@override String get support => 'תרום';
	@override String get groups => 'הקבוצות שלנו';
	@override String get system => 'מערכת';
	@override String get sunset => 'שקיעה';
	@override String get dewpoint => 'נקודת טל';
	@override String get shortwave_radiation => 'קרינה קצרת גל';
	@override String get language => 'שפה';
	@override String get hide_map => 'הסתר מפה';
	@override String get cancel => 'בטל';
	@override String get loading => 'טוען...';
	@override String get timeformat => 'פורמט זמן';
	@override String get lat => 'קו רוחב';
	@override String get data => 'נתונים';
	@override String get visibility => 'נראות';
	@override String get deleted_card_weather => 'מחיקת עיר';
	@override String get celsius => 'צלזיוס';
	@override String get no_location => 'הפעל את שירות המיקום כדי לקבל נתוני מזג אויר למיקום הנוכחי.';
	@override String get create => 'צור';
	@override String get edit => 'ערוך';
	@override String get search => 'חיפוש...';
	@override String get uv_extreme => 'קיצוני';
	@override String get light => 'בהיר';
	@override String get cloudcover => 'כיסוי עננים';
	@override String get uv_very_high => 'גבוה מאוד';
	@override String get snow => 'שלג';
	@override String get done => 'סיום';
	@override String get theme => 'ערכת נושא';
	@override String get name => 'מזג אויר';
	@override String get time_range => 'תדירות (בשעות)';
	@override String get about_app => 'אודות האפליקציה';
	@override String get save => 'שמור';
	@override String get evaporation => 'אידוי';
	@override String get freezing_rain => 'גשם קפוא';
	@override String get uv_average => 'בינוני';
	@override String get reset_color => 'אפס לברירת מחדל';
	@override String get metric => 'מטרי';
	@override String get overcast => 'מעונן כבד';
	@override String get pressure => 'לחץ';
	@override String get inch => 'אינץ\'';
	@override String get imperial => 'אימפריאלי';
	@override String get location => 'מיקום';
	@override String get error_occurred => 'אירעה שגיאה';
	@override String get validate_value => 'אנא הזן ערך';
	@override String get lon => 'קו אורך';
	@override String get wind => 'רוח';
	@override String get normal => 'רגיל';
	@override String get dark => 'כהה';
	@override String get settings => 'הגדרות';
	@override String get south => 'דרום';
	@override String get windgusts => 'משבי רוח';
	@override String get northwest => 'צפון מערב';
	@override String get open_meteo => 'נתונים מ-Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'גשם';
	@override String get mm_hg => 'מ"מ כספית';
	@override String get validate180 => 'הערך חייב להיות בין -180 ל-180';
	@override String get description => 'אפליקציית מזג אויר עם תחזית מעודכנת לכל שעה, יום ושבוע לכל מיקום.';
	@override String get fahrenheit => 'פרנהייט';
	@override String get m_s => 'מ/ש';
	@override String get material_color => 'צבעים דינמיים';
	@override String get confirm => 'שמור';
	@override String get no_results => 'אין תוצאות';
	@override String get cities_load_error => 'טעינת הערים נכשלה';
	@override String get retry => 'נסה שוב';
	@override String get city_not_found => 'העיר לא נמצאה';
	@override String get air_quality => 'איכות אוויר';
	@override String get aqi_standard => 'תקן AQI';
	@override String get aqi_european => 'AQI אירופי';
	@override String get aqi_american => 'AQI אמריקאי';
	@override String get aqi_good => 'טוב';
	@override String get aqi_fair => 'סביר';
	@override String get aqi_moderate => 'בינוני';
	@override String get aqi_poor => 'גרוע';
	@override String get aqi_very_poor => 'גרוע מאוד';
	@override String get aqi_extremely_poor => 'גרוע ביותר';
	@override String get aqi_unhealthy_sensitive => 'לא בריא לרגישים';
	@override String get aqi_unhealthy => 'לא בריא';
	@override String get aqi_very_unhealthy => 'לא בריא מאוד';
	@override String get aqi_hazardous => 'מסוכן';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'אירופי';
	@override String get american => 'אמריקאי';
	@override String get aqi_advice_good => 'אוויר טוב לפעילות בחוץ.';
	@override String get aqi_advice_fair => 'בסך הכל בסדר. אנשים רגישים עשויים להגביל מאמץ ממושך בחוץ.';
	@override String get aqi_advice_moderate => 'קבוצות רגישות צריכות לצמצם זמן בחוץ.';
	@override String get aqi_advice_poor => 'הגבילו פעילות בחוץ, במיוחד אם אתם רגישים לזיהום אוויר.';
	@override String get aqi_advice_very_poor => 'הימנעו ממאמץ ממושך בחוץ. כולם עלולים להרגיש השפעות על הבריאות.';
	@override String get aqi_advice_extremely_poor => 'הישארו בפנים אם אפשר. פעילות בחוץ אינה מומלצת.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'מזהמים';
}

/// The flat map containing all translations for locale <he-IL>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHeIl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'אין אינטרנט',
			'edit_city_hint' => 'עריכת מידע על העיר',
			'location_not_found' => 'לא ניתן לקבוע את מיקומך',
			'mi' => 'מייל',
			'next' => 'הבא',
			'discard' => 'בטל',
			'east' => 'מזרח',
			'time_end' => 'זמן סיום',
			'search_method' => 'השתמש בחיפוש או במיקום גיאוגרפי',
			'hourly_variables' => 'משתני מזג אויר שעתיים',
			'uv_index' => 'מדד UV',
			'clear_sky' => 'שמיים בהירים',
			'k_24' => '24 שעות',
			'no_weather_card' => 'הוסף עיר',
			'drizzle' => 'טפטוף',
			'humidity' => 'לחות',
			'telegram' => 'טלגרם',
			'functions' => 'פונקציות',
			'cities' => 'ערים',
			'southeast' => 'דרום מזרח',
			'validate_number' => 'אנא הזן מספר תקין',
			'city' => 'עיר',
			'uv_high' => 'גבוה',
			'time' => 'זמן בעיר',
			'uv_low' => 'נמוך',
			'name3' => 'צור קשר',
			'apparent_temperature_min' => 'טמפרטורה נתפסת מינימלית',
			'direction' => 'כיוון',
			'heavy_rains' => 'ממטרים',
			'apparent_temperature_max' => 'טמפרטורה נתפסת מקסימלית',
			'k_12' => '12 שעות',
			'discord' => 'דיסקורד',
			'discard_changes' => 'האם אתה בטוח שברצונך לבטל את השינויים?',
			'notifications' => 'התראות',
			'mph' => 'מייל/שעה',
			'west' => 'מערב',
			'validate90' => 'הערך חייב להיות בין -90 ל-90',
			'name2' => 'עיצוב נוח',
			'feels' => 'מרגיש כמו',
			'precipitation_probability' => 'הסתברות למשקעים',
			'license' => 'רישיונות',
			'widget_background' => 'רקע ווידג\'ט',
			'large_element' => 'תצוגת מזג אויר גדולה',
			'unsaved_changes' => 'שינויים שלא נשמרו',
			'drizzling_rain' => 'טפטוף קפוא',
			'cloudy' => 'מעונן',
			'widget' => 'ווידג\'ט',
			'precipitation' => 'משקעים',
			'delete' => 'מחק',
			'deleted_cache_store' => 'ניקוי מטמון',
			'map' => 'מפה',
			'description3' => 'אם אתה נתקל בבעיות, אנא צור קשר איתנו באמצעות דוא"ל או בביקורות האפליקציה.',
			'north' => 'צפון',
			'measurements' => 'מערכת מדידה',
			'start' => 'התחל',
			'settings_full' => 'הגדרות',
			'high' => 'גבוה',
			'daily_variables' => 'משתני מזג אויר יומיים',
			'low' => 'נמוך',
			'on_inter' => 'הפעל את האינטרנט כדי לקבל נתוני מזג אויר.',
			'thunderstorm' => 'סופת רעמים',
			'version' => 'גרסת האפליקציה',
			'project' => 'פרויקט ב',
			'amoled_theme' => 'ערכת נושא AMOLED',
			'deleted_card_weather_query' => 'האם אתה בטוח שברצונך למחוק את העיר?',
			'northeast' => 'צפון מזרח',
			'add_widget' => 'הוסף ווידג\'ט',
			'fog' => 'ערפל',
			'description2' => 'כל הניווט מעוצב לאינטראקציה עם האפליקציה בצורה הנוחה והמהירה ביותר.',
			'mm' => 'מ"מ',
			'no_desc_data' => 'אין נתונים',
			'search_city' => 'מצא את העיר שלך',
			'weather_more' => 'תחזית מזג אויר ל-12 ימים',
			'round_degree' => 'מעלות מעוגלות',
			'w_m2' => 'וואט/מ²',
			'create_city_hint' => 'חפש או הזן נתוני עיר ידנית',
			'validate_name' => 'אנא הזן שם',
			'sunrise' => 'זריחה',
			'km' => 'ק"מ',
			'district' => 'מחוז',
			'southwest' => 'דרום מערב',
			'degrees' => 'מעלות',
			'clear_cache_store' => 'נקה מטמון',
			'skip' => 'דלג',
			'h_pa' => 'הקטופסקל',
			'appearance' => 'מראה',
			'time_start' => 'זמן התחלה',
			'ready' => 'מוכן',
			'kph' => 'קמ"ש',
			'deleted_cache_store_query' => 'האם אתה בטוח שברצונך לנקות את המטמון?',
			'widget_text' => 'טקסט ווידג\'ט',
			'support' => 'תרום',
			'groups' => 'הקבוצות שלנו',
			'system' => 'מערכת',
			'sunset' => 'שקיעה',
			'dewpoint' => 'נקודת טל',
			'shortwave_radiation' => 'קרינה קצרת גל',
			'language' => 'שפה',
			'hide_map' => 'הסתר מפה',
			'cancel' => 'בטל',
			'loading' => 'טוען...',
			'timeformat' => 'פורמט זמן',
			'lat' => 'קו רוחב',
			'data' => 'נתונים',
			'visibility' => 'נראות',
			'deleted_card_weather' => 'מחיקת עיר',
			'celsius' => 'צלזיוס',
			'no_location' => 'הפעל את שירות המיקום כדי לקבל נתוני מזג אויר למיקום הנוכחי.',
			'create' => 'צור',
			'edit' => 'ערוך',
			'search' => 'חיפוש...',
			'uv_extreme' => 'קיצוני',
			'light' => 'בהיר',
			'cloudcover' => 'כיסוי עננים',
			'uv_very_high' => 'גבוה מאוד',
			'snow' => 'שלג',
			'done' => 'סיום',
			'theme' => 'ערכת נושא',
			'name' => 'מזג אויר',
			'time_range' => 'תדירות (בשעות)',
			'about_app' => 'אודות האפליקציה',
			'save' => 'שמור',
			'evaporation' => 'אידוי',
			'freezing_rain' => 'גשם קפוא',
			'uv_average' => 'בינוני',
			'reset_color' => 'אפס לברירת מחדל',
			'metric' => 'מטרי',
			'overcast' => 'מעונן כבד',
			'pressure' => 'לחץ',
			'inch' => 'אינץ\'',
			'imperial' => 'אימפריאלי',
			'location' => 'מיקום',
			'error_occurred' => 'אירעה שגיאה',
			'validate_value' => 'אנא הזן ערך',
			'lon' => 'קו אורך',
			'wind' => 'רוח',
			'normal' => 'רגיל',
			'dark' => 'כהה',
			'settings' => 'הגדרות',
			'south' => 'דרום',
			'windgusts' => 'משבי רוח',
			'northwest' => 'צפון מערב',
			'open_meteo' => 'נתונים מ-Open-Meteo (CC-BY 4.0)',
			'rain' => 'גשם',
			'mm_hg' => 'מ"מ כספית',
			'validate180' => 'הערך חייב להיות בין -180 ל-180',
			'description' => 'אפליקציית מזג אויר עם תחזית מעודכנת לכל שעה, יום ושבוע לכל מיקום.',
			'fahrenheit' => 'פרנהייט',
			'm_s' => 'מ/ש',
			'material_color' => 'צבעים דינמיים',
			'confirm' => 'שמור',
			'no_results' => 'אין תוצאות',
			'cities_load_error' => 'טעינת הערים נכשלה',
			'retry' => 'נסה שוב',
			'city_not_found' => 'העיר לא נמצאה',
			'air_quality' => 'איכות אוויר',
			'aqi_standard' => 'תקן AQI',
			'aqi_european' => 'AQI אירופי',
			'aqi_american' => 'AQI אמריקאי',
			'aqi_good' => 'טוב',
			'aqi_fair' => 'סביר',
			'aqi_moderate' => 'בינוני',
			'aqi_poor' => 'גרוע',
			'aqi_very_poor' => 'גרוע מאוד',
			'aqi_extremely_poor' => 'גרוע ביותר',
			'aqi_unhealthy_sensitive' => 'לא בריא לרגישים',
			'aqi_unhealthy' => 'לא בריא',
			'aqi_very_unhealthy' => 'לא בריא מאוד',
			'aqi_hazardous' => 'מסוכן',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'אירופי',
			'american' => 'אמריקאי',
			'aqi_advice_good' => 'אוויר טוב לפעילות בחוץ.',
			'aqi_advice_fair' => 'בסך הכל בסדר. אנשים רגישים עשויים להגביל מאמץ ממושך בחוץ.',
			'aqi_advice_moderate' => 'קבוצות רגישות צריכות לצמצם זמן בחוץ.',
			'aqi_advice_poor' => 'הגבילו פעילות בחוץ, במיוחד אם אתם רגישים לזיהום אוויר.',
			'aqi_advice_very_poor' => 'הימנעו ממאמץ ממושך בחוץ. כולם עלולים להרגיש השפעות על הבריאות.',
			'aqi_advice_extremely_poor' => 'הישארו בפנים אם אפשר. פעילות בחוץ אינה מומלצת.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'מזהמים',
			_ => null,
		};
	}
}
