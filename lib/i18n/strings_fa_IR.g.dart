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
class TranslationsFaIr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFaIr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.faIr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa-IR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFaIr _root = this; // ignore: unused_field

	@override 
	TranslationsFaIr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFaIr(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'عدم اتصال به اینترنت';
	@override String get edit_city_hint => 'ویرایش اطلاعات شهر';
	@override String get location_not_found => 'عدم امکان تعیین موقعیت شما';
	@override String get mi => 'mi';
	@override String get next => 'بعدی';
	@override String get discard => 'نادیده گرفتن';
	@override String get east => 'شرق';
	@override String get time_end => 'زمان پایان';
	@override String get search_method => 'از جستجو یا موقعیت جغرافیایی استفاده کنید';
	@override String get hourly_variables => 'متغیرهای ساعتی هواشناسی';
	@override String get uv_index => 'شاخص اشعه ماوراء بنفش';
	@override String get clear_sky => 'آسمان صاف';
	@override String get k_24 => '۲۴ ساعته';
	@override String get no_weather_card => 'یک شهر اضافه کنید';
	@override String get drizzle => 'ریز باران';
	@override String get humidity => 'رطوبت';
	@override String get telegram => 'تلگرام';
	@override String get functions => 'کارکرد';
	@override String get cities => 'شهر ها';
	@override String get southeast => 'جنوب شرقی';
	@override String get validate_number => 'لطفاً یک مقدار معتبر وارد کنید.';
	@override String get city => 'شهر';
	@override String get uv_high => 'زیاد';
	@override String get time => 'زمان در این شهر';
	@override String get uv_low => 'کم';
	@override String get name3 => 'ارتباط باما';
	@override String get apparent_temperature_min => 'حداقل دمای ظاهری';
	@override String get direction => 'جهت';
	@override String get heavy_rains => 'باران شدید';
	@override String get apparent_temperature_max => 'حداکثر دمای ظاهری';
	@override String get k_12 => '۱۲ ساعته';
	@override String get discord => 'دیسکورد';
	@override String get discard_changes => 'آیا مطمئن هستید که می‌خواهید تغییرات خود را نادیده بگیرید؟';
	@override String get notifications => 'اعلانات';
	@override String get mph => 'mph';
	@override String get west => 'غرب';
	@override String get validate90 => 'مقدار شما باید بین -۹۰ و ۹۰ باشد.';
	@override String get name2 => 'طراحی راحت';
	@override String get feels => 'دما';
	@override String get precipitation_probability => 'احتمال بارش';
	@override String get license => 'مجوز';
	@override String get widget_background => 'پس زمینه ویجت';
	@override String get large_element => 'نمایش هواشناسی بزرگ';
	@override String get unsaved_changes => 'تغییرات ذخیره نشده';
	@override String get drizzling_rain => 'تگرگ';
	@override String get cloudy => 'ابری';
	@override String get widget => 'ویجت';
	@override String get precipitation => 'ته‌نشینی';
	@override String get delete => 'حذف';
	@override String get deleted_cache_store => 'در حال پاک کردن حافظه نهان';
	@override String get map => 'نقشه';
	@override String get description3 => 'اگر با مشکلی روبرو شدید، لطفاً با ما از طریق ایمیل و یا نظرات برنامه ارتباط بگیرید.';
	@override String get north => 'شمال';
	@override String get measurements => 'سیستم اندازه گیری';
	@override String get start => 'شروع کنید';
	@override String get settings_full => 'تنظیمات';
	@override String get high => 'زیاد';
	@override String get daily_variables => 'متغیرهای روزانه هواشناسی';
	@override String get low => 'کم';
	@override String get on_inter => 'برای دریافت تغییرات جوی اینترنت خود را روشن کنید.';
	@override String get thunderstorm => 'طوفان';
	@override String get version => 'نگارش برنامه';
	@override String get project => 'Project on';
	@override String get amoled_theme => 'پوسته امولد';
	@override String get deleted_card_weather_query => 'آیا از حذف این شهر اطمینان دارید؟';
	@override String get northeast => 'شمال شرقی';
	@override String get add_widget => 'افزودن ویجت';
	@override String get fog => 'مه';
	@override String get description2 => 'برنامه به گونه ای طراحی شده است تا به راحتی بتوانید با آن ارتباط بگیرید.';
	@override String get mm => 'mm';
	@override String get search_city => 'شهر خود را پیدا کنید';
	@override String get weather_more => 'پیش بینی آب و هوا 12 روزه';
	@override String get round_degree => 'درجه گرد';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'جستجو یا وارد کردن دستی اطلاعات شهر';
	@override String get validate_name => 'لطفاً نام را وارد کنید.';
	@override String get sunrise => 'طلوع آفتاب';
	@override String get km => 'km';
	@override String get district => 'ناحیه';
	@override String get southwest => 'جنوب غربی';
	@override String get degrees => 'درجه';
	@override String get clear_cache_store => 'پاک کردن حافظه نهان';
	@override String get skip => 'رد شدن';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'ظاهر';
	@override String get time_start => 'زمان شروع';
	@override String get ready => 'آماده';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'آیا مطمئن هستید که می‌خواهید حافظه نهان را پاک کنید؟';
	@override String get widget_text => 'متن ویجت';
	@override String get support => 'پشتیبانی';
	@override String get groups => 'گروه‌های ما';
	@override String get system => 'سیستم';
	@override String get sunset => 'غروب آفتاب';
	@override String get dewpoint => 'نقطه شبنم';
	@override String get shortwave_radiation => 'تابش موج کوتاه';
	@override String get language => 'زبان';
	@override String get hide_map => 'پنهان کردن نقشه';
	@override String get cancel => 'صرف نظر';
	@override String get loading => 'درحال بارگذاری...';
	@override String get timeformat => 'نوع زمان';
	@override String get lat => 'عرض جغرافیایی';
	@override String get data => 'داده ها';
	@override String get visibility => 'میزان دید';
	@override String get deleted_card_weather => 'حذف یک شهر';
	@override String get celsius => 'سلسیوس';
	@override String get no_location => 'برای دریافت اطلاعات آب و هوا برای مکان فعلی، سرویس مکان را فعال کنید.';
	@override String get create => 'ایجاد';
	@override String get edit => 'ویرایش';
	@override String get search => 'جستجو....';
	@override String get uv_extreme => 'شدید';
	@override String get light => 'روشن';
	@override String get cloudcover => 'پوشش ابری';
	@override String get uv_very_high => 'خیلی زیاد';
	@override String get snow => 'برف';
	@override String get done => 'پایان';
	@override String get theme => 'پوسته';
	@override String get name => 'آب و هوا';
	@override String get time_range => 'فرکانس (بر حسب ساعت)';
	@override String get about_app => 'درباره برنامه';
	@override String get save => 'ذخیره';
	@override String get evaporation => 'تبخیر و تعرق';
	@override String get freezing_rain => 'باران یخ‌زن';
	@override String get uv_average => 'متوسط';
	@override String get reset_color => 'بازنشانی به پیش‌فرض';
	@override String get metric => 'متریک';
	@override String get overcast => 'ابری';
	@override String get pressure => 'فشار';
	@override String get inch => 'inch';
	@override String get imperial => 'بریتانیایی';
	@override String get location => 'مکان';
	@override String get error_occurred => 'خطایی رخ داد';
	@override String get validate_value => 'لطفاً یک مقدار را وارد کنید.';
	@override String get lon => 'طول جغرافیایی';
	@override String get wind => 'باد';
	@override String get normal => 'عادی';
	@override String get dark => 'تیره';
	@override String get settings => 'تنظیمات';
	@override String get south => 'جنوب';
	@override String get windgusts => 'وزش باد';
	@override String get northwest => 'شمال غربی';
	@override String get open_meteo => 'داده‌ها از Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'باران';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'مقدار شما باید بین -۱۸۰ و ۱۸۰ باشد.';
	@override String get description => 'یک برنامه هواشناسی با پیش‌بینی به روز برای هر ساعت، روز و هفته و هر مکان';
	@override String get fahrenheit => 'فارنهایت';
	@override String get m_s => 'm/s';
	@override String get material_color => 'رنگ های پویا';
	@override String get confirm => 'ذخیره';
	@override String get no_results => 'نتیجه‌ای یافت نشد';
	@override String get cities_load_error => 'بارگذاری شهرها ناموفق بود';
	@override String get retry => 'تلاش مجدد';
	@override String get city_not_found => 'شهر یافت نشد';
	@override String get air_quality => 'کیفیت هوا';
	@override String get aqi_standard => 'استاندارد AQI';
	@override String get aqi_european => 'AQI اروپایی';
	@override String get aqi_american => 'AQI آمریکایی';
	@override String get aqi_good => 'خوب';
	@override String get aqi_fair => 'قابل قبول';
	@override String get aqi_moderate => 'متوسط';
	@override String get aqi_poor => 'بد';
	@override String get aqi_very_poor => 'خیلی بد';
	@override String get aqi_extremely_poor => 'بسیار بد';
	@override String get aqi_unhealthy_sensitive => 'مضر برای حساس‌ها';
	@override String get aqi_unhealthy => 'مضر';
	@override String get aqi_very_unhealthy => 'بسیار مضر';
	@override String get aqi_hazardous => 'خطرناک';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'اروپایی';
	@override String get american => 'آمریکایی';
	@override String get aqi_advice_good => 'هوای مناسب برای فعالیت در فضای باز.';
	@override String get aqi_advice_fair => 'به‌طور کلی خوب است. افراد حساس می‌توانند فعالیت طولانی در فضای باز را محدود کنند.';
	@override String get aqi_advice_moderate => 'گروه‌های حساس باید زمان حضور در فضای باز را کاهش دهند.';
	@override String get aqi_advice_poor => 'فعالیت در فضای باز را محدود کنید، به‌ویژه اگر به آلودگی حساس هستید.';
	@override String get aqi_advice_very_poor => 'از فعالیت طولانی در فضای باز خودداری کنید. ممکن است همه تحت تأثیر سلامت قرار گیرند.';
	@override String get aqi_advice_extremely_poor => 'در صورت امکان در خانه بمانید. فعالیت در فضای باز توصیه نمی‌شود.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'آلاینده‌ها';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'به‌روزرسانی';
	@override String get app_font => 'قلم';
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

/// The flat map containing all translations for locale <fa-IR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFaIr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'عدم اتصال به اینترنت',
			'edit_city_hint' => 'ویرایش اطلاعات شهر',
			'location_not_found' => 'عدم امکان تعیین موقعیت شما',
			'mi' => 'mi',
			'next' => 'بعدی',
			'discard' => 'نادیده گرفتن',
			'east' => 'شرق',
			'time_end' => 'زمان پایان',
			'search_method' => 'از جستجو یا موقعیت جغرافیایی استفاده کنید',
			'hourly_variables' => 'متغیرهای ساعتی هواشناسی',
			'uv_index' => 'شاخص اشعه ماوراء بنفش',
			'clear_sky' => 'آسمان صاف',
			'k_24' => '۲۴ ساعته',
			'no_weather_card' => 'یک شهر اضافه کنید',
			'drizzle' => 'ریز باران',
			'humidity' => 'رطوبت',
			'telegram' => 'تلگرام',
			'functions' => 'کارکرد',
			'cities' => 'شهر ها',
			'southeast' => 'جنوب شرقی',
			'validate_number' => 'لطفاً یک مقدار معتبر وارد کنید.',
			'city' => 'شهر',
			'uv_high' => 'زیاد',
			'time' => 'زمان در این شهر',
			'uv_low' => 'کم',
			'name3' => 'ارتباط باما',
			'apparent_temperature_min' => 'حداقل دمای ظاهری',
			'direction' => 'جهت',
			'heavy_rains' => 'باران شدید',
			'apparent_temperature_max' => 'حداکثر دمای ظاهری',
			'k_12' => '۱۲ ساعته',
			'discord' => 'دیسکورد',
			'discard_changes' => 'آیا مطمئن هستید که می‌خواهید تغییرات خود را نادیده بگیرید؟',
			'notifications' => 'اعلانات',
			'mph' => 'mph',
			'west' => 'غرب',
			'validate90' => 'مقدار شما باید بین -۹۰ و ۹۰ باشد.',
			'name2' => 'طراحی راحت',
			'feels' => 'دما',
			'precipitation_probability' => 'احتمال بارش',
			'license' => 'مجوز',
			'widget_background' => 'پس زمینه ویجت',
			'large_element' => 'نمایش هواشناسی بزرگ',
			'unsaved_changes' => 'تغییرات ذخیره نشده',
			'drizzling_rain' => 'تگرگ',
			'cloudy' => 'ابری',
			'widget' => 'ویجت',
			'precipitation' => 'ته‌نشینی',
			'delete' => 'حذف',
			'deleted_cache_store' => 'در حال پاک کردن حافظه نهان',
			'map' => 'نقشه',
			'description3' => 'اگر با مشکلی روبرو شدید، لطفاً با ما از طریق ایمیل و یا نظرات برنامه ارتباط بگیرید.',
			'north' => 'شمال',
			'measurements' => 'سیستم اندازه گیری',
			'start' => 'شروع کنید',
			'settings_full' => 'تنظیمات',
			'high' => 'زیاد',
			'daily_variables' => 'متغیرهای روزانه هواشناسی',
			'low' => 'کم',
			'on_inter' => 'برای دریافت تغییرات جوی اینترنت خود را روشن کنید.',
			'thunderstorm' => 'طوفان',
			'version' => 'نگارش برنامه',
			'project' => 'Project on',
			'amoled_theme' => 'پوسته امولد',
			'deleted_card_weather_query' => 'آیا از حذف این شهر اطمینان دارید؟',
			'northeast' => 'شمال شرقی',
			'add_widget' => 'افزودن ویجت',
			'fog' => 'مه',
			'description2' => 'برنامه به گونه ای طراحی شده است تا به راحتی بتوانید با آن ارتباط بگیرید.',
			'mm' => 'mm',
			'search_city' => 'شهر خود را پیدا کنید',
			'weather_more' => 'پیش بینی آب و هوا 12 روزه',
			'round_degree' => 'درجه گرد',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'جستجو یا وارد کردن دستی اطلاعات شهر',
			'validate_name' => 'لطفاً نام را وارد کنید.',
			'sunrise' => 'طلوع آفتاب',
			'km' => 'km',
			'district' => 'ناحیه',
			'southwest' => 'جنوب غربی',
			'degrees' => 'درجه',
			'clear_cache_store' => 'پاک کردن حافظه نهان',
			'skip' => 'رد شدن',
			'h_pa' => 'hPa',
			'appearance' => 'ظاهر',
			'time_start' => 'زمان شروع',
			'ready' => 'آماده',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'آیا مطمئن هستید که می‌خواهید حافظه نهان را پاک کنید؟',
			'widget_text' => 'متن ویجت',
			'support' => 'پشتیبانی',
			'groups' => 'گروه‌های ما',
			'system' => 'سیستم',
			'sunset' => 'غروب آفتاب',
			'dewpoint' => 'نقطه شبنم',
			'shortwave_radiation' => 'تابش موج کوتاه',
			'language' => 'زبان',
			'hide_map' => 'پنهان کردن نقشه',
			'cancel' => 'صرف نظر',
			'loading' => 'درحال بارگذاری...',
			'timeformat' => 'نوع زمان',
			'lat' => 'عرض جغرافیایی',
			'data' => 'داده ها',
			'visibility' => 'میزان دید',
			'deleted_card_weather' => 'حذف یک شهر',
			'celsius' => 'سلسیوس',
			'no_location' => 'برای دریافت اطلاعات آب و هوا برای مکان فعلی، سرویس مکان را فعال کنید.',
			'create' => 'ایجاد',
			'edit' => 'ویرایش',
			'search' => 'جستجو....',
			'uv_extreme' => 'شدید',
			'light' => 'روشن',
			'cloudcover' => 'پوشش ابری',
			'uv_very_high' => 'خیلی زیاد',
			'snow' => 'برف',
			'done' => 'پایان',
			'theme' => 'پوسته',
			'name' => 'آب و هوا',

			'today' => 'امروز',
			'tomorrow' => 'فردا',
			'time_range' => 'فرکانس (بر حسب ساعت)',
			'about_app' => 'درباره برنامه',
			'save' => 'ذخیره',
			'evaporation' => 'تبخیر و تعرق',
			'freezing_rain' => 'باران یخ‌زن',
			'uv_average' => 'متوسط',
			'reset_color' => 'بازنشانی به پیش‌فرض',
			'metric' => 'متریک',
			'overcast' => 'ابری',
			'pressure' => 'فشار',
			'inch' => 'inch',
			'imperial' => 'بریتانیایی',
			'location' => 'مکان',
			'error_occurred' => 'خطایی رخ داد',
			'validate_value' => 'لطفاً یک مقدار را وارد کنید.',
			'lon' => 'طول جغرافیایی',
			'wind' => 'باد',
			'normal' => 'عادی',
			'dark' => 'تیره',
			'settings' => 'تنظیمات',
			'south' => 'جنوب',
			'windgusts' => 'وزش باد',
			'northwest' => 'شمال غربی',
			'open_meteo' => 'داده‌ها از Open-Meteo (CC-BY 4.0)',
			'rain' => 'باران',
			'mm_hg' => 'mmHg',
			'validate180' => 'مقدار شما باید بین -۱۸۰ و ۱۸۰ باشد.',
			'description' => 'یک برنامه هواشناسی با پیش‌بینی به روز برای هر ساعت، روز و هفته و هر مکان',
			'fahrenheit' => 'فارنهایت',
			'm_s' => 'm/s',
			'material_color' => 'رنگ های پویا',
			'confirm' => 'ذخیره',
			'no_results' => 'نتیجه‌ای یافت نشد',
			'cities_load_error' => 'بارگذاری شهرها ناموفق بود',
			'retry' => 'تلاش مجدد',
			'city_not_found' => 'شهر یافت نشد',
			'air_quality' => 'کیفیت هوا',
			'aqi_standard' => 'استاندارد AQI',
			'aqi_european' => 'AQI اروپایی',
			'aqi_american' => 'AQI آمریکایی',
			'aqi_good' => 'خوب',
			'aqi_fair' => 'قابل قبول',
			'aqi_moderate' => 'متوسط',
			'aqi_poor' => 'بد',
			'aqi_very_poor' => 'خیلی بد',
			'aqi_extremely_poor' => 'بسیار بد',
			'aqi_unhealthy_sensitive' => 'مضر برای حساس‌ها',
			'aqi_unhealthy' => 'مضر',
			'aqi_very_unhealthy' => 'بسیار مضر',
			'aqi_hazardous' => 'خطرناک',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'اروپایی',
			'american' => 'آمریکایی',
			'aqi_advice_good' => 'هوای مناسب برای فعالیت در فضای باز.',
			'aqi_advice_fair' => 'به‌طور کلی خوب است. افراد حساس می‌توانند فعالیت طولانی در فضای باز را محدود کنند.',
			'aqi_advice_moderate' => 'گروه‌های حساس باید زمان حضور در فضای باز را کاهش دهند.',
			'aqi_advice_poor' => 'فعالیت در فضای باز را محدود کنید، به‌ویژه اگر به آلودگی حساس هستید.',
			'aqi_advice_very_poor' => 'از فعالیت طولانی در فضای باز خودداری کنید. ممکن است همه تحت تأثیر سلامت قرار گیرند.',
			'aqi_advice_extremely_poor' => 'در صورت امکان در خانه بمانید. فعالیت در فضای باز توصیه نمی‌شود.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'آلاینده‌ها',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'به‌روزرسانی',
			'app_font' => 'قلم',
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
