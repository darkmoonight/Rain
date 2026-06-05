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
class TranslationsEsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.esEs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es-ES>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Sin conexión a Internet';
	@override String get edit_city_hint => 'Editar información de la ciudad';
	@override String get location_not_found => 'No se pudo determinar tu ubicación';
	@override String get mi => 'mi';
	@override String get next => 'Siguiente';
	@override String get discard => 'Descartar';
	@override String get east => 'Este';
	@override String get time_end => 'Hora de finalización';
	@override String get search_method => 'Usa la búsqueda o la geolocalización';
	@override String get hourly_variables => 'Variables meteorológicas horarias';
	@override String get uv_index => 'UV-índice';
	@override String get clear_sky => 'Cielo despejado';
	@override String get k_24 => '24 horas';
	@override String get no_weather_card => 'Añadir una ciudad';
	@override String get drizzle => 'Llovizna';
	@override String get humidity => 'Humedad';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funciones';
	@override String get cities => 'Ciudades';
	@override String get southeast => 'Sureste';
	@override String get validate_number => 'Por favor, introduce un número válido';
	@override String get city => 'Ciudad';
	@override String get uv_high => 'Alto';
	@override String get time => 'Hora en la ciudad';
	@override String get uv_low => 'Bajo';
	@override String get name3 => 'Contáctenos';
	@override String get apparent_temperature_min => 'Temperatura aparente mínima';
	@override String get direction => 'Dirección';
	@override String get heavy_rains => 'Chubasco intenso';
	@override String get apparent_temperature_max => 'Temperatura aparente máxima';
	@override String get k_12 => '12 horas';
	@override String get discord => 'Discord';
	@override String get discard_changes => '¿Estás seguro de que deseas descartar tus cambios?';
	@override String get notifications => 'Notificaciones';
	@override String get mph => 'mph';
	@override String get west => 'Oeste';
	@override String get validate90 => 'El valor tiene que estar entre -90 y 90';
	@override String get name2 => 'Diseño Conveniente';
	@override String get feels => 'Sensación térmica';
	@override String get precipitation_probability => 'Probabilidad de precipitación';
	@override String get license => 'Licencias';
	@override String get widget_background => 'Fondo del widget';
	@override String get large_element => 'Visualización grande del clima';
	@override String get unsaved_changes => 'Cambios sin guardar';
	@override String get drizzling_rain => 'Llovizna helada';
	@override String get cloudy => 'Nuboso';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Precipitación';
	@override String get delete => 'Eliminar';
	@override String get deleted_cache_store => 'Borrando caché';
	@override String get map => 'Mapa';
	@override String get description3 => 'Si encuentra algún problema, contáctenos por correo electrónico o en las reseñas de la aplicación.';
	@override String get north => 'Norte';
	@override String get measurements => 'Sistema de medidas';
	@override String get start => 'Empezar';
	@override String get settings_full => 'Configuración';
	@override String get high => 'Alto';
	@override String get daily_variables => 'Variables meteorológicas diarias';
	@override String get low => 'Bajo';
	@override String get on_inter => 'Conéctate a Internet para obtener información meteorológica.';
	@override String get thunderstorm => 'Tormenta';
	@override String get version => 'Versión de la aplicación';
	@override String get project => 'Proyecto en';
	@override String get amoled_theme => 'AMOLED-tema';
	@override String get deleted_card_weather_query => '¿Estás seguro de que quieres eliminar la ciudad?';
	@override String get northeast => 'Noreste';
	@override String get add_widget => 'Agregar widget';
	@override String get fog => 'Niebla';
	@override String get description2 => 'Toda la navegación está diseñada para interactuar con la aplicación de la manera más cómoda y rápida posible.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Sin datos';
	@override String get search_city => 'Busca tu ciudad';
	@override String get weather_more => 'Pronóstico del tiempo para 12 días';
	@override String get round_degree => 'Redondear grados';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'Busca o ingresa datos de la ciudad manualmente';
	@override String get validate_name => 'Por favor, introduce un nombre';
	@override String get sunrise => 'Amanecer';
	@override String get km => 'km';
	@override String get district => 'Distrito';
	@override String get southwest => 'Suroeste';
	@override String get degrees => 'Grados';
	@override String get clear_cache_store => 'Borrar caché';
	@override String get skip => 'Omitir';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Apariencia';
	@override String get time_start => 'Hora de inicio';
	@override String get ready => 'Listo';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => '¿Estás seguro de que quieres borrar el caché?';
	@override String get widget_text => 'Texto del widget';
	@override String get support => 'Soporte';
	@override String get groups => 'Nuestros grupos';
	@override String get system => 'Sistema';
	@override String get sunset => 'Atardecer';
	@override String get dewpoint => 'Punto de rocío';
	@override String get shortwave_radiation => 'Radiación de onda corta';
	@override String get language => 'Idioma';
	@override String get hide_map => 'Ocultar mapa';
	@override String get cancel => 'Cancelar';
	@override String get loading => 'Cargando...';
	@override String get timeformat => 'Formato de hora';
	@override String get lat => 'Latitud';
	@override String get data => 'Datos';
	@override String get visibility => 'Visibilidad';
	@override String get deleted_card_weather => 'Eliminar una ciudad';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Activa la localización para obtener información meteorológica para tu ubicación actual.';
	@override String get create => 'Crear';
	@override String get edit => 'Editar';
	@override String get search => 'Buscar...';
	@override String get uv_extreme => 'Extremo';
	@override String get light => 'Claro';
	@override String get cloudcover => 'Cobertura de nubes';
	@override String get uv_very_high => 'Muy alto';
	@override String get snow => 'Nieve';
	@override String get done => 'Hecho';
	@override String get theme => 'Tema';
	@override String get name => 'Tiempo';
	@override String get time_range => 'Frecuencia (en horas)';
	@override String get about_app => 'Acerca de la app';
	@override String get save => 'Guardar';
	@override String get evaporation => 'Evaporación';
	@override String get freezing_rain => 'Lluvia helada';
	@override String get uv_average => 'Moderado';
	@override String get reset_color => 'Restablecer valores predeterminados';
	@override String get metric => 'Métrico';
	@override String get overcast => 'Cubierto de nubes';
	@override String get pressure => 'Presión';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperial';
	@override String get location => 'Ubicación';
	@override String get error_occurred => 'Se produjo un error';
	@override String get validate_value => 'Por favor, introduce un valor';
	@override String get lon => 'Longitud';
	@override String get wind => 'Viento';
	@override String get normal => 'Normal';
	@override String get dark => 'Oscuro';
	@override String get settings => 'Ajustes';
	@override String get south => 'Sur';
	@override String get windgusts => 'Ráfagas';
	@override String get northwest => 'Noroeste';
	@override String get open_meteo => 'Datos de Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Lluvia';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'El valor tiene que estar entre -180 y 180';
	@override String get description => 'Aplicación meteorológica con un pronóstico actualizado para cada hora, día y semana para cualquier lugar.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Colores Dinámicos';
	@override String get confirm => 'Guardar';
	@override String get no_results => 'Sin resultados';
	@override String get cities_load_error => 'No se pudieron cargar las ciudades';
	@override String get retry => 'Reintentar';
}

