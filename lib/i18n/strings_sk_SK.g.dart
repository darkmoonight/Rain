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
class TranslationsSkSk extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSkSk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.skSk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sk-SK>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsSkSk _root = this; // ignore: unused_field

	@override 
	TranslationsSkSk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSkSk(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Žiadny internet';
	@override String get edit_city_hint => 'Upraviť informácie o meste';
	@override String get location_not_found => 'Nepodarilo sa určiť vašu polohu';
	@override String get mi => 'mi';
	@override String get next => 'Ďalej';
	@override String get discard => 'Zrušiť';
	@override String get east => 'Východ';
	@override String get time_end => 'Čas ukončenia';
	@override String get search_method => 'Použite vyhľadávanie alebo geolokáciu';
	@override String get hourly_variables => 'Hodinové meteorologické premenné';
	@override String get uv_index => 'UV-index';
	@override String get clear_sky => 'Jasno';
	@override String get k_24 => '24-hodinový';
	@override String get no_weather_card => 'Pridať mesto';
	@override String get drizzle => 'Mrholenie';
	@override String get humidity => 'Vlhkosť';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funkcie';
	@override String get cities => 'Mestá';
	@override String get southeast => 'Juhovýchod';
	@override String get validate_number => 'Zadajte platné číslo';
	@override String get city => 'Miesto';
	@override String get uv_high => 'Vysoký';
	@override String get time => 'Čas v meste';
	@override String get uv_low => 'Nízky';
	@override String get name3 => 'Kontaktujte nás';
	@override String get apparent_temperature_min => 'Minimálna pocitová teplota';
	@override String get direction => 'Smer';
	@override String get heavy_rains => 'Prehánky';
	@override String get apparent_temperature_max => 'Maximálna pocitová teplota';
	@override String get k_12 => '12-hodinový';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Naozaj chcete zrušiť svoje zmeny?';
	@override String get notifications => 'Notifikácie';
	@override String get mph => 'mph';
	@override String get west => 'Západ';
	@override String get validate90 => 'Hodnota musí byť medzi -90 a 90';
	@override String get name2 => 'Pohodlný dizajn';
	@override String get feels => 'Pocitová teplota';
	@override String get precipitation_probability => 'Pravdepodobnosť zrážok';
	@override String get license => 'Licencie';
	@override String get widget_background => 'Pozadie widgetu';
	@override String get large_element => 'Veľké zobrazenie počasia';
	@override String get unsaved_changes => 'Neuložené zmeny';
	@override String get drizzling_rain => 'Mrznúce mrholenie';
	@override String get cloudy => 'Oblačno';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Zrážky';
	@override String get delete => 'Odstrániť';
	@override String get deleted_cache_store => 'Vymazávanie vyrovnávacej pamäte';
	@override String get map => 'Mapa';
	@override String get description3 => 'Ak sa vyskytnú nejaké problémy, kontaktujte nás prosím e-mailom alebo v recenziách aplikácie.';
	@override String get north => 'Sever';
	@override String get measurements => 'Jednotky merania';
	@override String get start => 'Začať';
	@override String get settings_full => 'Nastavenia';
	@override String get high => 'Vysoký';
	@override String get daily_variables => 'Denné meteorologické premenné';
	@override String get low => 'Nízky';
	@override String get on_inter => 'Pripojte sa na internet a získajte meteorologické údaje.';
	@override String get thunderstorm => 'Búrka';
	@override String get version => 'Verzia aplikácie';
	@override String get project => 'Projekt na';
	@override String get amoled_theme => 'AMOLED-téma';
	@override String get deleted_card_weather_query => 'Naozaj chcete odstrániť mesto?';
	@override String get northeast => 'Severo-Východ';
	@override String get add_widget => 'Pridať widget';
	@override String get fog => 'Hmla';
	@override String get description2 => 'Celá navigácia je navrhnutá tak, aby sa s aplikáciou dalo interagovať čo najpohodlnejšie a najrýchlejšie.';
	@override String get mm => 'mm';
	@override String get search_city => 'Nájdite svoje miesto';
	@override String get weather_more => 'Predpoveď počasia na 12 dní';
	@override String get round_degree => 'Zaokrúhliť stupne';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Vyhľadajte alebo zadajte údaje o meste ručne';
	@override String get validate_name => 'Prosím zadajte názov';
	@override String get sunrise => 'Východ slnka';
	@override String get km => 'km';
	@override String get district => 'Okres';
	@override String get southwest => 'Juhozápad';
	@override String get degrees => 'Stupňe';
	@override String get clear_cache_store => 'Vymazať vyrovnávaciu pamäť';
	@override String get skip => 'Preskočiť';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Vzhľad';
	@override String get time_start => 'Čas začiatku';
	@override String get ready => 'Pripravené';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Ste si istí, že chcete vymazať vyrovnávaciu pamäť?';
	@override String get widget_text => 'Text widgetu';
	@override String get support => 'Podpora';
	@override String get groups => 'Naše skupiny';
	@override String get system => 'Systém';
	@override String get sunset => 'Západ slnka';
	@override String get dewpoint => 'Rosný bod';
	@override String get shortwave_radiation => 'Krátka vlnová radiácia';
	@override String get language => 'Jazyk';
	@override String get hide_map => 'Skryť mapu';
	@override String get cancel => 'Zrušiť';
	@override String get loading => 'Načítava sa...';
	@override String get timeformat => 'Formát času';
	@override String get lat => 'Zemepisná šírka';
	@override String get data => 'Dáta';
	@override String get visibility => 'Viditeľnosť';
	@override String get deleted_card_weather => 'Vymazať mesto';
	@override String get celsius => 'Celzius';
	@override String get no_location => 'Ak chcete získať údaje o počasí pre aktuálnu polohu, povoľte službu určovania polohy.';
	@override String get create => 'Vytvoriť';
	@override String get edit => 'Upraviť';
	@override String get search => 'Hľadať...';
	@override String get uv_extreme => 'Extrémny';
	@override String get light => 'Svetlá';
	@override String get cloudcover => 'Oblačnosť';
	@override String get uv_very_high => 'Veľmi vysoký';
	@override String get snow => 'Sneh';
	@override String get done => 'Hotovo';
	@override String get theme => 'Téma';
	@override String get name => 'Počasie';
	@override String get time_range => 'Frekvencia (v hodinách)';
	@override String get about_app => 'O aplikácii';
	@override String get save => 'Uložiť';
	@override String get evaporation => 'Evapotranspirácia';
	@override String get freezing_rain => 'Mrazivý dážď';
	@override String get uv_average => 'Mierny';
	@override String get reset_color => 'Obnoviť predvolené';
	@override String get metric => 'Metrické';
	@override String get overcast => 'Zamračené';
	@override String get pressure => 'Tlak';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperiálne';
	@override String get location => 'Poloha';
	@override String get error_occurred => 'Vyskytla sa chyba';
	@override String get validate_value => 'Zadajte hodnotu';
	@override String get lon => 'Zemepisná dĺžka';
	@override String get wind => 'Vietor';
	@override String get normal => 'Normálny';
	@override String get dark => 'Tmavá';
	@override String get settings => 'Nast.';
	@override String get south => 'Juž';
	@override String get windgusts => 'Nárazy vetra';
	@override String get northwest => 'Severo-Západ';
	@override String get open_meteo => 'Údaje od Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Dážď';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Hodnota musí byť medzi -180 a 180';
	@override String get description => 'Aplikácia počasia s aktuálnym predpoveďou pre každú hodinu, deň a týždeň pre akékoľvek miesto.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dynamické Farby';
	@override String get confirm => 'Uložiť';
	@override String get no_results => 'Žiadne výsledky';
	@override String get cities_load_error => 'Nepodarilo sa načítať mestá';
	@override String get retry => 'Skúsiť znova';
	@override String get city_not_found => 'Mesto nenájdené';
	@override String get air_quality => 'Kvalita ovzdušia';
	@override String get aqi_standard => 'Štandard AQI';
	@override String get aqi_european => 'Európsky AQI';
	@override String get aqi_american => 'Americký AQI';
	@override String get aqi_good => 'Dobrá';
	@override String get aqi_fair => 'Vyhovujúca';
	@override String get aqi_moderate => 'Stredná';
	@override String get aqi_poor => 'Zlá';
	@override String get aqi_very_poor => 'Veľmi zlá';
	@override String get aqi_extremely_poor => 'Extrémne zlá';
	@override String get aqi_unhealthy_sensitive => 'Nezdravá pre citlivých';
	@override String get aqi_unhealthy => 'Nezdravá';
	@override String get aqi_very_unhealthy => 'Veľmi nezdravá';
	@override String get aqi_hazardous => 'Nebezpečná';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Európsky';
	@override String get american => 'Americký';
	@override String get aqi_advice_good => 'Dobrý vzduch na vonkajšie aktivity.';
	@override String get aqi_advice_fair => 'Celkovo v poriadku. Citliví ľudia môžu obmedziť dlhé vonkajšie namáhanie.';
	@override String get aqi_advice_moderate => 'Citlivé skupiny by mali skrátiť čas vonku.';
	@override String get aqi_advice_poor => 'Obmedzte vonkajšiu aktivitu, najmä ak ste citliví na znečistenie.';
	@override String get aqi_advice_very_poor => 'Vyhnite sa dlhému vonkajšiemu namáhaniu. Možné zdravotné účinky pre všetkých.';
	@override String get aqi_advice_extremely_poor => 'Zostaňte doma, ak je to možné. Vonkajšia aktivita sa neodporúča.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Znečisťujúce látky';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'Aktualizované';
	@override String get app_font => 'Písmo';
	@override String get font_ubuntu => 'Ubuntu (app)';
	@override String get font_system => 'System';
	@override String get font_inter => 'Inter';
	@override String get font_open_sans => 'Open Sans';
	@override String get font_roboto => 'Roboto';
	@override String get font_barlow_condensed => 'Barlow Condensed';
	@override String get metric_help_apparent_temperature_min => 'Lowest perceived temperature for the day, combining wind chill, humidity, and solar radiation.';
	@override String get metric_help_apparent_temperature_max => 'Highest perceived temperature for the day, combining wind chill, humidity, and solar radiation.';
	@override String get metric_help_uv_index => 'Ultraviolet radiation strength. Higher values mean faster sunburn and greater eye damage risk.';
	@override String get metric_help_direction => 'Compass direction the wind blows from (meteorological convention).';
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

/// The flat map containing all translations for locale <sk-SK>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsSkSk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Žiadny internet',
			'edit_city_hint' => 'Upraviť informácie o meste',
			'location_not_found' => 'Nepodarilo sa určiť vašu polohu',
			'mi' => 'mi',
			'next' => 'Ďalej',
			'discard' => 'Zrušiť',
			'east' => 'Východ',
			'time_end' => 'Čas ukončenia',
			'search_method' => 'Použite vyhľadávanie alebo geolokáciu',
			'hourly_variables' => 'Hodinové meteorologické premenné',
			'uv_index' => 'UV-index',
			'clear_sky' => 'Jasno',
			'k_24' => '24-hodinový',
			'no_weather_card' => 'Pridať mesto',
			'drizzle' => 'Mrholenie',
			'humidity' => 'Vlhkosť',
			'telegram' => 'Telegram',
			'functions' => 'Funkcie',
			'cities' => 'Mestá',
			'southeast' => 'Juhovýchod',
			'validate_number' => 'Zadajte platné číslo',
			'city' => 'Miesto',
			'uv_high' => 'Vysoký',
			'time' => 'Čas v meste',
			'uv_low' => 'Nízky',
			'name3' => 'Kontaktujte nás',
			'apparent_temperature_min' => 'Minimálna pocitová teplota',
			'direction' => 'Smer',
			'heavy_rains' => 'Prehánky',
			'apparent_temperature_max' => 'Maximálna pocitová teplota',
			'k_12' => '12-hodinový',
			'discord' => 'Discord',
			'discard_changes' => 'Naozaj chcete zrušiť svoje zmeny?',
			'notifications' => 'Notifikácie',
			'mph' => 'mph',
			'west' => 'Západ',
			'validate90' => 'Hodnota musí byť medzi -90 a 90',
			'name2' => 'Pohodlný dizajn',
			'feels' => 'Pocitová teplota',
			'precipitation_probability' => 'Pravdepodobnosť zrážok',
			'license' => 'Licencie',
			'widget_background' => 'Pozadie widgetu',
			'large_element' => 'Veľké zobrazenie počasia',
			'unsaved_changes' => 'Neuložené zmeny',
			'drizzling_rain' => 'Mrznúce mrholenie',
			'cloudy' => 'Oblačno',
			'widget' => 'Widget',
			'precipitation' => 'Zrážky',
			'delete' => 'Odstrániť',
			'deleted_cache_store' => 'Vymazávanie vyrovnávacej pamäte',
			'map' => 'Mapa',
			'description3' => 'Ak sa vyskytnú nejaké problémy, kontaktujte nás prosím e-mailom alebo v recenziách aplikácie.',
			'north' => 'Sever',
			'measurements' => 'Jednotky merania',
			'start' => 'Začať',
			'settings_full' => 'Nastavenia',
			'high' => 'Vysoký',
			'daily_variables' => 'Denné meteorologické premenné',
			'low' => 'Nízky',
			'on_inter' => 'Pripojte sa na internet a získajte meteorologické údaje.',
			'thunderstorm' => 'Búrka',
			'version' => 'Verzia aplikácie',
			'project' => 'Projekt na',
			'amoled_theme' => 'AMOLED-téma',
			'deleted_card_weather_query' => 'Naozaj chcete odstrániť mesto?',
			'northeast' => 'Severo-Východ',
			'add_widget' => 'Pridať widget',
			'fog' => 'Hmla',
			'description2' => 'Celá navigácia je navrhnutá tak, aby sa s aplikáciou dalo interagovať čo najpohodlnejšie a najrýchlejšie.',
			'mm' => 'mm',
			'search_city' => 'Nájdite svoje miesto',
			'weather_more' => 'Predpoveď počasia na 12 dní',
			'round_degree' => 'Zaokrúhliť stupne',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Vyhľadajte alebo zadajte údaje o meste ručne',
			'validate_name' => 'Prosím zadajte názov',
			'sunrise' => 'Východ slnka',
			'km' => 'km',
			'district' => 'Okres',
			'southwest' => 'Juhozápad',
			'degrees' => 'Stupňe',
			'clear_cache_store' => 'Vymazať vyrovnávaciu pamäť',
			'skip' => 'Preskočiť',
			'h_pa' => 'hPa',
			'appearance' => 'Vzhľad',
			'time_start' => 'Čas začiatku',
			'ready' => 'Pripravené',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Ste si istí, že chcete vymazať vyrovnávaciu pamäť?',
			'widget_text' => 'Text widgetu',
			'support' => 'Podpora',
			'groups' => 'Naše skupiny',
			'system' => 'Systém',
			'sunset' => 'Západ slnka',
			'dewpoint' => 'Rosný bod',
			'shortwave_radiation' => 'Krátka vlnová radiácia',
			'language' => 'Jazyk',
			'hide_map' => 'Skryť mapu',
			'cancel' => 'Zrušiť',
			'loading' => 'Načítava sa...',
			'timeformat' => 'Formát času',
			'lat' => 'Zemepisná šírka',
			'data' => 'Dáta',
			'visibility' => 'Viditeľnosť',
			'deleted_card_weather' => 'Vymazať mesto',
			'celsius' => 'Celzius',
			'no_location' => 'Ak chcete získať údaje o počasí pre aktuálnu polohu, povoľte službu určovania polohy.',
			'create' => 'Vytvoriť',
			'edit' => 'Upraviť',
			'search' => 'Hľadať...',
			'uv_extreme' => 'Extrémny',
			'light' => 'Svetlá',
			'cloudcover' => 'Oblačnosť',
			'uv_very_high' => 'Veľmi vysoký',
			'snow' => 'Sneh',
			'done' => 'Hotovo',
			'theme' => 'Téma',
			'name' => 'Počasie',
			'time_range' => 'Frekvencia (v hodinách)',
			'about_app' => 'O aplikácii',
			'save' => 'Uložiť',
			'evaporation' => 'Evapotranspirácia',
			'freezing_rain' => 'Mrazivý dážď',
			'uv_average' => 'Mierny',
			'reset_color' => 'Obnoviť predvolené',
			'metric' => 'Metrické',
			'overcast' => 'Zamračené',
			'pressure' => 'Tlak',
			'inch' => 'inch',
			'imperial' => 'Imperiálne',
			'location' => 'Poloha',
			'error_occurred' => 'Vyskytla sa chyba',
			'validate_value' => 'Zadajte hodnotu',
			'lon' => 'Zemepisná dĺžka',
			'wind' => 'Vietor',
			'normal' => 'Normálny',
			'dark' => 'Tmavá',
			'settings' => 'Nast.',
			'south' => 'Juž',
			'windgusts' => 'Nárazy vetra',
			'northwest' => 'Severo-Západ',
			'open_meteo' => 'Údaje od Open-Meteo (CC-BY 4.0)',
			'rain' => 'Dážď',
			'mm_hg' => 'mmHg',
			'validate180' => 'Hodnota musí byť medzi -180 a 180',
			'description' => 'Aplikácia počasia s aktuálnym predpoveďou pre každú hodinu, deň a týždeň pre akékoľvek miesto.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dynamické Farby',
			'confirm' => 'Uložiť',
			'no_results' => 'Žiadne výsledky',
			'cities_load_error' => 'Nepodarilo sa načítať mestá',
			'retry' => 'Skúsiť znova',
			'city_not_found' => 'Mesto nenájdené',
			'air_quality' => 'Kvalita ovzdušia',
			'aqi_standard' => 'Štandard AQI',
			'aqi_european' => 'Európsky AQI',
			'aqi_american' => 'Americký AQI',
			'aqi_good' => 'Dobrá',
			'aqi_fair' => 'Vyhovujúca',
			'aqi_moderate' => 'Stredná',
			'aqi_poor' => 'Zlá',
			'aqi_very_poor' => 'Veľmi zlá',
			'aqi_extremely_poor' => 'Extrémne zlá',
			'aqi_unhealthy_sensitive' => 'Nezdravá pre citlivých',
			'aqi_unhealthy' => 'Nezdravá',
			'aqi_very_unhealthy' => 'Veľmi nezdravá',
			'aqi_hazardous' => 'Nebezpečná',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Európsky',
			'american' => 'Americký',
			'aqi_advice_good' => 'Dobrý vzduch na vonkajšie aktivity.',
			'aqi_advice_fair' => 'Celkovo v poriadku. Citliví ľudia môžu obmedziť dlhé vonkajšie namáhanie.',
			'aqi_advice_moderate' => 'Citlivé skupiny by mali skrátiť čas vonku.',
			'aqi_advice_poor' => 'Obmedzte vonkajšiu aktivitu, najmä ak ste citliví na znečistenie.',
			'aqi_advice_very_poor' => 'Vyhnite sa dlhému vonkajšiemu namáhaniu. Možné zdravotné účinky pre všetkých.',
			'aqi_advice_extremely_poor' => 'Zostaňte doma, ak je to možné. Vonkajšia aktivita sa neodporúča.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Znečisťujúce látky',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'Aktualizované',
			'app_font' => 'Písmo',
			'font_ubuntu' => 'Ubuntu (app)',
			'font_system' => 'System',
			'font_inter' => 'Inter',
			'font_open_sans' => 'Open Sans',
			'font_roboto' => 'Roboto',
			'font_barlow_condensed' => 'Barlow Condensed',
			'metric_help_apparent_temperature_min' => 'Lowest perceived temperature for the day, combining wind chill, humidity, and solar radiation.',
			'metric_help_apparent_temperature_max' => 'Highest perceived temperature for the day, combining wind chill, humidity, and solar radiation.',
			'metric_help_uv_index' => 'Ultraviolet radiation strength. Higher values mean faster sunburn and greater eye damage risk.',
			'metric_help_direction' => 'Compass direction the wind blows from (meteorological convention).',
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
