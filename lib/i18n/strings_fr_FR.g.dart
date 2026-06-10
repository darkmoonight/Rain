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
class TranslationsFrFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFrFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.frFr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr-FR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFrFr _root = this; // ignore: unused_field

	@override 
	TranslationsFrFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFrFr(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Pas de réseau';
	@override String get edit_city_hint => 'Modifier les informations de la ville';
	@override String get location_not_found => 'Impossible de déterminer votre position';
	@override String get mi => 'mi';
	@override String get next => 'Suivant';
	@override String get discard => 'Annuler';
	@override String get east => 'Est';
	@override String get time_end => 'Heure de fin';
	@override String get search_method => 'Utilisez la recherche ou la géolocalisation';
	@override String get hourly_variables => 'Variables météorologiques horaires';
	@override String get uv_index => 'UV-indice';
	@override String get clear_sky => 'Ciel dégagé';
	@override String get k_24 => '24 heures';
	@override String get no_weather_card => 'Ajouter une ville';
	@override String get drizzle => 'Bruine';
	@override String get humidity => 'Humidité';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Fonctions';
	@override String get cities => 'Villes';
	@override String get southeast => 'Sud-Est';
	@override String get validate_number => 'Veuillez saisir un numéro valide';
	@override String get city => 'Ville';
	@override String get uv_high => 'Élevé';
	@override String get time => 'Heure locale';
	@override String get uv_low => 'Faible';
	@override String get name3 => 'Nous contacter';
	@override String get apparent_temperature_min => 'Température apparente minimale';
	@override String get direction => 'Direction';
	@override String get heavy_rains => 'Averses de pluie';
	@override String get apparent_temperature_max => 'Température apparente maximale';
	@override String get k_12 => '12 heures';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Êtes-vous sûr de vouloir annuler vos modifications ?';
	@override String get notifications => 'Notifications';
	@override String get mph => 'mph';
	@override String get west => 'Ouest';
	@override String get validate90 => 'La valeur doit être comprise entre -90 et 90';
	@override String get name2 => 'Design pratique';
	@override String get feels => 'Ressenti';
	@override String get precipitation_probability => 'Probabilité de précipitation';
	@override String get license => 'Licences';
	@override String get widget_background => 'Fond du widget';
	@override String get large_element => 'Affichage météo grand format';
	@override String get unsaved_changes => 'Modifications non enregistrées';
	@override String get drizzling_rain => 'Brouillard givrant';
	@override String get cloudy => 'Nuageux';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Précipitation';
	@override String get delete => 'Supprimer';
	@override String get deleted_cache_store => 'Effacement du cache';
	@override String get map => 'Carte';
	@override String get description3 => 'Si vous rencontrez des problèmes, veuillez nous contacter par e-mail ou dans les avis de l\'application.';
	@override String get north => 'Nord';
	@override String get measurements => 'Système de mesures';
	@override String get start => 'Démarrer';
	@override String get settings_full => 'Paramètres';
	@override String get high => 'Haut';
	@override String get daily_variables => 'Variables météorologiques quotidiennes';
	@override String get low => 'Bas';
	@override String get on_inter => 'Connectez-vous à internet pour obtenir des données météorologiques.';
	@override String get thunderstorm => 'Orage';
	@override String get version => 'Application version';
	@override String get project => 'Project on';
	@override String get amoled_theme => 'AMOLED-thème';
	@override String get deleted_card_weather_query => 'Êtes-vous sûr de vouloir supprimer la ville ?';
	@override String get northeast => 'Nord-Est';
	@override String get add_widget => 'Ajouter un widget';
	@override String get fog => 'Brouillard';
	@override String get description2 => 'Toute la navigation est conçue pour interagir avec l\'application de la manière la plus pratique et la plus rapide possible.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Aucune donnée';
	@override String get search_city => 'Trouver votre ville';
	@override String get weather_more => 'Prévisions météo pour 12 jours';
	@override String get round_degree => 'Arrondir les degrés';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'Recherchez ou saisissez manuellement les données de la ville';
	@override String get validate_name => 'Veuillez saisir le nom';
	@override String get sunrise => 'Lever du soleil';
	@override String get km => 'km';
	@override String get district => 'District';
	@override String get southwest => 'Sud-Ouest';
	@override String get degrees => 'Degrés';
	@override String get clear_cache_store => 'Effacer le cache';
	@override String get skip => 'Ignorer';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Apparence';
	@override String get time_start => 'Heure de début';
	@override String get ready => 'Prêt';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Êtes-vous sûr de vouloir effacer le cache?';
	@override String get widget_text => 'Texte du widget';
	@override String get support => 'Support';
	@override String get groups => 'Nos groupes';
	@override String get system => 'Système';
	@override String get sunset => 'Coucher du soleil';
	@override String get dewpoint => 'Point de rosée';
	@override String get shortwave_radiation => 'Rayonnement à ondes courtes';
	@override String get language => 'Langue';
	@override String get hide_map => 'Cacher la carte';
	@override String get cancel => 'Annuler';
	@override String get loading => 'Chargement...';
	@override String get timeformat => 'Format horaire';
	@override String get lat => 'Latitude';
	@override String get data => 'Données';
	@override String get visibility => 'Visibilité';
	@override String get deleted_card_weather => 'Supprimer une ville';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Activez le service de localisation pour obtenir les données météorologiques de l\'endroit actuel.';
	@override String get create => 'Créer';
	@override String get edit => 'Modifier';
	@override String get search => 'Rechercher...';
	@override String get uv_extreme => 'Extrême';
	@override String get light => 'Clair';
	@override String get cloudcover => 'Сouverture nuageuse';
	@override String get uv_very_high => 'Très élevé';
	@override String get snow => 'Neige';
	@override String get done => 'Terminé';
	@override String get theme => 'Thème';
	@override String get name => 'Météo';
	@override String get time_range => 'Fréquence (en heures)';
	@override String get about_app => 'À propos de l\'app';
	@override String get save => 'Enregistrer';
	@override String get evaporation => 'Evaporation';
	@override String get freezing_rain => 'Pluie verglaçante';
	@override String get uv_average => 'Modéré';
	@override String get reset_color => 'Réinitialiser par défaut';
	@override String get metric => 'Métrique';
	@override String get overcast => 'Couvert';
	@override String get pressure => 'Pression';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperial';
	@override String get location => 'Localisation';
	@override String get error_occurred => 'Une erreur s\'est produite';
	@override String get validate_value => 'Veuillez saisir une valeur';
	@override String get lon => 'Longitude';
	@override String get wind => 'Vent';
	@override String get normal => 'Normal';
	@override String get dark => 'Sombre';
	@override String get settings => 'Par.';
	@override String get south => 'Sud';
	@override String get windgusts => 'Rafale';
	@override String get northwest => 'Nord-Ouest';
	@override String get open_meteo => 'Données de Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Pluie';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'La valeur doit être comprise entre -180 et 180';
	@override String get description => 'Application météo avec un pronostic à jour pour chaque heure, jour et semaine pour n\'importe quel endroit.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Couleurs Dynamiques';
	@override String get confirm => 'Enregistrer';
	@override String get no_results => 'Aucun résultat';
	@override String get cities_load_error => 'Échec du chargement des villes';
	@override String get retry => 'Réessayer';
	@override String get city_not_found => 'Ville introuvable';
	@override String get air_quality => 'Qualité de l\'air';
	@override String get aqi_standard => 'Norme AQI';
	@override String get aqi_european => 'AQI européen';
	@override String get aqi_american => 'AQI américain';
	@override String get aqi_good => 'Bon';
	@override String get aqi_fair => 'Passable';
	@override String get aqi_moderate => 'Moyen';
	@override String get aqi_poor => 'Mauvais';
	@override String get aqi_very_poor => 'Très mauvais';
	@override String get aqi_extremely_poor => 'Extrêmement mauvais';
	@override String get aqi_unhealthy_sensitive => 'Mauvais pour les personnes sensibles';
	@override String get aqi_unhealthy => 'Malsain';
	@override String get aqi_very_unhealthy => 'Très malsain';
	@override String get aqi_hazardous => 'Dangereux';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Européen';
	@override String get american => 'Américain';
	@override String get aqi_advice_good => 'Excellente qualité pour les activités en plein air.';
	@override String get aqi_advice_fair => 'Globalement correct. Les personnes sensibles peuvent limiter les efforts prolongés dehors.';
	@override String get aqi_advice_moderate => 'Les groupes sensibles devraient réduire le temps passé dehors.';
	@override String get aqi_advice_poor => 'Limitez les activités dehors, surtout si vous êtes sensible à la pollution.';
	@override String get aqi_advice_very_poor => 'Évitez les efforts prolongés dehors. Effets sur la santé possibles pour tous.';
	@override String get aqi_advice_extremely_poor => 'Restez à l\'intérieur si possible. Les activités dehors sont déconseillées.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Polluants';
}

