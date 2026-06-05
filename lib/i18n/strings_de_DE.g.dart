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
class TranslationsDeDe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDeDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.deDe,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de-DE>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDeDe _root = this; // ignore: unused_field

	@override 
	TranslationsDeDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDeDe(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Keine Internetverbindung';
	@override String get edit_city_hint => 'Stadtinformationen bearbeiten';
	@override String get location_not_found => 'Ihr Standort konnte nicht ermittelt werden';
	@override String get mi => 'mi';
	@override String get next => 'Weiter';
	@override String get discard => 'Verwerfen';
	@override String get east => 'Osten';
	@override String get time_end => 'Endzeit';
	@override String get search_method => 'Verwenden Sie die Suche oder die Geolokalisierung';
	@override String get hourly_variables => 'Stündliche Wettervariablen';
	@override String get uv_index => 'UV-index';
	@override String get clear_sky => 'Klarer Himmel';
	@override String get k_24 => '24-stunden';
	@override String get no_weather_card => 'Füge eine Stadt hinzu';
	@override String get drizzle => 'Nieselregen';
	@override String get humidity => 'Luftfeuchtigkeit';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funktionen';
	@override String get cities => 'Städte';
	@override String get southeast => 'Südosten';
	@override String get validate_number => 'Bitte geben Sie eine Nummer ein';
	@override String get city => 'Stadt';
	@override String get uv_high => 'Hoch';
	@override String get time => 'Ortszeit';
	@override String get uv_low => 'Niedrig';
	@override String get name3 => 'Kontaktiere uns';
	@override String get apparent_temperature_min => 'Minimale gefühlte Temperatur';
	@override String get direction => 'Richtung';
	@override String get heavy_rains => 'Regenschauer';
	@override String get apparent_temperature_max => 'Maximale gefühlte Temperatur';
	@override String get k_12 => '12-stunden';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Möchten Sie Ihre Änderungen wirklich verwerfen?';
	@override String get notifications => 'Benachrichtigungen';
	@override String get mph => 'mph';
	@override String get west => 'Westen';
	@override String get validate90 => 'Der Wert muss zwischen -90 und 90 liegen';
	@override String get name2 => 'Bequemes Design';
	@override String get feels => 'Gefühlt';
	@override String get precipitation_probability => 'Niederschlagswahrscheinlichkeit';
	@override String get license => 'Lizenzen';
	@override String get widget_background => 'Widget-Hintergrund';
	@override String get large_element => 'Große Wetteranzeige';
	@override String get unsaved_changes => 'Ungespeicherte Änderungen';
	@override String get drizzling_rain => 'Gefrierender Nieselregen';
	@override String get cloudy => 'Bewölkt';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Niederschlag';
	@override String get delete => 'Löschen';
	@override String get deleted_cache_store => 'Cache wird geleert';
	@override String get map => 'Karte';
	@override String get description3 => 'Wenn Sie auf Probleme stoßen, kontaktieren Sie uns bitte per E-Mail oder in den Bewertungen der Anwendung.';
	@override String get north => 'Norden';
	@override String get measurements => 'Einheitensystem';
	@override String get start => 'Los gehts';
	@override String get settings_full => 'Einstellungen';
	@override String get high => 'Hoch';
	@override String get daily_variables => 'Tägliche Wettervariablen';
	@override String get low => 'Niedrig';
	@override String get on_inter => 'Schalte das Internet ein, um meteorologische Daten zu erhalten.';
	@override String get thunderstorm => 'Gewitter';
	@override String get version => 'Anwendungsversion';
	@override String get project => 'Projekt auf';
	@override String get amoled_theme => 'AMOLED-thema';
	@override String get deleted_card_weather_query => 'Sind Sie sicher, dass Sie die Stadt löschen möchten?';
	@override String get northeast => 'Nordosten';
	@override String get add_widget => 'Widget hinzufügen';
	@override String get fog => 'Nebel';
	@override String get description2 => 'Die gesamte Navigation ist so gestaltet, dass die Interaktion mit der Anwendung so bequem und schnell wie möglich erfolgt.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Keine daten';
	@override String get search_city => 'Finde deine Stadt';
	@override String get weather_more => '12-Tage-Wettervorhersage';
	@override String get round_degree => 'Grad runden';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'Stadtinformationen suchen oder manuell eingeben';
	@override String get validate_name => 'Bitte geben Sie den Namen ein';
	@override String get sunrise => 'Sonnenaufgang';
	@override String get km => 'km';
	@override String get district => 'Bezirk';
	@override String get southwest => 'Südwesten';
	@override String get degrees => 'Grade';
	@override String get clear_cache_store => 'Cache leeren';
	@override String get skip => 'Überspringen';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Erscheinungsbild';
	@override String get time_start => 'Startzeit';
	@override String get ready => 'Fertig';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Sind Sie sicher, dass Sie den Cache leeren möchten?';
	@override String get widget_text => 'Widget-Text';
	@override String get support => 'Unterstützung';
	@override String get groups => 'Unsere gruppen';
	@override String get system => 'System';
	@override String get sunset => 'Sonnenuntergang';
	@override String get dewpoint => 'Taupunkt';
	@override String get shortwave_radiation => 'Kurzwellenstrahlung';
	@override String get language => 'Sprache';
	@override String get hide_map => 'Karte ausblenden';
	@override String get cancel => 'Abbrechen';
	@override String get loading => 'Lädt...';
	@override String get timeformat => 'Zeitformat';
	@override String get lat => 'Breitengrad';
	@override String get data => 'Daten';
	@override String get visibility => 'Sichtweite';
	@override String get deleted_card_weather => 'Stadt löschen';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Aktiviere den Standortdienst, um Wetterdaten für den aktuellen Standort zu erhalten.';
	@override String get create => 'Erstellen';
	@override String get edit => 'Bearbeiten';
	@override String get search => 'Suchen...';
	@override String get uv_extreme => 'Extrem';
	@override String get light => 'Hell';
	@override String get cloudcover => 'Wolkenbedeckung';
	@override String get uv_very_high => 'Sehr hoch';
	@override String get snow => 'Schnee';
	@override String get done => 'Fertig';
	@override String get theme => 'Thema';
	@override String get name => 'Wetter';
	@override String get time_range => 'Häufigkeit (in Stunden)';
	@override String get about_app => 'Über die App';
	@override String get save => 'Speichern';
	@override String get evaporation => 'Verdunstung';
	@override String get freezing_rain => 'Gefrierender Regen';
	@override String get uv_average => 'Mäßig';
	@override String get reset_color => 'Auf Standard zurücksetzen';
	@override String get metric => 'Metrisch';
	@override String get overcast => 'Bedeckt';
	@override String get pressure => 'Druck';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperial';
	@override String get location => 'Standort';
	@override String get error_occurred => 'Ein Fehler ist aufgetreten';
	@override String get validate_value => 'Bitte geben Sie einen Wert ein';
	@override String get lon => 'Längengrad';
	@override String get wind => 'Wind';
	@override String get normal => 'Normal';
	@override String get dark => 'Dunkel';
	@override String get settings => 'Einstellungen';
	@override String get south => 'Süden';
	@override String get windgusts => 'Böe';
	@override String get northwest => 'Nordwesten';
	@override String get open_meteo => 'Daten von Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Regen';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Der Wert muss zwischen -180 und 180 liegen';
	@override String get description => 'Wetteranwendung mit einer aktuellen Prognose für jede Stunde, Tag und Woche für jeden Ort.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dynamische Farben';
	@override String get confirm => 'Speichern';
	@override String get no_results => 'Keine Ergebnisse';
	@override String get cities_load_error => 'Städte konnten nicht geladen werden';
	@override String get retry => 'Erneut versuchen';
}