/// The flat map containing all translations for locale <es-ES>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Sin conexión a Internet',
			'edit_city_hint' => 'Editar información de la ciudad',
			'location_not_found' => 'No se pudo determinar tu ubicación',
			'mi' => 'mi',
			'next' => 'Siguiente',
			'discard' => 'Descartar',
			'east' => 'Este',
			'time_end' => 'Hora de finalización',
			'search_method' => 'Usa la búsqueda o la geolocalización',
			'hourly_variables' => 'Variables meteorológicas horarias',
			'uv_index' => 'UV-índice',
			'clear_sky' => 'Cielo despejado',
			'k_24' => '24 horas',
			'no_weather_card' => 'Añadir una ciudad',
			'drizzle' => 'Llovizna',
			'humidity' => 'Humedad',
			'telegram' => 'Telegram',
			'functions' => 'Funciones',
			'cities' => 'Ciudades',
			'southeast' => 'Sureste',
			'validate_number' => 'Por favor, introduce un número válido',
			'city' => 'Ciudad',
			'uv_high' => 'Alto',
			'time' => 'Hora en la ciudad',
			'uv_low' => 'Bajo',
			'name3' => 'Contáctenos',
			'apparent_temperature_min' => 'Temperatura aparente mínima',
			'direction' => 'Dirección',
			'heavy_rains' => 'Chubasco intenso',
			'apparent_temperature_max' => 'Temperatura aparente máxima',
			'k_12' => '12 horas',
			'discord' => 'Discord',
			'discard_changes' => '¿Estás seguro de que deseas descartar tus cambios?',
			'notifications' => 'Notificaciones',
			'mph' => 'mph',
			'west' => 'Oeste',
			'validate90' => 'El valor tiene que estar entre -90 y 90',
			'name2' => 'Diseño Conveniente',
			'feels' => 'Sensación térmica',
			'precipitation_probability' => 'Probabilidad de precipitación',
			'license' => 'Licencias',
			'widget_background' => 'Fondo del widget',
			'large_element' => 'Visualización grande del clima',
			'unsaved_changes' => 'Cambios sin guardar',
			'drizzling_rain' => 'Llovizna helada',
			'cloudy' => 'Nuboso',
			'widget' => 'Widget',
			'precipitation' => 'Precipitación',
			'delete' => 'Eliminar',
			'deleted_cache_store' => 'Borrando caché',
			'map' => 'Mapa',
			'description3' => 'Si encuentra algún problema, contáctenos por correo electrónico o en las reseñas de la aplicación.',
			'north' => 'Norte',
			'measurements' => 'Sistema de medidas',
			'start' => 'Empezar',
			'settings_full' => 'Configuración',
			'high' => 'Alto',
			'daily_variables' => 'Variables meteorológicas diarias',
			'low' => 'Bajo',
			'on_inter' => 'Conéctate a Internet para obtener información meteorológica.',
			'thunderstorm' => 'Tormenta',
			'version' => 'Versión de la aplicación',
			'project' => 'Proyecto en',
			'amoled_theme' => 'AMOLED-tema',
			'deleted_card_weather_query' => '¿Estás seguro de que quieres eliminar la ciudad?',
			'northeast' => 'Noreste',
			'add_widget' => 'Agregar widget',
			'fog' => 'Niebla',
			'description2' => 'Toda la navegación está diseñada para interactuar con la aplicación de la manera más cómoda y rápida posible.',
			'mm' => 'mm',
			'no_desc_data' => 'Sin datos',
			'search_city' => 'Busca tu ciudad',
			'weather_more' => 'Pronóstico del tiempo para 12 días',
			'round_degree' => 'Redondear grados',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'Busca o ingresa datos de la ciudad manualmente',
			'validate_name' => 'Por favor, introduce un nombre',
			'sunrise' => 'Amanecer',
			'km' => 'km',
			'district' => 'Distrito',
			'southwest' => 'Suroeste',
			'degrees' => 'Grados',
			'clear_cache_store' => 'Borrar caché',
			'skip' => 'Omitir',
			'h_pa' => 'hPa',
			'appearance' => 'Apariencia',
			'time_start' => 'Hora de inicio',
			'ready' => 'Listo',
			'kph' => 'km/h',
			'deleted_cache_store_query' => '¿Estás seguro de que quieres borrar el caché?',
			'widget_text' => 'Texto del widget',
			'support' => 'Soporte',
			'groups' => 'Nuestros grupos',
			'system' => 'Sistema',
			'sunset' => 'Atardecer',
			'dewpoint' => 'Punto de rocío',
			'shortwave_radiation' => 'Radiación de onda corta',
			'language' => 'Idioma',
			'hide_map' => 'Ocultar mapa',
			'cancel' => 'Cancelar',
			'loading' => 'Cargando...',
			'timeformat' => 'Formato de hora',
			'lat' => 'Latitud',
			'data' => 'Datos',
			'visibility' => 'Visibilidad',
			'deleted_card_weather' => 'Eliminar una ciudad',
			'celsius' => 'Celsius',
			'no_location' => 'Activa la localización para obtener información meteorológica para tu ubicación actual.',
			'create' => 'Crear',
			'edit' => 'Editar',
			'search' => 'Buscar...',
			'uv_extreme' => 'Extremo',
			'light' => 'Claro',
			'cloudcover' => 'Cobertura de nubes',
			'uv_very_high' => 'Muy alto',
			'snow' => 'Nieve',
			'done' => 'Hecho',
			'theme' => 'Tema',
			'name' => 'Tiempo',
			'time_range' => 'Frecuencia (en horas)',
			'about_app' => 'Acerca de la app',
			'save' => 'Guardar',
			'evaporation' => 'Evaporación',
			'freezing_rain' => 'Lluvia helada',
			'uv_average' => 'Moderado',
			'reset_color' => 'Restablecer valores predeterminados',
			'metric' => 'Métrico',
			'overcast' => 'Cubierto de nubes',
			'pressure' => 'Presión',
			'inch' => 'inch',
			'imperial' => 'Imperial',
			'location' => 'Ubicación',
			'error_occurred' => 'Se produjo un error',
			'validate_value' => 'Por favor, introduce un valor',
			'lon' => 'Longitud',
			'wind' => 'Viento',
			'normal' => 'Normal',
			'dark' => 'Oscuro',
			'settings' => 'Ajustes',
			'south' => 'Sur',
			'windgusts' => 'Ráfagas',
			'northwest' => 'Noroeste',
			'open_meteo' => 'Datos de Open-Meteo (CC-BY 4.0)',
			'rain' => 'Lluvia',
			'mm_hg' => 'mmHg',
			'validate180' => 'El valor tiene que estar entre -180 y 180',
			'description' => 'Aplicación meteorológica con un pronóstico actualizado para cada hora, día y semana para cualquier lugar.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Colores Dinámicos',
			'confirm' => 'Guardar',
			'no_results' => 'Sin resultados',
			'cities_load_error' => 'No se pudieron cargar las ciudades',
			'retry' => 'Reintentar',
			_ => null,
		};
	}
}
