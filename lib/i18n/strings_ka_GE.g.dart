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
class TranslationsKaGe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKaGe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.kaGe,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ka-GE>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKaGe _root = this; // ignore: unused_field

	@override 
	TranslationsKaGe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKaGe(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ინტერნეტი არ არის';
	@override String get edit_city_hint => 'ქალაქის ინფორმაციის რედაქტირება';
	@override String get location_not_found => 'თქვენი მდებარეობის დადგენა ვერ მოხერხდა';
	@override String get mi => 'მილი';
	@override String get next => 'შემდეგ';
	@override String get discard => 'გაუქმება';
	@override String get east => 'აღმოსავლეთი';
	@override String get time_end => 'დასრულების დრო';
	@override String get search_method => 'გამოიყენეთ ძებნა ან გეოლოკაცია';
	@override String get hourly_variables => 'საათობრივი ამინდის ცვლადები';
	@override String get uv_index => 'UV-ინდექსი';
	@override String get clear_sky => 'წმინდა ცა';
	@override String get k_24 => '24-საათი';
	@override String get no_weather_card => 'დაამატეთ ქალაქი';
	@override String get drizzle => 'წვიმა';
	@override String get humidity => 'ტენიანობა';
	@override String get telegram => 'Telegram';
	@override String get functions => 'ფუნქციები';
	@override String get cities => 'ქალაქები';
	@override String get southeast => 'სამხრეთ-აღმოსავლეთი';
	@override String get validate_number => 'გთხოვთ შეიყვანოთ ნომერი';
	@override String get city => 'ქალაქი';
	@override String get uv_high => 'მაღალი';
	@override String get time => 'დრო ქალაქში';
	@override String get uv_low => 'დაბალი';
	@override String get name3 => 'შეგვეხმიანე';
	@override String get apparent_temperature_min => 'მინიმალური აშკარა ტემპერატურა';
	@override String get direction => 'მიმართულება';
	@override String get heavy_rains => 'ძლიერი წვიმები';
	@override String get apparent_temperature_max => 'მაქსიმალური აშკარა ტემპერატურა';
	@override String get k_12 => '12-საათი';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'ნამდვილად გსურთ ცვლილებების გაუქმება?';
	@override String get notifications => 'შეტყობინებები';
	@override String get mph => 'მილი/სთ';
	@override String get west => 'დასავლეთი';
	@override String get validate90 => 'მნიშვნელობა უნდა იყოს -90-დან 90-მდე';
	@override String get name2 => 'მართვის კომფორტი';
	@override String get feels => 'გრძნობს';
	@override String get precipitation_probability => 'ნალექების ალბათობა';
	@override String get license => 'ლიცენზიები';
	@override String get widget_background => 'ვიჯეტის ფონი';
	@override String get large_element => 'გადიდი ამინდის გამოჩენა';
	@override String get unsaved_changes => 'შეუნახავი ცვლილებები';
	@override String get drizzling_rain => 'დრიზლინგი წვიმა';
	@override String get cloudy => 'მოღრუბლული';
	@override String get widget => 'ვიჯეტი';
	@override String get precipitation => 'ნალექი';
	@override String get delete => 'ამოღება';
	@override String get deleted_cache_store => 'ქეშის გასუფთავება მიმდინარეობს';
	@override String get map => 'რუკა';
	@override String get description3 => 'თუ გექნებათ ნებისმიერი პრობლემა, გთხოვთ, დაგვეკონტაქტოთ ელ-ფოსტით ან აპლიკაციის მიმოხილვის გვერდზე.';
	@override String get north => 'ჩრდილოეთი';
	@override String get measurements => 'საზომი სისტემა';
	@override String get start => 'დაიწყე';
	@override String get settings_full => 'პარამეტრები';
	@override String get high => 'მაღალი';
	@override String get daily_variables => 'ყოველდღიური ამინდის ცვლადები';
	@override String get low => 'დაბალი';
	@override String get on_inter => 'ჩართეთ ინტერნეტი მეტეოროლოგიური მონაცემების მისაღებად.';
	@override String get thunderstorm => 'ჭექა-ქუხილი';
	@override String get version => 'განაცხადის ვერსია';
	@override String get project => 'პროექტი ჩართულია';
	@override String get amoled_theme => 'AMOLED-თემა';
	@override String get deleted_card_weather_query => 'დარწმუნებული ხართ, რომ გსურთ ქალაქის წაშლა?';
	@override String get northeast => 'ჩრდილო-აღმოსავლეთი';
	@override String get add_widget => 'ვიდჯეტის დამატება';
	@override String get fog => 'ნისლი';
	@override String get description2 => 'ყველა ნავიგაცია შექმნილია ისე, რომ შეგიძლიათ მაქსიმალურად კომფორტულად და სწრაფად იქონოთ აპლიკაციით.';
	@override String get mm => 'მმ';
	@override String get no_desc_data => 'მონაცემები არ არის';
	@override String get search_city => 'იპოვეთ თქვენი ქალაქი';
	@override String get weather_more => '12-დღიანი ამინდის პროგნოზი';
	@override String get round_degree => 'ხარისხი მიჯნურობა';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'მოძებნეთ ან შეიყვანეთ ქალაქის მონაცემები ხელით';
	@override String get validate_name => 'გთხოვთ შეიყვანოთ სახელი';
	@override String get sunrise => 'მზის ამოსვლა';
	@override String get km => 'კმ';
	@override String get district => 'რაიონი';
	@override String get southwest => 'სამხრეთ-დასავლეთი';
	@override String get degrees => 'გრადუსი';
	@override String get clear_cache_store => 'ქეშის გასუფთავება';
	@override String get skip => 'გამოტოვება';
	@override String get h_pa => 'ჰპა';
	@override String get appearance => 'გარეგნობა';
	@override String get time_start => 'დაწყების დრო';
	@override String get ready => 'მზადაა';
	@override String get kph => 'კმ/სთ';
	@override String get deleted_cache_store_query => 'დარწმუნებული ხართ, რომ გსურთ ქეშის გასუფთავება?';
	@override String get widget_text => 'ვიჯეტის ტექსტი';
	@override String get support => 'მხარდაჭერა';
	@override String get groups => 'ჩვენი ჯგუფები';
	@override String get system => 'სისტემა';
	@override String get sunset => 'მზის ჩასვლა';
	@override String get dewpoint => 'დევპოინტი';
	@override String get shortwave_radiation => 'მოკლე ტალღის გამოსხივება';
	@override String get language => 'ენა';
	@override String get hide_map => 'რუკის დამალვა';
	@override String get cancel => 'გაუქმება';
	@override String get loading => 'დატვირთვა...';
	@override String get timeformat => 'დროის ფორმატი';
	@override String get lat => 'სიგანე';
	@override String get data => 'მონაცემები';
	@override String get visibility => 'ხილვადობა';
	@override String get deleted_card_weather => 'ქალაქის წაშლა';
	@override String get celsius => 'ცელსიუსი';
	@override String get no_location => 'ჩართეთ მდებარეობის სერვისი, რომ მიიღოთ ამინდის მონაცემები მიმდინარე ადგილმდებარეობისთვის.';
	@override String get create => 'შექმნა';
	@override String get edit => 'რედაქტირება';
	@override String get search => 'ძიება...';
	@override String get uv_extreme => 'ძლევა ზედა';
	@override String get light => 'სინათლე';
	@override String get cloudcover => 'ღრუბლის საფარი';
	@override String get uv_very_high => 'ძალიან მაღალი';
	@override String get snow => 'თოვლი';
	@override String get done => 'დასრულებულია';
	@override String get theme => 'თემა';
	@override String get name => 'ამინდი';
	@override String get time_range => 'სიხშირე (საათებში)';
	@override String get about_app => 'აპლიკაციის შესახებ';
	@override String get save => 'შენახვა';
	@override String get evaporation => 'აორთქლება';
	@override String get freezing_rain => 'გაყინვის წვიმა';
	@override String get uv_average => 'ზომიერი';
	@override String get reset_color => 'ნაგულისხმევზე დაბრუნება';
	@override String get metric => 'მეტრული';
	@override String get overcast => 'მოსაწყენი';
	@override String get pressure => 'წნევა';
	@override String get inch => 'ინჩი';
	@override String get imperial => 'იმპერიული';
	@override String get location => 'ადგილმდებარეობა';
	@override String get error_occurred => 'მომხდარია შეცდომა';
	@override String get validate_value => 'გთხოვთ შეიყვანოთ მნიშვნელობა';
	@override String get lon => 'გრძედი';
	@override String get wind => 'ქარი';
	@override String get normal => 'ნორმალური';
	@override String get dark => 'ბნელი';
	@override String get settings => 'პარამ.';
	@override String get south => 'სამხრეთი';
	@override String get windgusts => 'ნაკადი';
	@override String get northwest => 'ჩრდილო-დასავლეთი';
	@override String get open_meteo => 'მონაცემები Open-Meteo-დან (CC-BY 4.0)';
	@override String get rain => 'წვიმა';
	@override String get mm_hg => 'მმHg';
	@override String get validate180 => 'მნიშვნელობა უნდა იყოს -180-დან 180-მდე';
	@override String get description => 'აპლიკაცია ამჟამად პროგნოზით ყოველ საათზე, დღეზე და კვირაზე ნებისმიერ ადგილისთვის.';
	@override String get fahrenheit => 'ფარენჰაიტი';
	@override String get m_s => 'მ/წმ';
	@override String get material_color => 'დინამიური ფერები';
	@override String get confirm => 'შენახვა';
	@override String get no_results => 'შედეგები ვერ მოიძებნა';
	@override String get cities_load_error => 'ქალაქების ჩატვირთვა ვერ მოხერხდა';
	@override String get retry => 'თავიდან';
	@override String get city_not_found => 'ქალაქი ვერ მოიძებნა';
	@override String get air_quality => 'ჰაერის ხარისხი';
	@override String get aqi_standard => 'AQI სტანდარტი';
	@override String get aqi_european => 'ევროპული AQI';
	@override String get aqi_american => 'ამერიკული AQI';
	@override String get aqi_good => 'კარგი';
	@override String get aqi_fair => 'საშუალო';
	@override String get aqi_moderate => 'საშუალო';
	@override String get aqi_poor => 'ცუდი';
	@override String get aqi_very_poor => 'ძალიან ცუდი';
	@override String get aqi_extremely_poor => 'უკიდურესად ცუდი';
	@override String get aqi_unhealthy_sensitive => 'მგრძნებიარეებისთვის უსაფრთხო არაა';
	@override String get aqi_unhealthy => 'აუჯანსაღებელი';
	@override String get aqi_very_unhealthy => 'ძალიან აუჯანსაღებელი';
	@override String get aqi_hazardous => 'საშიში';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'ევროპული';
	@override String get american => 'ამერიკული';
	@override String get aqi_advice_good => 'კარგი ჰაერი გარე აქტივობებისთვის.';
	@override String get aqi_advice_fair => 'საერთოდ კარგია. მგრძნობიარე ადამიანებმა შეიძლება შეზღუდონ ხანგრძლივი გარე დატვირთვა.';
	@override String get aqi_advice_moderate => 'მგრძნობიარე ჯგუფებმა უნდა შეამცირონ გარეთ გატარებული დრო.';
	@override String get aqi_advice_poor => 'შეზღუდეთ გარე აქტივობა, განსაკუთრებით თუ მგრძნობიარე ხართ დაბინძურებისადმი.';
	@override String get aqi_advice_very_poor => 'თავიდან აიცილეთ ხანგრძლივი გარე დატვირთვა. ყველას შეიძლება ჯანმრთელობაზე გავლენა მოახდინოს.';
	@override String get aqi_advice_extremely_poor => 'თუ შესაძლებელია, დარჩით შიგნით. გარე აქტივობა არ არის რეკომენდებული.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'დაბინძურებები';
}