/// The flat map containing all translations for locale <fr-FR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFrFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Pas de réseau',
			'edit_city_hint' => 'Modifier les informations de la ville',
			'location_not_found' => 'Impossible de déterminer votre position',
			'mi' => 'mi',
			'next' => 'Suivant',
			'discard' => 'Annuler',
			'east' => 'Est',
			'time_end' => 'Heure de fin',
			'search_method' => 'Utilisez la recherche ou la géolocalisation',
			'hourly_variables' => 'Variables météorologiques horaires',
			'uv_index' => 'UV-indice',
			'clear_sky' => 'Ciel dégagé',
			'k_24' => '24 heures',
			'no_weather_card' => 'Ajouter une ville',
			'drizzle' => 'Bruine',
			'humidity' => 'Humidité',
			'telegram' => 'Telegram',
			'functions' => 'Fonctions',
			'cities' => 'Villes',
			'southeast' => 'Sud-Est',
			'validate_number' => 'Veuillez saisir un numéro valide',
			'city' => 'Ville',
			'uv_high' => 'Élevé',
			'time' => 'Heure locale',
			'uv_low' => 'Faible',
			'name3' => 'Nous contacter',
			'apparent_temperature_min' => 'Température apparente minimale',
			'direction' => 'Direction',
			'heavy_rains' => 'Averses de pluie',
			'apparent_temperature_max' => 'Température apparente maximale',
			'k_12' => '12 heures',
			'discord' => 'Discord',
			'discard_changes' => 'Êtes-vous sûr de vouloir annuler vos modifications ?',
			'notifications' => 'Notifications',
			'mph' => 'mph',
			'west' => 'Ouest',
			'validate90' => 'La valeur doit être comprise entre -90 et 90',
			'name2' => 'Design pratique',
			'feels' => 'Ressenti',
			'precipitation_probability' => 'Probabilité de précipitation',
			'license' => 'Licences',
			'widget_background' => 'Fond du widget',
			'large_element' => 'Affichage météo grand format',
			'unsaved_changes' => 'Modifications non enregistrées',
			'drizzling_rain' => 'Brouillard givrant',
			'cloudy' => 'Nuageux',
			'widget' => 'Widget',
			'precipitation' => 'Précipitation',
			'delete' => 'Supprimer',
			'deleted_cache_store' => 'Effacement du cache',
			'map' => 'Carte',
			'description3' => 'Si vous rencontrez des problèmes, veuillez nous contacter par e-mail ou dans les avis de l\'application.',
			'north' => 'Nord',
			'measurements' => 'Système de mesures',
			'start' => 'Démarrer',
			'settings_full' => 'Paramètres',
			'high' => 'Haut',
			'daily_variables' => 'Variables météorologiques quotidiennes',
			'low' => 'Bas',
			'on_inter' => 'Connectez-vous à internet pour obtenir des données météorologiques.',
			'thunderstorm' => 'Orage',
			'version' => 'Application version',
			'project' => 'Project on',
			'amoled_theme' => 'AMOLED-thème',
			'deleted_card_weather_query' => 'Êtes-vous sûr de vouloir supprimer la ville ?',
			'northeast' => 'Nord-Est',
			'add_widget' => 'Ajouter un widget',
			'fog' => 'Brouillard',
			'description2' => 'Toute la navigation est conçue pour interagir avec l\'application de la manière la plus pratique et la plus rapide possible.',
			'mm' => 'mm',
			'no_desc_data' => 'Aucune donnée',
			'search_city' => 'Trouver votre ville',
			'weather_more' => 'Prévisions météo pour 12 jours',
			'round_degree' => 'Arrondir les degrés',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'Recherchez ou saisissez manuellement les données de la ville',
			'validate_name' => 'Veuillez saisir le nom',
			'sunrise' => 'Lever du soleil',
			'km' => 'km',
			'district' => 'District',
			'southwest' => 'Sud-Ouest',
			'degrees' => 'Degrés',
			'clear_cache_store' => 'Effacer le cache',
			'skip' => 'Ignorer',
			'h_pa' => 'hPa',
			'appearance' => 'Apparence',
			'time_start' => 'Heure de début',
			'ready' => 'Prêt',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Êtes-vous sûr de vouloir effacer le cache?',
			'widget_text' => 'Texte du widget',
			'support' => 'Support',
			'groups' => 'Nos groupes',
			'system' => 'Système',
			'sunset' => 'Coucher du soleil',
			'dewpoint' => 'Point de rosée',
			'shortwave_radiation' => 'Rayonnement à ondes courtes',
			'language' => 'Langue',
			'hide_map' => 'Cacher la carte',
			'cancel' => 'Annuler',
			'loading' => 'Chargement...',
			'timeformat' => 'Format horaire',
			'lat' => 'Latitude',
			'data' => 'Données',
			'visibility' => 'Visibilité',
			'deleted_card_weather' => 'Supprimer une ville',
			'celsius' => 'Celsius',
			'no_location' => 'Activez le service de localisation pour obtenir les données météorologiques de l\'endroit actuel.',
			'create' => 'Créer',
			'edit' => 'Modifier',
			'search' => 'Rechercher...',
			'uv_extreme' => 'Extrême',
			'light' => 'Clair',
			'cloudcover' => 'Сouverture nuageuse',
			'uv_very_high' => 'Très élevé',
			'snow' => 'Neige',
			'done' => 'Terminé',
			'theme' => 'Thème',
			'name' => 'Météo',
			'time_range' => 'Fréquence (en heures)',
			'about_app' => 'À propos de l\'app',
			'save' => 'Enregistrer',
			'evaporation' => 'Evaporation',
			'freezing_rain' => 'Pluie verglaçante',
			'uv_average' => 'Modéré',
			'reset_color' => 'Réinitialiser par défaut',
			'metric' => 'Métrique',
			'overcast' => 'Couvert',
			'pressure' => 'Pression',
			'inch' => 'inch',
			'imperial' => 'Imperial',
			'location' => 'Localisation',
			'error_occurred' => 'Une erreur s\'est produite',
			'validate_value' => 'Veuillez saisir une valeur',
			'lon' => 'Longitude',
			'wind' => 'Vent',
			'normal' => 'Normal',
			'dark' => 'Sombre',
			'settings' => 'Par.',
			'south' => 'Sud',
			'windgusts' => 'Rafale',
			'northwest' => 'Nord-Ouest',
			'open_meteo' => 'Données de Open-Meteo (CC-BY 4.0)',
			'rain' => 'Pluie',
			'mm_hg' => 'mmHg',
			'validate180' => 'La valeur doit être comprise entre -180 et 180',
			'description' => 'Application météo avec un pronostic à jour pour chaque heure, jour et semaine pour n\'importe quel endroit.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Couleurs Dynamiques',
			'confirm' => 'Enregistrer',
			'no_results' => 'Aucun résultat',
			'cities_load_error' => 'Échec du chargement des villes',
			'retry' => 'Réessayer',
			'city_not_found' => 'Ville introuvable',
			'air_quality' => 'Qualité de l\'air',
			'aqi_standard' => 'Norme AQI',
			'aqi_european' => 'AQI européen',
			'aqi_american' => 'AQI américain',
			'aqi_good' => 'Bon',
			'aqi_fair' => 'Passable',
			'aqi_moderate' => 'Moyen',
			'aqi_poor' => 'Mauvais',
			'aqi_very_poor' => 'Très mauvais',
			'aqi_extremely_poor' => 'Extrêmement mauvais',
			'aqi_unhealthy_sensitive' => 'Mauvais pour les personnes sensibles',
			'aqi_unhealthy' => 'Malsain',
			'aqi_very_unhealthy' => 'Très malsain',
			'aqi_hazardous' => 'Dangereux',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Européen',
			'american' => 'Américain',
			'aqi_advice_good' => 'Excellente qualité pour les activités en plein air.',
			'aqi_advice_fair' => 'Globalement correct. Les personnes sensibles peuvent limiter les efforts prolongés dehors.',
			'aqi_advice_moderate' => 'Les groupes sensibles devraient réduire le temps passé dehors.',
			'aqi_advice_poor' => 'Limitez les activités dehors, surtout si vous êtes sensible à la pollution.',
			'aqi_advice_very_poor' => 'Évitez les efforts prolongés dehors. Effets sur la santé possibles pour tous.',
			'aqi_advice_extremely_poor' => 'Restez à l\'intérieur si possible. Les activités dehors sont déconseillées.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Polluants',
			_ => null,
		};
	}
}
