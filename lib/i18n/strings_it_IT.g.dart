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
class TranslationsItIt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsItIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.itIt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it-IT>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsItIt _root = this; // ignore: unused_field

	@override 
	TranslationsItIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsItIt(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Non c\'è connessione Internet';
	@override String get edit_city_hint => 'Modifica informazioni città';
	@override String get location_not_found => 'Impossibile determinare la tua posizione';
	@override String get mi => 'mi';
	@override String get next => 'Avanti';
	@override String get discard => 'Annulla';
	@override String get east => 'Est';
	@override String get time_end => 'Ora di fine';
	@override String get search_method => 'Utilizza la ricerca o la geolocalizzazione';
	@override String get hourly_variables => 'Variabili meteorologiche orarie';
	@override String get uv_index => 'Indice UV';
	@override String get clear_sky => 'Sereno';
	@override String get k_24 => '24 ore';
	@override String get no_weather_card => 'Aggiungi una città';
	@override String get drizzle => 'Pioggerella';
	@override String get humidity => 'Umidità';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funzioni';
	@override String get cities => 'Città';
	@override String get southeast => 'Sud-est';
	@override String get validate_number => 'Si prega di inserire il numero';
	@override String get city => 'Città';
	@override String get uv_high => 'Alto';
	@override String get time => 'Orario locale';
	@override String get uv_low => 'Basso';
	@override String get name3 => 'Contattaci';
	@override String get apparent_temperature_min => 'Temperatura minima percepita';
	@override String get direction => 'Direzione';
	@override String get heavy_rains => 'Acquazzone';
	@override String get apparent_temperature_max => 'Temperatura massima percepita';
	@override String get k_12 => '12 ore';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Sei sicuro di voler annullare le modifiche?';
	@override String get notifications => 'Notifiche';
	@override String get mph => 'mph';
	@override String get west => 'Ovest';
	@override String get validate90 => 'Il valore deve essere compreso tra -90 e 90';
	@override String get name2 => 'Design comodo';
	@override String get feels => 'Percepiti';
	@override String get precipitation_probability => 'Probabilità di precipitazione';
	@override String get license => 'Licenze';
	@override String get widget_background => 'Sfondo del widget';
	@override String get large_element => 'Visualizzazione grande elemento meteo';
	@override String get unsaved_changes => 'Modifiche non salvate';
	@override String get drizzling_rain => 'Pioggerella Gelata';
	@override String get cloudy => 'Nuvoloso';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Precipitazione';
	@override String get delete => 'Elimina';
	@override String get deleted_cache_store => 'Cancellazione della cache';
	@override String get map => 'Mappa';
	@override String get description3 => 'Se riscontri problemi, contattaci via email o nelle recensioni dell\'applicazione.';
	@override String get north => 'Nord';
	@override String get measurements => 'Sistema di misure';
	@override String get start => 'Clicca per iniziare';
	@override String get settings_full => 'Impostazioni';
	@override String get high => 'Alto';
	@override String get daily_variables => 'Variabili meteorologiche giornaliere';
	@override String get low => 'Basso';
	@override String get on_inter => 'Attiva la connessione Internet per avere dati meteorologici.';
	@override String get thunderstorm => 'Temporale';
	@override String get version => 'Versione dell\'applicazione';
	@override String get project => 'Progetto su';
	@override String get amoled_theme => 'Tema AMOLED';
	@override String get deleted_card_weather_query => 'Sei sicuro di voler rimuovere questa città?';
	@override String get northeast => 'Nord-est';
	@override String get add_widget => 'Aggiungi widget';
	@override String get fog => 'Nebbia';
	@override String get description2 => 'Tutta la navigazione è progettata per interagire con l\'applicazione nel modo più comodo e veloce possibile.';
	@override String get mm => 'mm';
	@override String get search_city => 'Trova la tua città';
	@override String get weather_more => 'Previsioni del tempo per 12 giorni';
	@override String get round_degree => 'Arrotonda i gradi';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'Cerca o inserisci manualmente i dati della città';
	@override String get validate_name => 'Si prega di inserire il nome';
	@override String get sunrise => 'Alba';
	@override String get km => 'km';
	@override String get district => 'Regione';
	@override String get southwest => 'Sud-ovest';
	@override String get degrees => 'Gradi';
	@override String get clear_cache_store => 'Cancella cache';
	@override String get skip => 'Salta';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Aspetto';
	@override String get time_start => 'Ora di inizio';
	@override String get ready => 'Pronto';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Sei sicuro di voler cancellare la cache?';
	@override String get widget_text => 'Testo del widget';
	@override String get support => 'Supporto';
	@override String get groups => 'I nostri gruppi';
	@override String get system => 'Sistema';
	@override String get sunset => 'Tramonto';
	@override String get dewpoint => 'Punto di rugiada';
	@override String get shortwave_radiation => 'Radiazione a onde corte';
	@override String get language => 'Lingua';
	@override String get hide_map => 'Nascondi mappa';
	@override String get cancel => 'Annulla';
	@override String get loading => 'Caricamento...';
	@override String get timeformat => 'Formato ora';
	@override String get lat => 'Latitudine';
	@override String get data => 'Dati';
	@override String get visibility => 'Visibilità';
	@override String get deleted_card_weather => 'Rimozione della città';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Abilita il servizio di localizzazione per ottenere i dati meteo per la posizione corrente.';
	@override String get create => 'Creare';
	@override String get edit => 'Modifica';
	@override String get search => 'Cerca...';
	@override String get uv_extreme => 'Estremo';
	@override String get light => 'Chiaro';
	@override String get cloudcover => 'Copertura nuvolosa';
	@override String get uv_very_high => 'Molto alto';
	@override String get snow => 'Neve';
	@override String get done => 'Fatto';
	@override String get theme => 'Tema';
	@override String get name => 'Meteo';
	@override String get time_range => 'Frequenza (in ore)';
	@override String get about_app => 'Informazioni sull\'app';
	@override String get save => 'Salva';
	@override String get evaporation => 'Evaporazione';
	@override String get freezing_rain => 'Pioggia Gelata';
	@override String get uv_average => 'Moderato';
	@override String get reset_color => 'Ripristina predefiniti';
	@override String get metric => 'Metrico';
	@override String get overcast => 'Coperto';
	@override String get pressure => 'Pressione';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperiale';
	@override String get location => 'Posizione';
	@override String get error_occurred => 'Si è verificato un errore';
	@override String get validate_value => 'Si prega di inserire il valore';
	@override String get lon => 'Longitudine';
	@override String get wind => 'Vento';
	@override String get normal => 'Normale';
	@override String get dark => 'Scuro';
	@override String get settings => 'Imposta.';
	@override String get south => 'Sud';
	@override String get windgusts => 'Raffica';
	@override String get northwest => 'Nord-ovest';
	@override String get open_meteo => 'Dati da Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Pioggia';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Il valore deve essere compreso tra -180 e 180';
	@override String get description => 'Applicazione meteo con una previsione aggiornata per ogni ora, giorno e settimana per qualsiasi luogo.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Colori Dinamici';
	@override String get confirm => 'Salva';
	@override String get no_results => 'Nessun risultato';
	@override String get cities_load_error => 'Impossibile caricare le città';
	@override String get retry => 'Riprova';
	@override String get city_not_found => 'Città non trovata';
	@override String get air_quality => 'Qualità dell\'aria';
	@override String get aqi_standard => 'Standard AQI';
	@override String get aqi_european => 'AQI europeo';
	@override String get aqi_american => 'AQI americano';
	@override String get aqi_good => 'Buono';
	@override String get aqi_fair => 'Discreto';
	@override String get aqi_moderate => 'Moderato';
	@override String get aqi_poor => 'Scarso';
	@override String get aqi_very_poor => 'Molto scarso';
	@override String get aqi_extremely_poor => 'Estremamente scarso';
	@override String get aqi_unhealthy_sensitive => 'Insalubre per i sensibili';
	@override String get aqi_unhealthy => 'Insalubre';
	@override String get aqi_very_unhealthy => 'Molto insalubre';
	@override String get aqi_hazardous => 'Pericoloso';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Europeo';
	@override String get american => 'Americano';
	@override String get aqi_advice_good => 'Ottima aria per attività all\'aperto.';
	@override String get aqi_advice_fair => 'In generale va bene. Le persone sensibili possono limitare lo sforzo prolungato fuori.';
	@override String get aqi_advice_moderate => 'I gruppi sensibili dovrebbero ridurre il tempo all\'aperto.';
	@override String get aqi_advice_poor => 'Limita l\'attività all\'aperto, soprattutto se sei sensibile all\'inquinamento.';
	@override String get aqi_advice_very_poor => 'Evita sforzi prolungati all\'aperto. Possibili effetti sulla salute per tutti.';
	@override String get aqi_advice_extremely_poor => 'Resta in casa se possibile. L\'attività all\'aperto non è consigliata.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Inquinanti';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'Aggiornato';
	@override String get app_font => 'Carattere';
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

/// The flat map containing all translations for locale <it-IT>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsItIt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Non c\'è connessione Internet',
			'edit_city_hint' => 'Modifica informazioni città',
			'location_not_found' => 'Impossibile determinare la tua posizione',
			'mi' => 'mi',
			'next' => 'Avanti',
			'discard' => 'Annulla',
			'east' => 'Est',
			'time_end' => 'Ora di fine',
			'search_method' => 'Utilizza la ricerca o la geolocalizzazione',
			'hourly_variables' => 'Variabili meteorologiche orarie',
			'uv_index' => 'Indice UV',
			'clear_sky' => 'Sereno',
			'k_24' => '24 ore',
			'no_weather_card' => 'Aggiungi una città',
			'drizzle' => 'Pioggerella',
			'humidity' => 'Umidità',
			'telegram' => 'Telegram',
			'functions' => 'Funzioni',
			'cities' => 'Città',
			'southeast' => 'Sud-est',
			'validate_number' => 'Si prega di inserire il numero',
			'city' => 'Città',
			'uv_high' => 'Alto',
			'time' => 'Orario locale',
			'uv_low' => 'Basso',
			'name3' => 'Contattaci',
			'apparent_temperature_min' => 'Temperatura minima percepita',
			'direction' => 'Direzione',
			'heavy_rains' => 'Acquazzone',
			'apparent_temperature_max' => 'Temperatura massima percepita',
			'k_12' => '12 ore',
			'discord' => 'Discord',
			'discard_changes' => 'Sei sicuro di voler annullare le modifiche?',
			'notifications' => 'Notifiche',
			'mph' => 'mph',
			'west' => 'Ovest',
			'validate90' => 'Il valore deve essere compreso tra -90 e 90',
			'name2' => 'Design comodo',
			'feels' => 'Percepiti',
			'precipitation_probability' => 'Probabilità di precipitazione',
			'license' => 'Licenze',
			'widget_background' => 'Sfondo del widget',
			'large_element' => 'Visualizzazione grande elemento meteo',
			'unsaved_changes' => 'Modifiche non salvate',
			'drizzling_rain' => 'Pioggerella Gelata',
			'cloudy' => 'Nuvoloso',
			'widget' => 'Widget',
			'precipitation' => 'Precipitazione',
			'delete' => 'Elimina',
			'deleted_cache_store' => 'Cancellazione della cache',
			'map' => 'Mappa',
			'description3' => 'Se riscontri problemi, contattaci via email o nelle recensioni dell\'applicazione.',
			'north' => 'Nord',
			'measurements' => 'Sistema di misure',
			'start' => 'Clicca per iniziare',
			'settings_full' => 'Impostazioni',
			'high' => 'Alto',
			'daily_variables' => 'Variabili meteorologiche giornaliere',
			'low' => 'Basso',
			'on_inter' => 'Attiva la connessione Internet per avere dati meteorologici.',
			'thunderstorm' => 'Temporale',
			'version' => 'Versione dell\'applicazione',
			'project' => 'Progetto su',
			'amoled_theme' => 'Tema AMOLED',
			'deleted_card_weather_query' => 'Sei sicuro di voler rimuovere questa città?',
			'northeast' => 'Nord-est',
			'add_widget' => 'Aggiungi widget',
			'fog' => 'Nebbia',
			'description2' => 'Tutta la navigazione è progettata per interagire con l\'applicazione nel modo più comodo e veloce possibile.',
			'mm' => 'mm',
			'search_city' => 'Trova la tua città',
			'weather_more' => 'Previsioni del tempo per 12 giorni',
			'round_degree' => 'Arrotonda i gradi',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'Cerca o inserisci manualmente i dati della città',
			'validate_name' => 'Si prega di inserire il nome',
			'sunrise' => 'Alba',
			'km' => 'km',
			'district' => 'Regione',
			'southwest' => 'Sud-ovest',
			'degrees' => 'Gradi',
			'clear_cache_store' => 'Cancella cache',
			'skip' => 'Salta',
			'h_pa' => 'hPa',
			'appearance' => 'Aspetto',
			'time_start' => 'Ora di inizio',
			'ready' => 'Pronto',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Sei sicuro di voler cancellare la cache?',
			'widget_text' => 'Testo del widget',
			'support' => 'Supporto',
			'groups' => 'I nostri gruppi',
			'system' => 'Sistema',
			'sunset' => 'Tramonto',
			'dewpoint' => 'Punto di rugiada',
			'shortwave_radiation' => 'Radiazione a onde corte',
			'language' => 'Lingua',
			'hide_map' => 'Nascondi mappa',
			'cancel' => 'Annulla',
			'loading' => 'Caricamento...',
			'timeformat' => 'Formato ora',
			'lat' => 'Latitudine',
			'data' => 'Dati',
			'visibility' => 'Visibilità',
			'deleted_card_weather' => 'Rimozione della città',
			'celsius' => 'Celsius',
			'no_location' => 'Abilita il servizio di localizzazione per ottenere i dati meteo per la posizione corrente.',
			'create' => 'Creare',
			'edit' => 'Modifica',
			'search' => 'Cerca...',
			'uv_extreme' => 'Estremo',
			'light' => 'Chiaro',
			'cloudcover' => 'Copertura nuvolosa',
			'uv_very_high' => 'Molto alto',
			'snow' => 'Neve',
			'done' => 'Fatto',
			'theme' => 'Tema',
			'name' => 'Meteo',
			'time_range' => 'Frequenza (in ore)',
			'about_app' => 'Informazioni sull\'app',
			'save' => 'Salva',
			'evaporation' => 'Evaporazione',
			'freezing_rain' => 'Pioggia Gelata',
			'uv_average' => 'Moderato',
			'reset_color' => 'Ripristina predefiniti',
			'metric' => 'Metrico',
			'overcast' => 'Coperto',
			'pressure' => 'Pressione',
			'inch' => 'inch',
			'imperial' => 'Imperiale',
			'location' => 'Posizione',
			'error_occurred' => 'Si è verificato un errore',
			'validate_value' => 'Si prega di inserire il valore',
			'lon' => 'Longitudine',
			'wind' => 'Vento',
			'normal' => 'Normale',
			'dark' => 'Scuro',
			'settings' => 'Imposta.',
			'south' => 'Sud',
			'windgusts' => 'Raffica',
			'northwest' => 'Nord-ovest',
			'open_meteo' => 'Dati da Open-Meteo (CC-BY 4.0)',
			'rain' => 'Pioggia',
			'mm_hg' => 'mmHg',
			'validate180' => 'Il valore deve essere compreso tra -180 e 180',
			'description' => 'Applicazione meteo con una previsione aggiornata per ogni ora, giorno e settimana per qualsiasi luogo.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Colori Dinamici',
			'confirm' => 'Salva',
			'no_results' => 'Nessun risultato',
			'cities_load_error' => 'Impossibile caricare le città',
			'retry' => 'Riprova',
			'city_not_found' => 'Città non trovata',
			'air_quality' => 'Qualità dell\'aria',
			'aqi_standard' => 'Standard AQI',
			'aqi_european' => 'AQI europeo',
			'aqi_american' => 'AQI americano',
			'aqi_good' => 'Buono',
			'aqi_fair' => 'Discreto',
			'aqi_moderate' => 'Moderato',
			'aqi_poor' => 'Scarso',
			'aqi_very_poor' => 'Molto scarso',
			'aqi_extremely_poor' => 'Estremamente scarso',
			'aqi_unhealthy_sensitive' => 'Insalubre per i sensibili',
			'aqi_unhealthy' => 'Insalubre',
			'aqi_very_unhealthy' => 'Molto insalubre',
			'aqi_hazardous' => 'Pericoloso',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Europeo',
			'american' => 'Americano',
			'aqi_advice_good' => 'Ottima aria per attività all\'aperto.',
			'aqi_advice_fair' => 'In generale va bene. Le persone sensibili possono limitare lo sforzo prolungato fuori.',
			'aqi_advice_moderate' => 'I gruppi sensibili dovrebbero ridurre il tempo all\'aperto.',
			'aqi_advice_poor' => 'Limita l\'attività all\'aperto, soprattutto se sei sensibile all\'inquinamento.',
			'aqi_advice_very_poor' => 'Evita sforzi prolungati all\'aperto. Possibili effetti sulla salute per tutti.',
			'aqi_advice_extremely_poor' => 'Resta in casa se possibile. L\'attività all\'aperto non è consigliata.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Inquinanti',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'Aggiornato',
			'app_font' => 'Carattere',
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