/// The flat map containing all translations for locale <ka-GE>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKaGe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ინტერნეტი არ არის',
			'edit_city_hint' => 'ქალაქის ინფორმაციის რედაქტირება',
			'location_not_found' => 'თქვენი მდებარეობის დადგენა ვერ მოხერხდა',
			'mi' => 'მილი',
			'next' => 'შემდეგ',
			'discard' => 'გაუქმება',
			'east' => 'აღმოსავლეთი',
			'time_end' => 'დასრულების დრო',
			'search_method' => 'გამოიყენეთ ძებნა ან გეოლოკაცია',
			'hourly_variables' => 'საათობრივი ამინდის ცვლადები',
			'uv_index' => 'UV-ინდექსი',
			'clear_sky' => 'წმინდა ცა',
			'k_24' => '24-საათი',
			'no_weather_card' => 'დაამატეთ ქალაქი',
			'drizzle' => 'წვიმა',
			'humidity' => 'ტენიანობა',
			'telegram' => 'Telegram',
			'functions' => 'ფუნქციები',
			'cities' => 'ქალაქები',
			'southeast' => 'სამხრეთ-აღმოსავლეთი',
			'validate_number' => 'გთხოვთ შეიყვანოთ ნომერი',
			'city' => 'ქალაქი',
			'uv_high' => 'მაღალი',
			'time' => 'დრო ქალაქში',
			'uv_low' => 'დაბალი',
			'name3' => 'შეგვეხმიანე',
			'apparent_temperature_min' => 'მინიმალური აშკარა ტემპერატურა',
			'direction' => 'მიმართულება',
			'heavy_rains' => 'ძლიერი წვიმები',
			'apparent_temperature_max' => 'მაქსიმალური აშკარა ტემპერატურა',
			'k_12' => '12-საათი',
			'discord' => 'Discord',
			'discard_changes' => 'ნამდვილად გსურთ ცვლილებების გაუქმება?',
			'notifications' => 'შეტყობინებები',
			'mph' => 'მილი/სთ',
			'west' => 'დასავლეთი',
			'validate90' => 'მნიშვნელობა უნდა იყოს -90-დან 90-მდე',
			'name2' => 'მართვის კომფორტი',
			'feels' => 'გრძნობს',
			'precipitation_probability' => 'ნალექების ალბათობა',
			'license' => 'ლიცენზიები',
			'widget_background' => 'ვიჯეტის ფონი',
			'large_element' => 'გადიდი ამინდის გამოჩენა',
			'unsaved_changes' => 'შეუნახავი ცვლილებები',
			'drizzling_rain' => 'დრიზლინგი წვიმა',
			'cloudy' => 'მოღრუბლული',
			'widget' => 'ვიჯეტი',
			'precipitation' => 'ნალექი',
			'delete' => 'ამოღება',
			'deleted_cache_store' => 'ქეშის გასუფთავება მიმდინარეობს',
			'map' => 'რუკა',
			'description3' => 'თუ გექნებათ ნებისმიერი პრობლემა, გთხოვთ, დაგვეკონტაქტოთ ელ-ფოსტით ან აპლიკაციის მიმოხილვის გვერდზე.',
			'north' => 'ჩრდილოეთი',
			'measurements' => 'საზომი სისტემა',
			'start' => 'დაიწყე',
			'settings_full' => 'პარამეტრები',
			'high' => 'მაღალი',
			'daily_variables' => 'ყოველდღიური ამინდის ცვლადები',
			'low' => 'დაბალი',
			'on_inter' => 'ჩართეთ ინტერნეტი მეტეოროლოგიური მონაცემების მისაღებად.',
			'thunderstorm' => 'ჭექა-ქუხილი',
			'version' => 'განაცხადის ვერსია',
			'project' => 'პროექტი ჩართულია',
			'amoled_theme' => 'AMOLED-თემა',
			'deleted_card_weather_query' => 'დარწმუნებული ხართ, რომ გსურთ ქალაქის წაშლა?',
			'northeast' => 'ჩრდილო-აღმოსავლეთი',
			'add_widget' => 'ვიდჯეტის დამატება',
			'fog' => 'ნისლი',
			'description2' => 'ყველა ნავიგაცია შექმნილია ისე, რომ შეგიძლიათ მაქსიმალურად კომფორტულად და სწრაფად იქონოთ აპლიკაციით.',
			'mm' => 'მმ',
			'no_desc_data' => 'მონაცემები არ არის',
			'search_city' => 'იპოვეთ თქვენი ქალაქი',
			'weather_more' => '12-დღიანი ამინდის პროგნოზი',
			'round_degree' => 'ხარისხი მიჯნურობა',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'მოძებნეთ ან შეიყვანეთ ქალაქის მონაცემები ხელით',
			'validate_name' => 'გთხოვთ შეიყვანოთ სახელი',
			'sunrise' => 'მზის ამოსვლა',
			'km' => 'კმ',
			'district' => 'რაიონი',
			'southwest' => 'სამხრეთ-დასავლეთი',
			'degrees' => 'გრადუსი',
			'clear_cache_store' => 'ქეშის გასუფთავება',
			'skip' => 'გამოტოვება',
			'h_pa' => 'ჰპა',
			'appearance' => 'გარეგნობა',
			'time_start' => 'დაწყების დრო',
			'ready' => 'მზადაა',
			'kph' => 'კმ/სთ',
			'deleted_cache_store_query' => 'დარწმუნებული ხართ, რომ გსურთ ქეშის გასუფთავება?',
			'widget_text' => 'ვიჯეტის ტექსტი',
			'support' => 'მხარდაჭერა',
			'groups' => 'ჩვენი ჯგუფები',
			'system' => 'სისტემა',
			'sunset' => 'მზის ჩასვლა',
			'dewpoint' => 'დევპოინტი',
			'shortwave_radiation' => 'მოკლე ტალღის გამოსხივება',
			'language' => 'ენა',
			'hide_map' => 'რუკის დამალვა',
			'cancel' => 'გაუქმება',
			'loading' => 'დატვირთვა...',
			'timeformat' => 'დროის ფორმატი',
			'lat' => 'სიგანე',
			'data' => 'მონაცემები',
			'visibility' => 'ხილვადობა',
			'deleted_card_weather' => 'ქალაქის წაშლა',
			'celsius' => 'ცელსიუსი',
			'no_location' => 'ჩართეთ მდებარეობის სერვისი, რომ მიიღოთ ამინდის მონაცემები მიმდინარე ადგილმდებარეობისთვის.',
			'create' => 'შექმნა',
			'edit' => 'რედაქტირება',
			'search' => 'ძიება...',
			'uv_extreme' => 'ძლევა ზედა',
			'light' => 'სინათლე',
			'cloudcover' => 'ღრუბლის საფარი',
			'uv_very_high' => 'ძალიან მაღალი',
			'snow' => 'თოვლი',
			'done' => 'დასრულებულია',
			'theme' => 'თემა',
			'name' => 'ამინდი',
			'time_range' => 'სიხშირე (საათებში)',
			'about_app' => 'აპლიკაციის შესახებ',
			'save' => 'შენახვა',
			'evaporation' => 'აორთქლება',
			'freezing_rain' => 'გაყინვის წვიმა',
			'uv_average' => 'ზომიერი',
			'reset_color' => 'ნაგულისხმევზე დაბრუნება',
			'metric' => 'მეტრული',
			'overcast' => 'მოსაწყენი',
			'pressure' => 'წნევა',
			'inch' => 'ინჩი',
			'imperial' => 'იმპერიული',
			'location' => 'ადგილმდებარეობა',
			'error_occurred' => 'მომხდარია შეცდომა',
			'validate_value' => 'გთხოვთ შეიყვანოთ მნიშვნელობა',
			'lon' => 'გრძედი',
			'wind' => 'ქარი',
			'normal' => 'ნორმალური',
			'dark' => 'ბნელი',
			'settings' => 'პარამ.',
			'south' => 'სამხრეთი',
			'windgusts' => 'ნაკადი',
			'northwest' => 'ჩრდილო-დასავლეთი',
			'open_meteo' => 'მონაცემები Open-Meteo-დან (CC-BY 4.0)',
			'rain' => 'წვიმა',
			'mm_hg' => 'მმHg',
			'validate180' => 'მნიშვნელობა უნდა იყოს -180-დან 180-მდე',
			'description' => 'აპლიკაცია ამჟამად პროგნოზით ყოველ საათზე, დღეზე და კვირაზე ნებისმიერ ადგილისთვის.',
			'fahrenheit' => 'ფარენჰაიტი',
			'm_s' => 'მ/წმ',
			'material_color' => 'დინამიური ფერები',
			'confirm' => 'შენახვა',
			'no_results' => 'შედეგები ვერ მოიძებნა',
			'cities_load_error' => 'ქალაქების ჩატვირთვა ვერ მოხერხდა',
			'retry' => 'თავიდან',
			'city_not_found' => 'ქალაქი ვერ მოიძებნა',
			'air_quality' => 'ჰაერის ხარისხი',
			'aqi_standard' => 'AQI სტანდარტი',
			'aqi_european' => 'ევროპული AQI',
			'aqi_american' => 'ამერიკული AQI',
			'aqi_good' => 'კარგი',
			'aqi_fair' => 'საშუალო',
			'aqi_moderate' => 'საშუალო',
			'aqi_poor' => 'ცუდი',
			'aqi_very_poor' => 'ძალიან ცუდი',
			'aqi_extremely_poor' => 'უკიდურესად ცუდი',
			'aqi_unhealthy_sensitive' => 'მგრძნებიარეებისთვის უსაფრთხო არაა',
			'aqi_unhealthy' => 'აუჯანსაღებელი',
			'aqi_very_unhealthy' => 'ძალიან აუჯანსაღებელი',
			'aqi_hazardous' => 'საშიში',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'ევროპული',
			'american' => 'ამერიკული',
			'aqi_advice_good' => 'კარგი ჰაერი გარე აქტივობებისთვის.',
			'aqi_advice_fair' => 'საერთოდ კარგია. მგრძნობიარე ადამიანებმა შეიძლება შეზღუდონ ხანგრძლივი გარე დატვირთვა.',
			'aqi_advice_moderate' => 'მგრძნობიარე ჯგუფებმა უნდა შეამცირონ გარეთ გატარებული დრო.',
			'aqi_advice_poor' => 'შეზღუდეთ გარე აქტივობა, განსაკუთრებით თუ მგრძნობიარე ხართ დაბინძურებისადმი.',
			'aqi_advice_very_poor' => 'თავიდან აიცილეთ ხანგრძლივი გარე დატვირთვა. ყველას შეიძლება ჯანმრთელობაზე გავლენა მოახდინოს.',
			'aqi_advice_extremely_poor' => 'თუ შესაძლებელია, დარჩით შიგნით. გარე აქტივობა არ არის რეკომენდებული.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'დაბინძურებები',
			_ => null,
		};
	}
}
