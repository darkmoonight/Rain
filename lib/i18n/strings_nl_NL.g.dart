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
class TranslationsNlNl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNlNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nlNl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl-NL>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsNlNl _root = this; // ignore: unused_field

	@override 
	TranslationsNlNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNlNl(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Geen Internet';
	@override String get edit_city_hint => 'Stadsinformatie bewerken';
	@override String get location_not_found => 'Kan uw locatie niet bepalen';
	@override String get mi => 'mi';
	@override String get next => 'Volgende';
	@override String get discard => 'Negeren';
	@override String get east => 'Oost';
	@override String get time_end => 'Eindtijd';
	@override String get search_method => 'Gebruik zoeken of geolocatie';
	@override String get hourly_variables => 'Uurlijkse weervariabelen';
	@override String get uv_index => 'UV-index';
	@override String get clear_sky => 'Heldere lucht';
	@override String get k_24 => '24-uur';
	@override String get no_weather_card => 'Voeg een stad toe';
	@override String get drizzle => 'Motregen';
	@override String get humidity => 'Luchtvochtigheid';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Functies';
	@override String get cities => 'Steden';
	@override String get southeast => 'Zuidoost';
	@override String get validate_number => 'Vul een geldig nummer in';
	@override String get city => 'Stad';
	@override String get uv_high => 'Hoog';
	@override String get time => 'Tijd in de stad';
	@override String get uv_low => 'Laag';
	@override String get name3 => 'Neem contact met ons op';
	@override String get apparent_temperature_min => 'Minimum schijnbare temperatuur';
	@override String get direction => 'Richting';
	@override String get heavy_rains => 'Regendouche';
	@override String get apparent_temperature_max => 'Maximale schijnbare temperatuur';
	@override String get k_12 => '12-uur';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Weet u zeker dat u uw wijzigingen wilt negeren?';
	@override String get notifications => 'Notificaties';
	@override String get mph => 'mph';
	@override String get west => 'West';
	@override String get validate90 => 'Waarde moet tussen -90 and 90 zijn';
	@override String get name2 => 'Handig Ontwerp';
	@override String get feels => 'Voelt';
	@override String get precipitation_probability => 'Kans op neerslag';
	@override String get license => 'Licenties';
	@override String get widget_background => 'Widget-achtergrond';
	@override String get large_element => 'Groot weerbericht weergeven';
	@override String get unsaved_changes => 'Niet-opgeslagen wijzigingen';
	@override String get drizzling_rain => 'Ijskoude motregen';
	@override String get cloudy => 'Bewolkt';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Neerslag';
	@override String get delete => 'Verwijder';
	@override String get deleted_cache_store => 'Cache wissen';
	@override String get map => 'Kaart';
	@override String get description3 => 'Als u problemen ondervindt, neem dan contact met ons op via e-mail of in de recensies van de applicatie.';
	@override String get north => 'Noord';
	@override String get measurements => 'Meetsysteem';
	@override String get start => 'Beginnen';
	@override String get settings_full => 'Instellingen';
	@override String get high => 'Hoog';
	@override String get daily_variables => 'Dagelijkse weervariabelen';
	@override String get low => 'Laag';
	@override String get on_inter => 'Schakel Internet in om meteorologische gegevens te ontvangen.';
	@override String get thunderstorm => 'Onweersbui';
	@override String get version => 'Applicatieversie';
	@override String get project => 'Project op';
	@override String get amoled_theme => 'AMOLED-thema';
	@override String get deleted_card_weather_query => 'Weet je zeker dat je de stad wilt verwijderen?';
	@override String get northeast => 'Noordoost';
	@override String get add_widget => 'Widget toevoegen';
	@override String get fog => 'Mist';
	@override String get description2 => 'Alle navigatie is ontworpen om zo gemakkelijk en snel mogelijk met de applicatie te kunnen communiceren.';
	@override String get mm => 'mm';
	@override String get search_city => 'Vind jouw stad';
	@override String get weather_more => '12-daagse weersverwachting';
	@override String get round_degree => 'Rond graden af';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Zoek of voer stadsgegevens handmatig in';
	@override String get validate_name => 'Vul de naam in';
	@override String get sunrise => 'Zonsopkomst';
	@override String get km => 'km';
	@override String get district => 'District';
	@override String get southwest => 'Zuidwest';
	@override String get degrees => 'Graden';
	@override String get clear_cache_store => 'Cache wissen';
	@override String get skip => 'Overslaan';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Uiterlijk';
	@override String get time_start => 'Begintijd';
	@override String get ready => 'Klaar';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Weet je zeker dat je de cache wilt wissen?';
	@override String get widget_text => 'Tekst van widget';
	@override String get support => 'Ondersteuning';
	@override String get groups => 'Onze groepen';
	@override String get system => 'Systeem';
	@override String get sunset => 'Zonsondergang';
	@override String get dewpoint => 'Dauwpunt';
	@override String get shortwave_radiation => 'Korte golfstraling';
	@override String get language => 'Taal';
	@override String get hide_map => 'Kaart verbergen';
	@override String get cancel => 'Annuleer';
	@override String get loading => 'Laden...';
	@override String get timeformat => 'Tijdnotatie';
	@override String get lat => 'Breedtegraad';
	@override String get data => 'Gegevens';
	@override String get visibility => 'Zichtbaarheid';
	@override String get deleted_card_weather => 'Verwijder een city';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Schakel de locatiedienst in om weer gegevens voor de huidige locatie te ontvangen.';
	@override String get create => 'Creëer';
	@override String get edit => 'Bewerken';
	@override String get search => 'Zoeken...';
	@override String get uv_extreme => 'Extreem';
	@override String get light => 'Licht';
	@override String get cloudcover => 'Bewolking';
	@override String get uv_very_high => 'Erg hoog';
	@override String get snow => 'Sneeuw';
	@override String get done => 'Klaar';
	@override String get theme => 'Thema';
	@override String get name => 'Weer';
	@override String get time_range => 'Frequentie (in uren)';
	@override String get about_app => 'Over de app';
	@override String get save => 'Opslaan';
	@override String get evaporation => 'Verdamping';
	@override String get freezing_rain => 'Ijskoude regen';
	@override String get uv_average => 'Matig';
	@override String get reset_color => 'Herstellen naar standaard';
	@override String get metric => 'Metrisch';
	@override String get overcast => 'Betrokken';
	@override String get pressure => 'Druk';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperiaal';
	@override String get location => 'Locatie';
	@override String get error_occurred => 'Er is een fout opgetreden';
	@override String get validate_value => 'Vul een waarde in';
	@override String get lon => 'Lengtegraad';
	@override String get wind => 'Wind';
	@override String get normal => 'Normaal';
	@override String get dark => 'Donker';
	@override String get settings => 'Instellingen.';
	@override String get south => 'Zuid';
	@override String get windgusts => 'Windstoten';
	@override String get northwest => 'Noordwest';
	@override String get open_meteo => 'Gegevens van Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Regen';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Waarde moet tussen -180 and 180 zijn';
	@override String get description => 'Weer-applicatie met een actuele prognose voor elk uur, dag en week voor elke locatie.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dynamische Kleuren';
	@override String get confirm => 'Opslaan';
	@override String get no_results => 'Geen resultaten';
	@override String get cities_load_error => 'Steden laden mislukt';
	@override String get retry => 'Opnieuw';
	@override String get city_not_found => 'Stad niet gevonden';
	@override String get air_quality => 'Luchtkwaliteit';
	@override String get aqi_standard => 'AQI-standaard';
	@override String get aqi_european => 'Europese AQI';
	@override String get aqi_american => 'Amerikaanse AQI';
	@override String get aqi_good => 'Goed';
	@override String get aqi_fair => 'Redelijk';
	@override String get aqi_moderate => 'Matig';
	@override String get aqi_poor => 'Slecht';
	@override String get aqi_very_poor => 'Zeer slecht';
	@override String get aqi_extremely_poor => 'Extreem slecht';
	@override String get aqi_unhealthy_sensitive => 'Ongezond voor gevoelige groepen';
	@override String get aqi_unhealthy => 'Ongezond';
	@override String get aqi_very_unhealthy => 'Zeer ongezond';
	@override String get aqi_hazardous => 'Gevaarlijk';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Europees';
	@override String get american => 'Amerikaans';
	@override String get aqi_advice_good => 'Goede lucht voor buitenactiviteiten.';
	@override String get aqi_advice_fair => 'Over het algemeen prima. Gevoelige mensen kunnen langdurige inspanning buiten beperken.';
	@override String get aqi_advice_moderate => 'Gevoelige groepen moeten minder tijd buiten doorbrengen.';
	@override String get aqi_advice_poor => 'Beperk buitenactiviteit, vooral als je gevoelig bent voor luchtvervuiling.';
	@override String get aqi_advice_very_poor => 'Vermijd langdurige inspanning buiten. Iedereen kan gezondheidseffecten voelen.';
	@override String get aqi_advice_extremely_poor => 'Blijf binnen als dat kan. Buitenactiviteit wordt niet aanbevolen.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Verontreinigende stoffen';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'Bijgewerkt';
	@override String get app_font => 'Lettertype';
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
	@override String get today => 'Vandaag';
	@override String get tomorrow => 'Morgen';
}

