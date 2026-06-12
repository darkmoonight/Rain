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
class TranslationsHuHu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHuHu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.huHu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hu-HU>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHuHu _root = this; // ignore: unused_field

	@override 
	TranslationsHuHu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHuHu(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Nincs internet';
	@override String get edit_city_hint => 'Városi információk szerkesztése';
	@override String get location_not_found => 'Nem sikerült meghatározni a tartózkodási helyét';
	@override String get mi => 'mérföld';
	@override String get next => 'Tovább';
	@override String get discard => 'Elvetés';
	@override String get east => 'Kelet';
	@override String get time_end => 'Befejezési idő';
	@override String get search_method => 'Használja a keresést vagy a földrajzi helyet';
	@override String get hourly_variables => 'Óránkénti időjárási változók';
	@override String get uv_index => 'UV-index';
	@override String get clear_sky => 'Tiszta ég';
	@override String get k_24 => '24 órás';
	@override String get no_weather_card => 'Adjon hozzá egy várost';
	@override String get drizzle => 'Szitálás';
	@override String get humidity => 'Páratartalom';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funkciók';
	@override String get cities => 'Városok';
	@override String get southeast => 'Délkelet';
	@override String get validate_number => 'Kérjük, adjon meg érvényes számot';
	@override String get city => 'Város';
	@override String get uv_high => 'Magas';
	@override String get time => 'Idő a városban';
	@override String get uv_low => 'Alacsony';
	@override String get name3 => 'Kapcsolatfelvétel velünk';
	@override String get apparent_temperature_min => 'Minimális látszólagos hőmérséklet';
	@override String get direction => 'Irány';
	@override String get heavy_rains => 'Zivataros záporok';
	@override String get apparent_temperature_max => 'Maximális látszólagos hőmérséklet';
	@override String get k_12 => '12 órás';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Biztosan el akarja vetni a módosításait?';
	@override String get notifications => 'Értesítések';
	@override String get mph => 'mph';
	@override String get west => 'Nyugat';
	@override String get validate90 => 'Az érték -90 és 90 közötti kell legyen';
	@override String get name2 => 'Kényelmes tervezés';
	@override String get feels => 'Hőérzet';
	@override String get precipitation_probability => 'Csapadék valószínűsége';
	@override String get license => 'Licenc';
	@override String get widget_background => 'Widget háttér';
	@override String get large_element => 'Nagy méretű időjárás megjelenítése';
	@override String get unsaved_changes => 'Nem mentett módosítások';
	@override String get drizzling_rain => 'Fagyos szitálás';
	@override String get cloudy => 'Felhős';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Csapadék';
	@override String get delete => 'Törlés';
	@override String get deleted_cache_store => 'Gyorsítótár törlése folyamatban';
	@override String get map => 'Térkép';
	@override String get description3 => 'Ha bármilyen problémája adódik, kérjük, lépjen kapcsolatba velünk e-mailben vagy az alkalmazás értékeléseiben.';
	@override String get north => 'Észak';
	@override String get measurements => 'Mérési rendszer';
	@override String get start => 'Kezdés';
	@override String get settings_full => 'Beállítások';
	@override String get high => 'Magas';
	@override String get daily_variables => 'Napi időjárási változók';
	@override String get low => 'Alacsony';
	@override String get on_inter => 'Kapcsolja be az internetet az időjárási adatok lekéréséhez.';
	@override String get thunderstorm => 'Zivatar';
	@override String get version => 'Alkalmazás verzió';
	@override String get project => 'Projekt';
	@override String get amoled_theme => 'AMOLED téma';
	@override String get deleted_card_weather_query => 'Biztosan törölni szeretné a várost?';
	@override String get northeast => 'Északkelet';
	@override String get add_widget => 'Widget hozzáadása';
	@override String get fog => 'Köd';
	@override String get description2 => 'Az összes navigáció úgy van kialakítva, hogy maximálisan kényelmes és gyors legyen az alkalmazással való interakció.';
	@override String get mm => 'mm';
	@override String get search_city => 'Keresse meg a városát';
	@override String get weather_more => '12 napos időjárás előrejelzés';
	@override String get round_degree => 'Fokok Kerekítése';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Keresse meg vagy adja meg manuálisan a város adatait';
	@override String get validate_name => 'Kérjük, adja meg a nevet';
	@override String get sunrise => 'Napkelte';
	@override String get km => 'km';
	@override String get district => 'Kerület';
	@override String get southwest => 'Délkelet';
	@override String get degrees => 'Fok';
	@override String get clear_cache_store => 'Gyorsítótár törlése';
	@override String get skip => 'Kihagyás';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Megjelenés';
	@override String get time_start => 'Kezdési idő';
	@override String get ready => 'Kész';
	@override String get kph => 'km/óra';
	@override String get deleted_cache_store_query => 'Biztosan törölni szeretné a gyorsítótárat?';
	@override String get widget_text => 'Widget szöveg';
	@override String get support => 'Támogatás';
	@override String get groups => 'Csoportjaink';
	@override String get system => 'Rendszer';
	@override String get sunset => 'Napnyugta';
	@override String get dewpoint => 'Harmatpont';
	@override String get shortwave_radiation => 'Rövidhullámú sugárzás';
	@override String get language => 'Nyelv';
	@override String get hide_map => 'Térkép elrejtése';
	@override String get cancel => 'Mégse';
	@override String get loading => 'Betöltés...';
	@override String get timeformat => 'Időformátum';
	@override String get lat => 'Szélesség';
	@override String get data => 'Adatok';
	@override String get visibility => 'Láthatóság';
	@override String get deleted_card_weather => 'Város törlése';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Engedélyezze a helyszolgáltatást az aktuális hely időjárásadatainak megszerzéséhez.';
	@override String get create => 'Létrehozás';
	@override String get edit => 'Szerkesztés';
	@override String get search => 'Keresés...';
	@override String get uv_extreme => 'Extrém';
	@override String get light => 'Világos';
	@override String get cloudcover => 'Felhőzet';
	@override String get uv_very_high => 'Nagyon magas';
	@override String get snow => 'Hó';
	@override String get done => 'Kész';
	@override String get theme => 'Téma';
	@override String get name => 'Időjárás';
	@override String get time_range => 'Gyakoriság (órákban)';
	@override String get about_app => 'Az alkalmazásról';
	@override String get save => 'Mentés';
	@override String get evaporation => 'Párolgás';
	@override String get freezing_rain => 'Fagyos eső';
	@override String get uv_average => 'Mérsékelt';
	@override String get reset_color => 'Alapértelmezett visszaállítása';
	@override String get metric => 'Metrikus mértékegység';
	@override String get overcast => 'Borult';
	@override String get pressure => 'Nyomás';
	@override String get inch => 'hüvelyk';
	@override String get imperial => 'Angol mértékegység';
	@override String get location => 'Hely';
	@override String get error_occurred => 'Hiba történt';
	@override String get validate_value => 'Kérjük, adjon meg egy értéket';
	@override String get lon => 'Hosszúság';
	@override String get wind => 'Szél';
	@override String get normal => 'Normál';
	@override String get dark => 'Sötét';
	@override String get settings => 'Beállítások';
	@override String get south => 'Dél';
	@override String get windgusts => 'Szélrohamok';
	@override String get northwest => 'Északnyugat';
	@override String get open_meteo => 'Adatok az Open-Meteo-tól (CC-BY 4.0)';
	@override String get rain => 'Eső';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Az érték -180 és 180 közötti kell legyen';
	@override String get description => 'Időjárás alkalmazás a friss óránkénti, napi és heti előrejelzéssel bármely helyszínre.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dinamikus színek';
	@override String get confirm => 'Mentés';
	@override String get no_results => 'Nincs találat';
	@override String get cities_load_error => 'A városok betöltése sikertelen';
	@override String get retry => 'Újra';
	@override String get city_not_found => 'A város nem található';
	@override String get air_quality => 'Levegőminőség';
	@override String get aqi_standard => 'AQI szabvány';
	@override String get aqi_european => 'Európai AQI';
	@override String get aqi_american => 'Amerikai AQI';
	@override String get aqi_good => 'Jó';
	@override String get aqi_fair => 'Megfelelő';
	@override String get aqi_moderate => 'Közepes';
	@override String get aqi_poor => 'Rossz';
	@override String get aqi_very_poor => 'Nagyon rossz';
	@override String get aqi_extremely_poor => 'Rendkívül rossz';
	@override String get aqi_unhealthy_sensitive => 'Káros az érzékenyeknek';
	@override String get aqi_unhealthy => 'Káros';
	@override String get aqi_very_unhealthy => 'Nagyon káros';
	@override String get aqi_hazardous => 'Veszélyes';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Európai';
	@override String get american => 'Amerikai';
	@override String get aqi_advice_good => 'Jó levegő a szabadtéri tevékenységekhez.';
	@override String get aqi_advice_fair => 'Általában rendben van. Érzékeny emberek korlátozhatják a hosszú szabadtéri terhelést.';
	@override String get aqi_advice_moderate => 'Az érzékeny csoportoknak csökkenteniük kell a szabadban töltött időt.';
	@override String get aqi_advice_poor => 'Korlátozza a szabadtéri tevékenységet, különösen ha érzékeny a légszennyezésre.';
	@override String get aqi_advice_very_poor => 'Kerülje a hosszú szabadtéri terhelést. Mindenki érezhet egészségügyi hatásokat.';
	@override String get aqi_advice_extremely_poor => 'Maradjon bent, ha lehetséges. A szabadtéri tevékenység nem ajánlott.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Szennyező anyagok';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'Frissítve';
	@override String get app_font => 'Betűtípus';
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
	@override String get today => 'Ma';
	@override String get tomorrow => 'Holnap';
}

