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
class TranslationsRoRo extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRoRo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.roRo,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ro-RO>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRoRo _root = this; // ignore: unused_field

	@override 
	TranslationsRoRo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRoRo(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Fără Internet';
	@override String get edit_city_hint => 'Editați informațiile orașului';
	@override String get location_not_found => 'Nu s-a putut determina locația dvs.';
	@override String get mi => 'mi';
	@override String get next => 'Următorul';
	@override String get discard => 'Renunță';
	@override String get east => 'Est';
	@override String get time_end => 'Ora de sfârșit';
	@override String get search_method => 'Folosiți căutarea sau geolocația';
	@override String get hourly_variables => 'Variabile meteorologice orare';
	@override String get uv_index => 'Index UV';
	@override String get clear_sky => 'Senin';
	@override String get k_24 => '24 ore';
	@override String get no_weather_card => 'Adaugă un oraș';
	@override String get drizzle => 'Burniță';
	@override String get humidity => 'Umiditate';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funcții';
	@override String get cities => 'Orașe';
	@override String get southeast => 'Sud-est';
	@override String get validate_number => 'Introdu un număr valid';
	@override String get city => 'Oraș';
	@override String get uv_high => 'Ridicat';
	@override String get time => 'Ora în oraș';
	@override String get uv_low => 'Scăzut';
	@override String get name3 => 'Contactați-ne';
	@override String get apparent_temperature_min => 'Temperatura minimă aparentă';
	@override String get direction => 'Direcție';
	@override String get heavy_rains => 'Ploaie torențială';
	@override String get apparent_temperature_max => 'Temperatura maximă aparentă';
	@override String get k_12 => '12 ore';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Sigur doriți să renunțați la modificări?';
	@override String get notifications => 'Notificări';
	@override String get mph => 'mph';
	@override String get west => 'Vest';
	@override String get validate90 => 'Valoarea trebuie să fie între -90 și 90';
	@override String get name2 => 'Design Convenabil';
	@override String get feels => 'Se simt';
	@override String get precipitation_probability => 'Probabilitatea precipitațiilor';
	@override String get license => 'Licențe';
	@override String get widget_background => 'Fundal widget';
	@override String get large_element => 'Afișare mare a vremii';
	@override String get unsaved_changes => 'Modificări nesalvate';
	@override String get drizzling_rain => 'Burniță înghețată';
	@override String get cloudy => 'Înnorat';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Precipitații';
	@override String get delete => 'Șterge';
	@override String get deleted_cache_store => 'Ștergerea cache-ului';
	@override String get map => 'Hartă';
	@override String get description3 => 'Dacă întâmpinați orice probleme, vă rugăm să ne contactați prin e-mail sau în recenziile aplicației.';
	@override String get north => 'Nord';
	@override String get measurements => 'Sistemul de măsuri';
	@override String get start => 'Începe';
	@override String get settings_full => 'Setări';
	@override String get high => 'Ridicat';
	@override String get daily_variables => 'Variabile meteorologice zilnice';
	@override String get low => 'Scăzut';
	@override String get on_inter => 'Pornește Internetul pentru a obține date meteorologice.';
	@override String get thunderstorm => 'Furtună';
	@override String get version => 'Versiunea aplicației';
	@override String get project => 'Proiectul pe';
	@override String get amoled_theme => 'Temă AMOLED';
	@override String get deleted_card_weather_query => 'Ești sigur că vrei să ștergi orașul?';
	@override String get northeast => 'Nord-est';
	@override String get add_widget => 'Adaugă widget';
	@override String get fog => 'Ceață';
	@override String get description2 => 'Toată navigarea este concepută pentru a interacționa cu aplicația în cel mai comod și rapid mod posibil.';
	@override String get mm => 'mm';
	@override String get search_city => 'Caută oraș';
	@override String get weather_more => 'Prognoza pe 12 zile';
	@override String get round_degree => 'Rotunjire grade';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Căutați sau introduceți manual datele orașului';
	@override String get validate_name => 'Introdu numele';
	@override String get sunrise => 'Răsărit';
	@override String get km => 'km';
	@override String get district => 'District';
	@override String get southwest => 'Sud-vest';
	@override String get degrees => 'Grade';
	@override String get clear_cache_store => 'Șterge cache-ul';
	@override String get skip => 'Omite';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Aspect';
	@override String get time_start => 'Ora de început';
	@override String get ready => 'Gata';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Ești sigur că vrei să ștergi cache-ul?';
	@override String get widget_text => 'Text widget';
	@override String get support => 'Suport';
	@override String get groups => 'Grupurile noastre';
	@override String get system => 'Sistem';
	@override String get sunset => 'Apus';
	@override String get dewpoint => 'Punct de rouă';
	@override String get shortwave_radiation => 'Radiație cu unde scurte';
	@override String get language => 'Limba';
	@override String get hide_map => 'Ascunde harta';
	@override String get cancel => 'Anulează';
	@override String get loading => 'Încărcare...';
	@override String get timeformat => 'Format orar';
	@override String get lat => 'Latitudine';
	@override String get data => 'Data';
	@override String get visibility => 'Vizibilitate';
	@override String get deleted_card_weather => 'Ștergerea orașului';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Activează serviciul de localizare pentru a obține date meteorologice pentru locația curentă.';
	@override String get create => 'Crează';
	@override String get edit => 'Editare';
	@override String get search => 'Caută...';
	@override String get uv_extreme => 'Extrem';
	@override String get light => 'Luminos';
	@override String get cloudcover => 'Acoperirea norilor';
	@override String get uv_very_high => 'Foarte ridicat';
	@override String get snow => 'Ninsoare';
	@override String get done => 'Gata';
	@override String get theme => 'Temă';
	@override String get name => 'Vremea';
	@override String get time_range => 'Frecvența (în ore)';
	@override String get about_app => 'Despre aplicație';
	@override String get save => 'Salvează';
	@override String get evaporation => 'Evapotranspirație';
	@override String get freezing_rain => 'Ploaie înghețată';
	@override String get uv_average => 'Moderat';
	@override String get reset_color => 'Resetează la valorile implicite';
	@override String get metric => 'Metric';
	@override String get overcast => 'Cer acoperit de nori';
	@override String get pressure => 'Presiune';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperial';
	@override String get location => 'Locație';
	@override String get error_occurred => 'A apărut o eroare';
	@override String get validate_value => 'Introdu o valoare';
	@override String get lon => 'Longitudine';
	@override String get wind => 'Vânt';
	@override String get normal => 'Normal';
	@override String get dark => 'Întunecat';
	@override String get settings => 'Set.';
	@override String get south => 'Sud';
	@override String get windgusts => 'Rafale de vânt';
	@override String get northwest => 'Nord-vest';
	@override String get open_meteo => 'Date de la Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Ploaie';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Valoarea trebuie să fie între -180 și 180';
	@override String get description => 'Aplicație meteo cu o prognoză actualizată pentru fiecare oră, zi și săptămână pentru orice loc.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Culori dinamice (Android 12+)';
	@override String get confirm => 'Salvează';
	@override String get no_results => 'Niciun rezultat';
	@override String get cities_load_error => 'Nu s-au putut încărca orașele';
	@override String get retry => 'Reîncearcă';
	@override String get city_not_found => 'Orașul nu a fost găsit';
	@override String get air_quality => 'Calitatea aerului';
	@override String get aqi_standard => 'Standard AQI';
	@override String get aqi_european => 'AQI european';
	@override String get aqi_american => 'AQI american';
	@override String get aqi_good => 'Bun';
	@override String get aqi_fair => 'Acceptabil';
	@override String get aqi_moderate => 'Moderat';
	@override String get aqi_poor => 'Slab';
	@override String get aqi_very_poor => 'Foarte slab';
	@override String get aqi_extremely_poor => 'Extrem de slab';
	@override String get aqi_unhealthy_sensitive => 'Nesănătos pentru sensibili';
	@override String get aqi_unhealthy => 'Nesănătos';
	@override String get aqi_very_unhealthy => 'Foarte nesănătos';
	@override String get aqi_hazardous => 'Periculos';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Europeană';
	@override String get american => 'Americană';
	@override String get aqi_advice_good => 'Aer bun pentru activități în aer liber.';
	@override String get aqi_advice_fair => 'În general e în regulă. Persoanele sensibile pot limita efortul prelungit afară.';
	@override String get aqi_advice_moderate => 'Grupurile sensibile ar trebui să reducă timpul petrecut afară.';
	@override String get aqi_advice_poor => 'Limitați activitatea afară, mai ales dacă sunteți sensibil la poluare.';
	@override String get aqi_advice_very_poor => 'Evitați efortul prelungit afară. Toți pot simți efecte asupra sănătății.';
	@override String get aqi_advice_extremely_poor => 'Rămâneți în interior dacă este posibil. Activitatea afară nu este recomandată.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Poluanți';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'Actualizat';
	@override String get app_font => 'Font';
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

/// The flat map containing all translations for locale <ro-RO>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRoRo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Fără Internet',
			'edit_city_hint' => 'Editați informațiile orașului',
			'location_not_found' => 'Nu s-a putut determina locația dvs.',
			'mi' => 'mi',
			'next' => 'Următorul',
			'discard' => 'Renunță',
			'east' => 'Est',
			'time_end' => 'Ora de sfârșit',
			'search_method' => 'Folosiți căutarea sau geolocația',
			'hourly_variables' => 'Variabile meteorologice orare',
			'uv_index' => 'Index UV',
			'clear_sky' => 'Senin',
			'k_24' => '24 ore',
			'no_weather_card' => 'Adaugă un oraș',
			'drizzle' => 'Burniță',
			'humidity' => 'Umiditate',
			'telegram' => 'Telegram',
			'functions' => 'Funcții',
			'cities' => 'Orașe',
			'southeast' => 'Sud-est',
			'validate_number' => 'Introdu un număr valid',
			'city' => 'Oraș',
			'uv_high' => 'Ridicat',
			'time' => 'Ora în oraș',
			'uv_low' => 'Scăzut',
			'name3' => 'Contactați-ne',
			'apparent_temperature_min' => 'Temperatura minimă aparentă',
			'direction' => 'Direcție',
			'heavy_rains' => 'Ploaie torențială',
			'apparent_temperature_max' => 'Temperatura maximă aparentă',
			'k_12' => '12 ore',
			'discord' => 'Discord',
			'discard_changes' => 'Sigur doriți să renunțați la modificări?',
			'notifications' => 'Notificări',
			'mph' => 'mph',
			'west' => 'Vest',
			'validate90' => 'Valoarea trebuie să fie între -90 și 90',
			'name2' => 'Design Convenabil',
			'feels' => 'Se simt',
			'precipitation_probability' => 'Probabilitatea precipitațiilor',
			'license' => 'Licențe',
			'widget_background' => 'Fundal widget',
			'large_element' => 'Afișare mare a vremii',
			'unsaved_changes' => 'Modificări nesalvate',
			'drizzling_rain' => 'Burniță înghețată',
			'cloudy' => 'Înnorat',
			'widget' => 'Widget',
			'precipitation' => 'Precipitații',
			'delete' => 'Șterge',
			'deleted_cache_store' => 'Ștergerea cache-ului',
			'map' => 'Hartă',
			'description3' => 'Dacă întâmpinați orice probleme, vă rugăm să ne contactați prin e-mail sau în recenziile aplicației.',
			'north' => 'Nord',
			'measurements' => 'Sistemul de măsuri',
			'start' => 'Începe',
			'settings_full' => 'Setări',
			'high' => 'Ridicat',
			'daily_variables' => 'Variabile meteorologice zilnice',
			'low' => 'Scăzut',
			'on_inter' => 'Pornește Internetul pentru a obține date meteorologice.',
			'thunderstorm' => 'Furtună',
			'version' => 'Versiunea aplicației',
			'project' => 'Proiectul pe',
			'amoled_theme' => 'Temă AMOLED',
			'deleted_card_weather_query' => 'Ești sigur că vrei să ștergi orașul?',
			'northeast' => 'Nord-est',
			'add_widget' => 'Adaugă widget',
			'fog' => 'Ceață',
			'description2' => 'Toată navigarea este concepută pentru a interacționa cu aplicația în cel mai comod și rapid mod posibil.',
			'mm' => 'mm',
			'search_city' => 'Caută oraș',
			'weather_more' => 'Prognoza pe 12 zile',
			'round_degree' => 'Rotunjire grade',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Căutați sau introduceți manual datele orașului',
			'validate_name' => 'Introdu numele',
			'sunrise' => 'Răsărit',
			'km' => 'km',
			'district' => 'District',
			'southwest' => 'Sud-vest',
			'degrees' => 'Grade',
			'clear_cache_store' => 'Șterge cache-ul',
			'skip' => 'Omite',
			'h_pa' => 'hPa',
			'appearance' => 'Aspect',
			'time_start' => 'Ora de început',
			'ready' => 'Gata',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Ești sigur că vrei să ștergi cache-ul?',
			'widget_text' => 'Text widget',
			'support' => 'Suport',
			'groups' => 'Grupurile noastre',
			'system' => 'Sistem',
			'sunset' => 'Apus',
			'dewpoint' => 'Punct de rouă',
			'shortwave_radiation' => 'Radiație cu unde scurte',
			'language' => 'Limba',
			'hide_map' => 'Ascunde harta',
			'cancel' => 'Anulează',
			'loading' => 'Încărcare...',
			'timeformat' => 'Format orar',
			'lat' => 'Latitudine',
			'data' => 'Data',
			'visibility' => 'Vizibilitate',
			'deleted_card_weather' => 'Ștergerea orașului',
			'celsius' => 'Celsius',
			'no_location' => 'Activează serviciul de localizare pentru a obține date meteorologice pentru locația curentă.',
			'create' => 'Crează',
			'edit' => 'Editare',
			'search' => 'Caută...',
			'uv_extreme' => 'Extrem',
			'light' => 'Luminos',
			'cloudcover' => 'Acoperirea norilor',
			'uv_very_high' => 'Foarte ridicat',
			'snow' => 'Ninsoare',
			'done' => 'Gata',
			'theme' => 'Temă',
			'name' => 'Vremea',
			'time_range' => 'Frecvența (în ore)',
			'about_app' => 'Despre aplicație',
			'save' => 'Salvează',
			'evaporation' => 'Evapotranspirație',
			'freezing_rain' => 'Ploaie înghețată',
			'uv_average' => 'Moderat',
			'reset_color' => 'Resetează la valorile implicite',
			'metric' => 'Metric',
			'overcast' => 'Cer acoperit de nori',
			'pressure' => 'Presiune',
			'inch' => 'inch',
			'imperial' => 'Imperial',
			'location' => 'Locație',
			'error_occurred' => 'A apărut o eroare',
			'validate_value' => 'Introdu o valoare',
			'lon' => 'Longitudine',
			'wind' => 'Vânt',
			'normal' => 'Normal',
			'dark' => 'Întunecat',
			'settings' => 'Set.',
			'south' => 'Sud',
			'windgusts' => 'Rafale de vânt',
			'northwest' => 'Nord-vest',
			'open_meteo' => 'Date de la Open-Meteo (CC-BY 4.0)',
			'rain' => 'Ploaie',
			'mm_hg' => 'mmHg',
			'validate180' => 'Valoarea trebuie să fie între -180 și 180',
			'description' => 'Aplicație meteo cu o prognoză actualizată pentru fiecare oră, zi și săptămână pentru orice loc.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Culori dinamice (Android 12+)',
			'confirm' => 'Salvează',
			'no_results' => 'Niciun rezultat',
			'cities_load_error' => 'Nu s-au putut încărca orașele',
			'retry' => 'Reîncearcă',
			'city_not_found' => 'Orașul nu a fost găsit',
			'air_quality' => 'Calitatea aerului',
			'aqi_standard' => 'Standard AQI',
			'aqi_european' => 'AQI european',
			'aqi_american' => 'AQI american',
			'aqi_good' => 'Bun',
			'aqi_fair' => 'Acceptabil',
			'aqi_moderate' => 'Moderat',
			'aqi_poor' => 'Slab',
			'aqi_very_poor' => 'Foarte slab',
			'aqi_extremely_poor' => 'Extrem de slab',
			'aqi_unhealthy_sensitive' => 'Nesănătos pentru sensibili',
			'aqi_unhealthy' => 'Nesănătos',
			'aqi_very_unhealthy' => 'Foarte nesănătos',
			'aqi_hazardous' => 'Periculos',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Europeană',
			'american' => 'Americană',
			'aqi_advice_good' => 'Aer bun pentru activități în aer liber.',
			'aqi_advice_fair' => 'În general e în regulă. Persoanele sensibile pot limita efortul prelungit afară.',
			'aqi_advice_moderate' => 'Grupurile sensibile ar trebui să reducă timpul petrecut afară.',
			'aqi_advice_poor' => 'Limitați activitatea afară, mai ales dacă sunteți sensibil la poluare.',
			'aqi_advice_very_poor' => 'Evitați efortul prelungit afară. Toți pot simți efecte asupra sănătății.',
			'aqi_advice_extremely_poor' => 'Rămâneți în interior dacă este posibil. Activitatea afară nu este recomandată.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Poluanți',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'Actualizat',
			'app_font' => 'Font',
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
