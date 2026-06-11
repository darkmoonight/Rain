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
class TranslationsDaDk extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDaDk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.daDk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <da-DK>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDaDk _root = this; // ignore: unused_field

	@override 
	TranslationsDaDk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDaDk(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Ingen Internet';
	@override String get edit_city_hint => 'Rediger byoplysninger';
	@override String get location_not_found => 'Kunne ikke bestemme din placering';
	@override String get mi => 'mi';
	@override String get next => 'Næste';
	@override String get discard => 'Kassér';
	@override String get east => 'Øst';
	@override String get time_end => 'Slut tid';
	@override String get search_method => 'Brug søgning eller geolokation';
	@override String get hourly_variables => 'Timevise vejrfaktorer';
	@override String get uv_index => 'UV-index';
	@override String get clear_sky => 'Skyfri himmel';
	@override String get k_24 => '24-timer';
	@override String get no_weather_card => 'Tilføj en by';
	@override String get drizzle => 'Støv regn';
	@override String get humidity => 'Luftfugtighed';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funktioner';
	@override String get cities => 'Byer';
	@override String get southeast => 'Sydøst';
	@override String get validate_number => 'Indtast et gyldigt nummer';
	@override String get city => 'By';
	@override String get uv_high => 'Høj';
	@override String get time => 'Tid i byen';
	@override String get uv_low => 'Lav';
	@override String get name3 => 'Kontakt os';
	@override String get apparent_temperature_min => 'Minimum temperature';
	@override String get direction => 'Retning';
	@override String get heavy_rains => 'Regnskyl';
	@override String get apparent_temperature_max => 'Maksimal temperatur';
	@override String get k_12 => '12-timer';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Er du sikker på, at du vil kassere dine ændringer?';
	@override String get notifications => 'Notifikationer';
	@override String get mph => 'mph';
	@override String get west => 'Vest';
	@override String get validate90 => 'Værdien skal være mellem -90 og 90';
	@override String get name2 => 'Praktisk design';
	@override String get feels => 'Føles som';
	@override String get precipitation_probability => 'Sandsynlighed for nedbør';
	@override String get license => 'Licenser';
	@override String get widget_background => 'Widget baggrund';
	@override String get large_element => 'Stort vejrdisplay';
	@override String get unsaved_changes => 'Ugemte ændringer';
	@override String get drizzling_rain => 'Frysende støvregn';
	@override String get cloudy => 'Skyet';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Nedbør';
	@override String get delete => 'Slet';
	@override String get deleted_cache_store => 'Rydder cache';
	@override String get map => 'Kort';
	@override String get description3 => 'Hvis du støder på problemer, må du meget gerne kontakte os via e-mail eller i app anmeldelserne.';
	@override String get north => 'Nord';
	@override String get measurements => 'Foranstaltningssystemet';
	@override String get start => 'Kom i gang';
	@override String get settings_full => 'Indstillinger';
	@override String get high => 'Høj';
	@override String get daily_variables => 'Daglige vejrfaktorer';
	@override String get low => 'Lav';
	@override String get on_inter => 'Tænd for internettet for at få meteorologisk data.';
	@override String get thunderstorm => 'Tordenvejr';
	@override String get version => 'App version';
	@override String get project => 'Projektet findes på';
	@override String get amoled_theme => 'AMOLED-tema';
	@override String get deleted_card_weather_query => 'Er du sikker på at du vil slette denne by?';
	@override String get northeast => 'Nordøst';
	@override String get add_widget => 'Tilføj widget';
	@override String get fog => 'Tåge';
	@override String get description2 => 'Al navigation er designet til at interagere med appen så bekvemt og hurtigt som muligt.';
	@override String get mm => 'mm';
	@override String get search_city => 'Find din by';
	@override String get weather_more => '12 dages vejrudsigt';
	@override String get round_degree => 'Afrundede grader';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Søg efter byoplysninger eller indtast manuelt';
	@override String get validate_name => 'Indtast venligst navnet';
	@override String get sunrise => 'Solopgang';
	@override String get km => 'km';
	@override String get district => 'Distrikt';
	@override String get southwest => 'Sydvest';
	@override String get degrees => 'Grader';
	@override String get clear_cache_store => 'Ryd cache';
	@override String get skip => 'Spring over';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Udseende';
	@override String get time_start => 'Start tid';
	@override String get ready => 'Klar';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Er du sikker på, at du vil rydde cachen?';
	@override String get widget_text => 'Widget tekst';
	@override String get support => 'Support';
	@override String get groups => 'Vores grupper';
	@override String get system => 'System';
	@override String get sunset => 'Solnedgang';
	@override String get dewpoint => 'Dugpunktet';
	@override String get shortwave_radiation => 'Kortbølgestråling';
	@override String get language => 'Sprog';
	@override String get hide_map => 'Skjul kort';
	@override String get cancel => 'Annullere';
	@override String get loading => 'Henter...';
	@override String get timeformat => 'Tids format';
	@override String get lat => 'Breddegrad';
	@override String get data => 'Data';
	@override String get visibility => 'Sigtbarhed';
	@override String get deleted_card_weather => 'Slet en by';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Aktiver placeringer for at få vejrdata for den aktuelle placering.';
	@override String get create => 'Opret';
	@override String get edit => 'Rediger';
	@override String get search => 'Søg...';
	@override String get uv_extreme => 'Ekstrem';
	@override String get light => 'Lys';
	@override String get cloudcover => 'skydække';
	@override String get uv_very_high => 'Meget højt';
	@override String get snow => 'Sne';
	@override String get done => 'Færdig';
	@override String get theme => 'Tema';
	@override String get name => 'Vejr';
	@override String get time_range => 'Hyppighed (i timer)';
	@override String get about_app => 'Om appen';
	@override String get save => 'Gem';
	@override String get evaporation => 'Fordampning';
	@override String get freezing_rain => 'Frostregn';
	@override String get uv_average => 'Moderat';
	@override String get reset_color => 'Nulstil til standard';
	@override String get metric => 'Metrisk';
	@override String get overcast => 'Overskyet';
	@override String get pressure => 'Tryk';
	@override String get inch => 'tommer';
	@override String get imperial => 'Imperialistisk';
	@override String get location => 'Placering';
	@override String get error_occurred => 'Der opstod en fejl';
	@override String get validate_value => 'Indtast en værdi';
	@override String get lon => 'Længdegrad';
	@override String get wind => 'Vind';
	@override String get normal => 'Normal';
	@override String get dark => 'Mørk';
	@override String get settings => 'Inds.';
	@override String get south => 'Syd';
	@override String get windgusts => 'Vindstød';
	@override String get northwest => 'Nordvest';
	@override String get open_meteo => 'Data fra Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Regn';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Værdien skal være mellem -180 og 180';
	@override String get description => 'Vejr app med en opdateret vejrudsigt for hver time, dag og uge for ethvert sted.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dynamiske farver';
	@override String get confirm => 'Gem';
	@override String get no_results => 'Ingen resultater';
	@override String get cities_load_error => 'Kunne ikke indlæse byer';
	@override String get retry => 'Prøv igen';
	@override String get city_not_found => 'By ikke fundet';
	@override String get air_quality => 'Luftkvalitet';
	@override String get aqi_standard => 'AQI-standard';
	@override String get aqi_european => 'Europæisk AQI';
	@override String get aqi_american => 'Amerikansk AQI';
	@override String get aqi_good => 'God';
	@override String get aqi_fair => 'Tilfredsstillende';
	@override String get aqi_moderate => 'Moderat';
	@override String get aqi_poor => 'Dårlig';
	@override String get aqi_very_poor => 'Meget dårlig';
	@override String get aqi_extremely_poor => 'Ekstremt dårlig';
	@override String get aqi_unhealthy_sensitive => 'Usund for følsomme';
	@override String get aqi_unhealthy => 'Usund';
	@override String get aqi_very_unhealthy => 'Meget usund';
	@override String get aqi_hazardous => 'Farlig';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Europæisk';
	@override String get american => 'Amerikansk';
	@override String get aqi_advice_good => 'God luft til udendørs aktiviteter.';
	@override String get aqi_advice_fair => 'Generelt fint. Følsomme personer kan begrænse langvarig anstrengelse udendørs.';
	@override String get aqi_advice_moderate => 'Følsomme grupper bør reducere tiden udendørs.';
	@override String get aqi_advice_poor => 'Begræns udendørs aktivitet, især hvis du er følsom over for luftforurening.';
	@override String get aqi_advice_very_poor => 'Undgå langvarig anstrengelse udendørs. Alle kan mærke helbredseffekter.';
	@override String get aqi_advice_extremely_poor => 'Bliv indendørs hvis muligt. Udendørs aktivitet anbefales ikke.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Forurenende stoffer';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'Opdateret';
	@override String get app_font => 'Skrifttype';
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

/// The flat map containing all translations for locale <da-DK>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDaDk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Ingen Internet',
			'edit_city_hint' => 'Rediger byoplysninger',
			'location_not_found' => 'Kunne ikke bestemme din placering',
			'mi' => 'mi',
			'next' => 'Næste',
			'discard' => 'Kassér',
			'east' => 'Øst',
			'time_end' => 'Slut tid',
			'search_method' => 'Brug søgning eller geolokation',
			'hourly_variables' => 'Timevise vejrfaktorer',
			'uv_index' => 'UV-index',
			'clear_sky' => 'Skyfri himmel',
			'k_24' => '24-timer',
			'no_weather_card' => 'Tilføj en by',
			'drizzle' => 'Støv regn',
			'humidity' => 'Luftfugtighed',
			'telegram' => 'Telegram',
			'functions' => 'Funktioner',
			'cities' => 'Byer',
			'southeast' => 'Sydøst',
			'validate_number' => 'Indtast et gyldigt nummer',
			'city' => 'By',
			'uv_high' => 'Høj',
			'time' => 'Tid i byen',
			'uv_low' => 'Lav',
			'name3' => 'Kontakt os',
			'apparent_temperature_min' => 'Minimum temperature',
			'direction' => 'Retning',
			'heavy_rains' => 'Regnskyl',
			'apparent_temperature_max' => 'Maksimal temperatur',
			'k_12' => '12-timer',
			'discord' => 'Discord',
			'discard_changes' => 'Er du sikker på, at du vil kassere dine ændringer?',
			'notifications' => 'Notifikationer',
			'mph' => 'mph',
			'west' => 'Vest',
			'validate90' => 'Værdien skal være mellem -90 og 90',
			'name2' => 'Praktisk design',
			'feels' => 'Føles som',
			'precipitation_probability' => 'Sandsynlighed for nedbør',
			'license' => 'Licenser',
			'widget_background' => 'Widget baggrund',
			'large_element' => 'Stort vejrdisplay',
			'unsaved_changes' => 'Ugemte ændringer',
			'drizzling_rain' => 'Frysende støvregn',
			'cloudy' => 'Skyet',
			'widget' => 'Widget',
			'precipitation' => 'Nedbør',
			'delete' => 'Slet',
			'deleted_cache_store' => 'Rydder cache',
			'map' => 'Kort',
			'description3' => 'Hvis du støder på problemer, må du meget gerne kontakte os via e-mail eller i app anmeldelserne.',
			'north' => 'Nord',
			'measurements' => 'Foranstaltningssystemet',
			'start' => 'Kom i gang',
			'settings_full' => 'Indstillinger',
			'high' => 'Høj',
			'daily_variables' => 'Daglige vejrfaktorer',
			'low' => 'Lav',
			'on_inter' => 'Tænd for internettet for at få meteorologisk data.',
			'thunderstorm' => 'Tordenvejr',
			'version' => 'App version',
			'project' => 'Projektet findes på',
			'amoled_theme' => 'AMOLED-tema',
			'deleted_card_weather_query' => 'Er du sikker på at du vil slette denne by?',
			'northeast' => 'Nordøst',
			'add_widget' => 'Tilføj widget',
			'fog' => 'Tåge',
			'description2' => 'Al navigation er designet til at interagere med appen så bekvemt og hurtigt som muligt.',
			'mm' => 'mm',
			'search_city' => 'Find din by',
			'weather_more' => '12 dages vejrudsigt',
			'round_degree' => 'Afrundede grader',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Søg efter byoplysninger eller indtast manuelt',
			'validate_name' => 'Indtast venligst navnet',
			'sunrise' => 'Solopgang',
			'km' => 'km',
			'district' => 'Distrikt',
			'southwest' => 'Sydvest',
			'degrees' => 'Grader',
			'clear_cache_store' => 'Ryd cache',
			'skip' => 'Spring over',
			'h_pa' => 'hPa',
			'appearance' => 'Udseende',
			'time_start' => 'Start tid',
			'ready' => 'Klar',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Er du sikker på, at du vil rydde cachen?',
			'widget_text' => 'Widget tekst',
			'support' => 'Support',
			'groups' => 'Vores grupper',
			'system' => 'System',
			'sunset' => 'Solnedgang',
			'dewpoint' => 'Dugpunktet',
			'shortwave_radiation' => 'Kortbølgestråling',
			'language' => 'Sprog',
			'hide_map' => 'Skjul kort',
			'cancel' => 'Annullere',
			'loading' => 'Henter...',
			'timeformat' => 'Tids format',
			'lat' => 'Breddegrad',
			'data' => 'Data',
			'visibility' => 'Sigtbarhed',
			'deleted_card_weather' => 'Slet en by',
			'celsius' => 'Celsius',
			'no_location' => 'Aktiver placeringer for at få vejrdata for den aktuelle placering.',
			'create' => 'Opret',
			'edit' => 'Rediger',
			'search' => 'Søg...',
			'uv_extreme' => 'Ekstrem',
			'light' => 'Lys',
			'cloudcover' => 'skydække',
			'uv_very_high' => 'Meget højt',
			'snow' => 'Sne',
			'done' => 'Færdig',
			'theme' => 'Tema',
			'name' => 'Vejr',
			'time_range' => 'Hyppighed (i timer)',
			'about_app' => 'Om appen',
			'save' => 'Gem',
			'evaporation' => 'Fordampning',
			'freezing_rain' => 'Frostregn',
			'uv_average' => 'Moderat',
			'reset_color' => 'Nulstil til standard',
			'metric' => 'Metrisk',
			'overcast' => 'Overskyet',
			'pressure' => 'Tryk',
			'inch' => 'tommer',
			'imperial' => 'Imperialistisk',
			'location' => 'Placering',
			'error_occurred' => 'Der opstod en fejl',
			'validate_value' => 'Indtast en værdi',
			'lon' => 'Længdegrad',
			'wind' => 'Vind',
			'normal' => 'Normal',
			'dark' => 'Mørk',
			'settings' => 'Inds.',
			'south' => 'Syd',
			'windgusts' => 'Vindstød',
			'northwest' => 'Nordvest',
			'open_meteo' => 'Data fra Open-Meteo (CC-BY 4.0)',
			'rain' => 'Regn',
			'mm_hg' => 'mmHg',
			'validate180' => 'Værdien skal være mellem -180 og 180',
			'description' => 'Vejr app med en opdateret vejrudsigt for hver time, dag og uge for ethvert sted.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dynamiske farver',
			'confirm' => 'Gem',
			'no_results' => 'Ingen resultater',
			'cities_load_error' => 'Kunne ikke indlæse byer',
			'retry' => 'Prøv igen',
			'city_not_found' => 'By ikke fundet',
			'air_quality' => 'Luftkvalitet',
			'aqi_standard' => 'AQI-standard',
			'aqi_european' => 'Europæisk AQI',
			'aqi_american' => 'Amerikansk AQI',
			'aqi_good' => 'God',
			'aqi_fair' => 'Tilfredsstillende',
			'aqi_moderate' => 'Moderat',
			'aqi_poor' => 'Dårlig',
			'aqi_very_poor' => 'Meget dårlig',
			'aqi_extremely_poor' => 'Ekstremt dårlig',
			'aqi_unhealthy_sensitive' => 'Usund for følsomme',
			'aqi_unhealthy' => 'Usund',
			'aqi_very_unhealthy' => 'Meget usund',
			'aqi_hazardous' => 'Farlig',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Europæisk',
			'american' => 'Amerikansk',
			'aqi_advice_good' => 'God luft til udendørs aktiviteter.',
			'aqi_advice_fair' => 'Generelt fint. Følsomme personer kan begrænse langvarig anstrengelse udendørs.',
			'aqi_advice_moderate' => 'Følsomme grupper bør reducere tiden udendørs.',
			'aqi_advice_poor' => 'Begræns udendørs aktivitet, især hvis du er følsom over for luftforurening.',
			'aqi_advice_very_poor' => 'Undgå langvarig anstrengelse udendørs. Alle kan mærke helbredseffekter.',
			'aqi_advice_extremely_poor' => 'Bliv indendørs hvis muligt. Udendørs aktivitet anbefales ikke.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Forurenende stoffer',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'Opdateret',
			'app_font' => 'Skrifttype',
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