/// The flat map containing all translations for locale <de-DE>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDeDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Keine Internetverbindung',
			'edit_city_hint' => 'Stadtinformationen bearbeiten',
			'location_not_found' => 'Ihr Standort konnte nicht ermittelt werden',
			'mi' => 'mi',
			'next' => 'Weiter',
			'discard' => 'Verwerfen',
			'east' => 'Osten',
			'time_end' => 'Endzeit',
			'search_method' => 'Verwenden Sie die Suche oder die Geolokalisierung',
			'hourly_variables' => 'Stündliche Wettervariablen',
			'uv_index' => 'UV-index',
			'clear_sky' => 'Klarer Himmel',
			'k_24' => '24-stunden',
			'no_weather_card' => 'Füge eine Stadt hinzu',
			'drizzle' => 'Nieselregen',
			'humidity' => 'Luftfeuchtigkeit',
			'telegram' => 'Telegram',
			'functions' => 'Funktionen',
			'cities' => 'Städte',
			'southeast' => 'Südosten',
			'validate_number' => 'Bitte geben Sie eine Nummer ein',
			'city' => 'Stadt',
			'uv_high' => 'Hoch',
			'time' => 'Ortszeit',
			'uv_low' => 'Niedrig',
			'name3' => 'Kontaktiere uns',
			'apparent_temperature_min' => 'Minimale gefühlte Temperatur',
			'direction' => 'Richtung',
			'heavy_rains' => 'Regenschauer',
			'apparent_temperature_max' => 'Maximale gefühlte Temperatur',
			'k_12' => '12-stunden',
			'discord' => 'Discord',
			'discard_changes' => 'Möchten Sie Ihre Änderungen wirklich verwerfen?',
			'notifications' => 'Benachrichtigungen',
			'mph' => 'mph',
			'west' => 'Westen',
			'validate90' => 'Der Wert muss zwischen -90 und 90 liegen',
			'name2' => 'Bequemes Design',
			'feels' => 'Gefühlt',
			'precipitation_probability' => 'Niederschlagswahrscheinlichkeit',
			'license' => 'Lizenzen',
			'widget_background' => 'Widget-Hintergrund',
			'large_element' => 'Große Wetteranzeige',
			'unsaved_changes' => 'Ungespeicherte Änderungen',
			'drizzling_rain' => 'Gefrierender Nieselregen',
			'cloudy' => 'Bewölkt',
			'widget' => 'Widget',
			'precipitation' => 'Niederschlag',
			'delete' => 'Löschen',
			'deleted_cache_store' => 'Cache wird geleert',
			'map' => 'Karte',
			'description3' => 'Wenn Sie auf Probleme stoßen, kontaktieren Sie uns bitte per E-Mail oder in den Bewertungen der Anwendung.',
			'north' => 'Norden',
			'measurements' => 'Einheitensystem',
			'start' => 'Los gehts',
			'settings_full' => 'Einstellungen',
			'high' => 'Hoch',
			'daily_variables' => 'Tägliche Wettervariablen',
			'low' => 'Niedrig',
			'on_inter' => 'Schalte das Internet ein, um meteorologische Daten zu erhalten.',
			'thunderstorm' => 'Gewitter',
			'version' => 'Anwendungsversion',
			'project' => 'Projekt auf',
			'amoled_theme' => 'AMOLED-thema',
			'deleted_card_weather_query' => 'Sind Sie sicher, dass Sie die Stadt löschen möchten?',
			'northeast' => 'Nordosten',
			'add_widget' => 'Widget hinzufügen',
			'fog' => 'Nebel',
			'description2' => 'Die gesamte Navigation ist so gestaltet, dass die Interaktion mit der Anwendung so bequem und schnell wie möglich erfolgt.',
			'mm' => 'mm',
			'no_desc_data' => 'Keine daten',
			'search_city' => 'Finde deine Stadt',
			'weather_more' => '12-Tage-Wettervorhersage',
			'round_degree' => 'Grad runden',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'Stadtinformationen suchen oder manuell eingeben',
			'validate_name' => 'Bitte geben Sie den Namen ein',
			'sunrise' => 'Sonnenaufgang',
			'km' => 'km',
			'district' => 'Bezirk',
			'southwest' => 'Südwesten',
			'degrees' => 'Grade',
			'clear_cache_store' => 'Cache leeren',
			'skip' => 'Überspringen',
			'h_pa' => 'hPa',
			'appearance' => 'Erscheinungsbild',
			'time_start' => 'Startzeit',
			'ready' => 'Fertig',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Sind Sie sicher, dass Sie den Cache leeren möchten?',
			'widget_text' => 'Widget-Text',
			'support' => 'Unterstützung',
			'groups' => 'Unsere gruppen',
			'system' => 'System',
			'sunset' => 'Sonnenuntergang',
			'dewpoint' => 'Taupunkt',
			'shortwave_radiation' => 'Kurzwellenstrahlung',
			'language' => 'Sprache',
			'hide_map' => 'Karte ausblenden',
			'cancel' => 'Abbrechen',
			'loading' => 'Lädt...',
			'timeformat' => 'Zeitformat',
			'lat' => 'Breitengrad',
			'data' => 'Daten',
			'visibility' => 'Sichtweite',
			'deleted_card_weather' => 'Stadt löschen',
			'celsius' => 'Celsius',
			'no_location' => 'Aktiviere den Standortdienst, um Wetterdaten für den aktuellen Standort zu erhalten.',
			'create' => 'Erstellen',
			'edit' => 'Bearbeiten',
			'search' => 'Suchen...',
			'uv_extreme' => 'Extrem',
			'light' => 'Hell',
			'cloudcover' => 'Wolkenbedeckung',
			'uv_very_high' => 'Sehr hoch',
			'snow' => 'Schnee',
			'done' => 'Fertig',
			'theme' => 'Thema',
			'name' => 'Wetter',
			'time_range' => 'Häufigkeit (in Stunden)',
			'about_app' => 'Über die App',
			'save' => 'Speichern',
			'evaporation' => 'Verdunstung',
			'freezing_rain' => 'Gefrierender Regen',
			'uv_average' => 'Mäßig',
			'reset_color' => 'Auf Standard zurücksetzen',
			'metric' => 'Metrisch',
			'overcast' => 'Bedeckt',
			'pressure' => 'Druck',
			'inch' => 'inch',
			'imperial' => 'Imperial',
			'location' => 'Standort',
			'error_occurred' => 'Ein Fehler ist aufgetreten',
			'validate_value' => 'Bitte geben Sie einen Wert ein',
			'lon' => 'Längengrad',
			'wind' => 'Wind',
			'normal' => 'Normal',
			'dark' => 'Dunkel',
			'settings' => 'Einstellungen',
			'south' => 'Süden',
			'windgusts' => 'Böe',
			'northwest' => 'Nordwesten',
			'open_meteo' => 'Daten von Open-Meteo (CC-BY 4.0)',
			'rain' => 'Regen',
			'mm_hg' => 'mmHg',
			'validate180' => 'Der Wert muss zwischen -180 und 180 liegen',
			'description' => 'Wetteranwendung mit einer aktuellen Prognose für jede Stunde, Tag und Woche für jeden Ort.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dynamische Farben',
			'confirm' => 'Speichern',
			'no_results' => 'Keine Ergebnisse',
			'cities_load_error' => 'Städte konnten nicht geladen werden',
			'retry' => 'Erneut versuchen',
			_ => null,
		};
	}
}