/// The flat map containing all translations for locale <nl-NL>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsNlNl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Geen Internet',
			'edit_city_hint' => 'Stadsinformatie bewerken',
			'location_not_found' => 'Kan uw locatie niet bepalen',
			'mi' => 'mi',
			'next' => 'Volgende',
			'discard' => 'Negeren',
			'east' => 'Oost',
			'time_end' => 'Eindtijd',
			'search_method' => 'Gebruik zoeken of geolocatie',
			'hourly_variables' => 'Uurlijkse weervariabelen',
			'uv_index' => 'UV-index',
			'clear_sky' => 'Heldere lucht',
			'k_24' => '24-uur',
			'no_weather_card' => 'Voeg een stad toe',
			'drizzle' => 'Motregen',
			'humidity' => 'Luchtvochtigheid',
			'telegram' => 'Telegram',
			'functions' => 'Functies',
			'cities' => 'Steden',
			'southeast' => 'Zuidoost',
			'validate_number' => 'Vul een geldig nummer in',
			'city' => 'Stad',
			'uv_high' => 'Hoog',
			'time' => 'Tijd in de stad',
			'uv_low' => 'Laag',
			'name3' => 'Neem contact met ons op',
			'apparent_temperature_min' => 'Minimum schijnbare temperatuur',
			'direction' => 'Richting',
			'heavy_rains' => 'Regendouche',
			'apparent_temperature_max' => 'Maximale schijnbare temperatuur',
			'k_12' => '12-uur',
			'discord' => 'Discord',
			'discard_changes' => 'Weet u zeker dat u uw wijzigingen wilt negeren?',
			'notifications' => 'Notificaties',
			'mph' => 'mph',
			'west' => 'West',
			'validate90' => 'Waarde moet tussen -90 and 90 zijn',
			'name2' => 'Handig Ontwerp',
			'feels' => 'Voelt',
			'precipitation_probability' => 'Kans op neerslag',
			'license' => 'Licenties',
			'widget_background' => 'Widget-achtergrond',
			'large_element' => 'Groot weerbericht weergeven',
			'unsaved_changes' => 'Niet-opgeslagen wijzigingen',
			'drizzling_rain' => 'Ijskoude motregen',
			'cloudy' => 'Bewolkt',
			'widget' => 'Widget',
			'precipitation' => 'Neerslag',
			'delete' => 'Verwijder',
			'deleted_cache_store' => 'Cache wissen',
			'map' => 'Kaart',
			'description3' => 'Als u problemen ondervindt, neem dan contact met ons op via e-mail of in de recensies van de applicatie.',
			'north' => 'Noord',
			'measurements' => 'Meetsysteem',
			'start' => 'Beginnen',
			'settings_full' => 'Instellingen',
			'high' => 'Hoog',
			'daily_variables' => 'Dagelijkse weervariabelen',
			'low' => 'Laag',
			'on_inter' => 'Schakel Internet in om meteorologische gegevens te ontvangen.',
			'thunderstorm' => 'Onweersbui',
			'version' => 'Applicatieversie',
			'project' => 'Project op',
			'amoled_theme' => 'AMOLED-thema',
			'deleted_card_weather_query' => 'Weet je zeker dat je de stad wilt verwijderen?',
			'northeast' => 'Noordoost',
			'add_widget' => 'Widget toevoegen',
			'fog' => 'Mist',
			'description2' => 'Alle navigatie is ontworpen om zo gemakkelijk en snel mogelijk met de applicatie te kunnen communiceren.',
			'mm' => 'mm',
			'search_city' => 'Vind jouw stad',
			'weather_more' => '12-daagse weersverwachting',
			'round_degree' => 'Rond graden af',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Zoek of voer stadsgegevens handmatig in',
			'validate_name' => 'Vul de naam in',
			'sunrise' => 'Zonsopkomst',
			'km' => 'km',
			'district' => 'District',
			'southwest' => 'Zuidwest',
			'degrees' => 'Graden',
			'clear_cache_store' => 'Cache wissen',
			'skip' => 'Overslaan',
			'h_pa' => 'hPa',
			'appearance' => 'Uiterlijk',
			'time_start' => 'Begintijd',
			'ready' => 'Klaar',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Weet je zeker dat je de cache wilt wissen?',
			'widget_text' => 'Tekst van widget',
			'support' => 'Ondersteuning',
			'groups' => 'Onze groepen',
			'system' => 'Systeem',
			'sunset' => 'Zonsondergang',
			'dewpoint' => 'Dauwpunt',
			'shortwave_radiation' => 'Korte golfstraling',
			'language' => 'Taal',
			'hide_map' => 'Kaart verbergen',
			'cancel' => 'Annuleer',
			'loading' => 'Laden...',
			'timeformat' => 'Tijdnotatie',
			'lat' => 'Breedtegraad',
			'data' => 'Gegevens',
			'visibility' => 'Zichtbaarheid',
			'deleted_card_weather' => 'Verwijder een city',
			'celsius' => 'Celsius',
			'no_location' => 'Schakel de locatiedienst in om weer gegevens voor de huidige locatie te ontvangen.',
			'create' => 'Creëer',
			'edit' => 'Bewerken',
			'search' => 'Zoeken...',
			'uv_extreme' => 'Extreem',
			'light' => 'Licht',
			'cloudcover' => 'Bewolking',
			'uv_very_high' => 'Erg hoog',
			'snow' => 'Sneeuw',
			'done' => 'Klaar',
			'theme' => 'Thema',
			'name' => 'Weer',
			'time_range' => 'Frequentie (in uren)',
			'about_app' => 'Over de app',
			'save' => 'Opslaan',
			'evaporation' => 'Verdamping',
			'freezing_rain' => 'Ijskoude regen',
			'uv_average' => 'Matig',
			'reset_color' => 'Herstellen naar standaard',
			'metric' => 'Metrisch',
			'overcast' => 'Betrokken',
			'pressure' => 'Druk',
			'inch' => 'inch',
			'imperial' => 'Imperiaal',
			'location' => 'Locatie',
			'error_occurred' => 'Er is een fout opgetreden',
			'validate_value' => 'Vul een waarde in',
			'lon' => 'Lengtegraad',
			'wind' => 'Wind',
			'normal' => 'Normaal',
			'dark' => 'Donker',
			'settings' => 'Instellingen.',
			'south' => 'Zuid',
			'windgusts' => 'Windstoten',
			'northwest' => 'Noordwest',
			'open_meteo' => 'Gegevens van Open-Meteo (CC-BY 4.0)',
			'rain' => 'Regen',
			'mm_hg' => 'mmHg',
			'validate180' => 'Waarde moet tussen -180 and 180 zijn',
			'description' => 'Weer-applicatie met een actuele prognose voor elk uur, dag en week voor elke locatie.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dynamische Kleuren',
			'confirm' => 'Opslaan',
			'no_results' => 'Geen resultaten',
			'cities_load_error' => 'Steden laden mislukt',
			'retry' => 'Opnieuw',
			'city_not_found' => 'Stad niet gevonden',
			'air_quality' => 'Luchtkwaliteit',
			'aqi_standard' => 'AQI-standaard',
			'aqi_european' => 'Europese AQI',
			'aqi_american' => 'Amerikaanse AQI',
			'aqi_good' => 'Goed',
			'aqi_fair' => 'Redelijk',
			'aqi_moderate' => 'Matig',
			'aqi_poor' => 'Slecht',
			'aqi_very_poor' => 'Zeer slecht',
			'aqi_extremely_poor' => 'Extreem slecht',
			'aqi_unhealthy_sensitive' => 'Ongezond voor gevoelige groepen',
			'aqi_unhealthy' => 'Ongezond',
			'aqi_very_unhealthy' => 'Zeer ongezond',
			'aqi_hazardous' => 'Gevaarlijk',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Europees',
			'american' => 'Amerikaans',
			'aqi_advice_good' => 'Goede lucht voor buitenactiviteiten.',
			'aqi_advice_fair' => 'Over het algemeen prima. Gevoelige mensen kunnen langdurige inspanning buiten beperken.',
			'aqi_advice_moderate' => 'Gevoelige groepen moeten minder tijd buiten doorbrengen.',
			'aqi_advice_poor' => 'Beperk buitenactiviteit, vooral als je gevoelig bent voor luchtvervuiling.',
			'aqi_advice_very_poor' => 'Vermijd langdurige inspanning buiten. Iedereen kan gezondheidseffecten voelen.',
			'aqi_advice_extremely_poor' => 'Blijf binnen als dat kan. Buitenactiviteit wordt niet aanbevolen.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Verontreinigende stoffen',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'Bijgewerkt',
			'app_font' => 'Lettertype',
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
			'today' => 'Vandaag',
			'tomorrow' => 'Morgen',
			_ => null,
		};
	}
}