/// The flat map containing all translations for locale <hu-HU>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHuHu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Nincs internet',
			'edit_city_hint' => 'Városi információk szerkesztése',
			'location_not_found' => 'Nem sikerült meghatározni a tartózkodási helyét',
			'mi' => 'mérföld',
			'next' => 'Tovább',
			'discard' => 'Elvetés',
			'east' => 'Kelet',
			'time_end' => 'Befejezési idő',
			'search_method' => 'Használja a keresést vagy a földrajzi helyet',
			'hourly_variables' => 'Óránkénti időjárási változók',
			'uv_index' => 'UV-index',
			'clear_sky' => 'Tiszta ég',
			'k_24' => '24 órás',
			'no_weather_card' => 'Adjon hozzá egy várost',
			'drizzle' => 'Szitálás',
			'humidity' => 'Páratartalom',
			'telegram' => 'Telegram',
			'functions' => 'Funkciók',
			'cities' => 'Városok',
			'southeast' => 'Délkelet',
			'validate_number' => 'Kérjük, adjon meg érvényes számot',
			'city' => 'Város',
			'uv_high' => 'Magas',
			'time' => 'Idő a városban',
			'uv_low' => 'Alacsony',
			'name3' => 'Kapcsolatfelvétel velünk',
			'apparent_temperature_min' => 'Minimális látszólagos hőmérséklet',
			'direction' => 'Irány',
			'heavy_rains' => 'Zivataros záporok',
			'apparent_temperature_max' => 'Maximális látszólagos hőmérséklet',
			'k_12' => '12 órás',
			'discord' => 'Discord',
			'discard_changes' => 'Biztosan el akarja vetni a módosításait?',
			'notifications' => 'Értesítések',
			'mph' => 'mph',
			'west' => 'Nyugat',
			'validate90' => 'Az érték -90 és 90 közötti kell legyen',
			'name2' => 'Kényelmes tervezés',
			'feels' => 'Hőérzet',
			'precipitation_probability' => 'Csapadék valószínűsége',
			'license' => 'Licenc',
			'widget_background' => 'Widget háttér',
			'large_element' => 'Nagy méretű időjárás megjelenítése',
			'unsaved_changes' => 'Nem mentett módosítások',
			'drizzling_rain' => 'Fagyos szitálás',
			'cloudy' => 'Felhős',
			'widget' => 'Widget',
			'precipitation' => 'Csapadék',
			'delete' => 'Törlés',
			'deleted_cache_store' => 'Gyorsítótár törlése folyamatban',
			'map' => 'Térkép',
			'description3' => 'Ha bármilyen problémája adódik, kérjük, lépjen kapcsolatba velünk e-mailben vagy az alkalmazás értékeléseiben.',
			'north' => 'Észak',
			'measurements' => 'Mérési rendszer',
			'start' => 'Kezdés',
			'settings_full' => 'Beállítások',
			'high' => 'Magas',
			'daily_variables' => 'Napi időjárási változók',
			'low' => 'Alacsony',
			'on_inter' => 'Kapcsolja be az internetet az időjárási adatok lekéréséhez.',
			'thunderstorm' => 'Zivatar',
			'version' => 'Alkalmazás verzió',
			'project' => 'Projekt',
			'amoled_theme' => 'AMOLED téma',
			'deleted_card_weather_query' => 'Biztosan törölni szeretné a várost?',
			'northeast' => 'Északkelet',
			'add_widget' => 'Widget hozzáadása',
			'fog' => 'Köd',
			'description2' => 'Az összes navigáció úgy van kialakítva, hogy maximálisan kényelmes és gyors legyen az alkalmazással való interakció.',
			'mm' => 'mm',
			'search_city' => 'Keresse meg a városát',
			'weather_more' => '12 napos időjárás előrejelzés',
			'round_degree' => 'Fokok Kerekítése',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Keresse meg vagy adja meg manuálisan a város adatait',
			'validate_name' => 'Kérjük, adja meg a nevet',
			'sunrise' => 'Napkelte',
			'km' => 'km',
			'district' => 'Kerület',
			'southwest' => 'Délkelet',
			'degrees' => 'Fok',
			'clear_cache_store' => 'Gyorsítótár törlése',
			'skip' => 'Kihagyás',
			'h_pa' => 'hPa',
			'appearance' => 'Megjelenés',
			'time_start' => 'Kezdési idő',
			'ready' => 'Kész',
			'kph' => 'km/óra',
			'deleted_cache_store_query' => 'Biztosan törölni szeretné a gyorsítótárat?',
			'widget_text' => 'Widget szöveg',
			'support' => 'Támogatás',
			'groups' => 'Csoportjaink',
			'system' => 'Rendszer',
			'sunset' => 'Napnyugta',
			'dewpoint' => 'Harmatpont',
			'shortwave_radiation' => 'Rövidhullámú sugárzás',
			'language' => 'Nyelv',
			'hide_map' => 'Térkép elrejtése',
			'cancel' => 'Mégse',
			'loading' => 'Betöltés...',
			'timeformat' => 'Időformátum',
			'lat' => 'Szélesség',
			'data' => 'Adatok',
			'visibility' => 'Láthatóság',
			'deleted_card_weather' => 'Város törlése',
			'celsius' => 'Celsius',
			'no_location' => 'Engedélyezze a helyszolgáltatást az aktuális hely időjárásadatainak megszerzéséhez.',
			'create' => 'Létrehozás',
			'edit' => 'Szerkesztés',
			'search' => 'Keresés...',
			'uv_extreme' => 'Extrém',
			'light' => 'Világos',
			'cloudcover' => 'Felhőzet',
			'uv_very_high' => 'Nagyon magas',
			'snow' => 'Hó',
			'done' => 'Kész',
			'theme' => 'Téma',
			'name' => 'Időjárás',
			'time_range' => 'Gyakoriság (órákban)',
			'about_app' => 'Az alkalmazásról',
			'save' => 'Mentés',
			'evaporation' => 'Párolgás',
			'freezing_rain' => 'Fagyos eső',
			'uv_average' => 'Mérsékelt',
			'reset_color' => 'Alapértelmezett visszaállítása',
			'metric' => 'Metrikus mértékegység',
			'overcast' => 'Borult',
			'pressure' => 'Nyomás',
			'inch' => 'hüvelyk',
			'imperial' => 'Angol mértékegység',
			'location' => 'Hely',
			'error_occurred' => 'Hiba történt',
			'validate_value' => 'Kérjük, adjon meg egy értéket',
			'lon' => 'Hosszúság',
			'wind' => 'Szél',
			'normal' => 'Normál',
			'dark' => 'Sötét',
			'settings' => 'Beállítások',
			'south' => 'Dél',
			'windgusts' => 'Szélrohamok',
			'northwest' => 'Északnyugat',
			'open_meteo' => 'Adatok az Open-Meteo-tól (CC-BY 4.0)',
			'rain' => 'Eső',
			'mm_hg' => 'mmHg',
			'validate180' => 'Az érték -180 és 180 közötti kell legyen',
			'description' => 'Időjárás alkalmazás a friss óránkénti, napi és heti előrejelzéssel bármely helyszínre.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dinamikus színek',
			'confirm' => 'Mentés',
			'no_results' => 'Nincs találat',
			'cities_load_error' => 'A városok betöltése sikertelen',
			'retry' => 'Újra',
			'city_not_found' => 'A város nem található',
			'air_quality' => 'Levegőminőség',
			'aqi_standard' => 'AQI szabvány',
			'aqi_european' => 'Európai AQI',
			'aqi_american' => 'Amerikai AQI',
			'aqi_good' => 'Jó',
			'aqi_fair' => 'Megfelelő',
			'aqi_moderate' => 'Közepes',
			'aqi_poor' => 'Rossz',
			'aqi_very_poor' => 'Nagyon rossz',
			'aqi_extremely_poor' => 'Rendkívül rossz',
			'aqi_unhealthy_sensitive' => 'Káros az érzékenyeknek',
			'aqi_unhealthy' => 'Káros',
			'aqi_very_unhealthy' => 'Nagyon káros',
			'aqi_hazardous' => 'Veszélyes',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Európai',
			'american' => 'Amerikai',
			'aqi_advice_good' => 'Jó levegő a szabadtéri tevékenységekhez.',
			'aqi_advice_fair' => 'Általában rendben van. Érzékeny emberek korlátozhatják a hosszú szabadtéri terhelést.',
			'aqi_advice_moderate' => 'Az érzékeny csoportoknak csökkenteniük kell a szabadban töltött időt.',
			'aqi_advice_poor' => 'Korlátozza a szabadtéri tevékenységet, különösen ha érzékeny a légszennyezésre.',
			'aqi_advice_very_poor' => 'Kerülje a hosszú szabadtéri terhelést. Mindenki érezhet egészségügyi hatásokat.',
			'aqi_advice_extremely_poor' => 'Maradjon bent, ha lehetséges. A szabadtéri tevékenység nem ajánlott.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Szennyező anyagok',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'Frissítve',
			'app_font' => 'Betűtípus',
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
			'today' => 'Ma',
			'tomorrow' => 'Holnap',
			_ => null,
		};
	}
}
