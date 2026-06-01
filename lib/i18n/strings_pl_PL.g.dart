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
class TranslationsPlPl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPlPl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.plPl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pl-PL>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPlPl _root = this; // ignore: unused_field

	@override 
	TranslationsPlPl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPlPl(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Brak internetu';
	@override String get edit_city_hint => 'Edytuj informacje o mieście';
	@override String get location_not_found => 'Nie udało się określić Twojej lokalizacji';
	@override String get mi => 'mi';
	@override String get next => 'Dalej';
	@override String get discard => 'Odrzuć';
	@override String get east => 'Wschód';
	@override String get time_end => 'Czas zakończenia';
	@override String get search_method => 'Użyj wyszukiwania lub geolokalizacji';
	@override String get hourly_variables => 'Godzinowe zmienne pogodowe';
	@override String get uv_index => 'Indeks UV';
	@override String get clear_sky => 'Czyste niebo';
	@override String get k_24 => '24-hour';
	@override String get no_weather_card => 'Dodaj miasto';
	@override String get drizzle => 'Mżawka';
	@override String get humidity => 'Wilgoć';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funkcje';
	@override String get cities => 'Miasta';
	@override String get southeast => 'południowy wschód';
	@override String get validate_number => 'Proszę wprowadzić poprawny numer';
	@override String get city => 'Miasto';
	@override String get uv_high => 'Wysoki';
	@override String get time => 'Czas w mieście';
	@override String get uv_low => 'Niski';
	@override String get name3 => 'Skontaktuj się z nami';
	@override String get apparent_temperature_min => 'Minimalna temperatura pozorna';
	@override String get direction => 'Kierunek';
	@override String get heavy_rains => 'Przelotne opady deszczu';
	@override String get apparent_temperature_max => 'Maksymalna pozorna temperatura';
	@override String get k_12 => '12-hour';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Czy na pewno chcesz odrzucić zmiany?';
	@override String get notifications => 'Powiadomienia';
	@override String get mph => 'mph';
	@override String get west => 'Zachód';
	@override String get validate90 => 'Wartość musi mieścić się w zakresie od -90 do 90';
	@override String get name2 => 'Wygodny design';
	@override String get feels => 'Odczuwalna';
	@override String get precipitation_probability => 'Prawdopodobieństwo opadów';
	@override String get license => 'Licencje';
	@override String get widget_background => 'Tło widżetu';
	@override String get large_element => 'Duże wyświetlanie pogody';
	@override String get unsaved_changes => 'Niezapisane zmiany';
	@override String get drizzling_rain => 'Mroźna Mżawka';
	@override String get cloudy => 'Pochmurno';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Opad atmosferyczny';
	@override String get delete => 'Usuń';
	@override String get deleted_cache_store => 'Czyszczenie pamięci podręcznej';
	@override String get map => 'Mapa';
	@override String get description3 => 'Jeśli napotkasz jakiekolwiek problemy, skontaktuj się z nami drogą e-mailową lub w recenzjach aplikacji.';
	@override String get north => 'Północ';
	@override String get measurements => 'System środków';
	@override String get start => 'Rozpocznij';
	@override String get settings_full => 'Ustawienia';
	@override String get high => 'Wysoki';
	@override String get daily_variables => 'Dzienne zmienne pogodowe';
	@override String get low => 'Niski';
	@override String get on_inter => 'Włącz Internet, aby uzyskać dane meteorologiczne.';
	@override String get thunderstorm => 'Burza z piorunami';
	@override String get version => 'Wersja aplikacji';
	@override String get project => 'Project on';
	@override String get amoled_theme => 'AMOLED-theme';
	@override String get deleted_card_weather_query => 'Czy na pewno chcesz usunąć miasto?';
	@override String get northeast => 'Północny wschód';
	@override String get add_widget => 'Dodaj widget';
	@override String get fog => 'Mgła';
	@override String get description2 => 'Cała nawigacja jest zaprojektowana tak, aby można było jak najwygodniej i najszybciej współdziałać z aplikacją.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Brak danych';
	@override String get search_city => 'Znajdź swoje miasto';
	@override String get weather_more => 'Prognoza pogody na 12 dni';
	@override String get round_degree => 'Zaokrąglaj stopnie';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Wyszukaj lub wprowadź dane miasta ręcznie';
	@override String get validate_name => 'Wprowadź nazwę';
	@override String get sunrise => 'Wschód słońca';
	@override String get km => 'km';
	@override String get district => 'Dzielnica';
	@override String get southwest => 'Południowy zachód';
	@override String get degrees => 'Stopni';
	@override String get clear_cache_store => 'Wyczyść pamięć podręczną';
	@override String get skip => 'Pomiń';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Wygląd';
	@override String get time_start => 'Czas rozpoczęcia';
	@override String get ready => 'Gotowe';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Czy na pewno chcesz wyczyścić pamięć podręczną?';
	@override String get widget_text => 'Tekst widżetu';
	@override String get support => 'Wsparcie';
	@override String get groups => 'Nasze grupy';
	@override String get system => 'System';
	@override String get sunset => 'Zachód słońca';
	@override String get dewpoint => 'Punkt rosy';
	@override String get shortwave_radiation => 'Promieniowanie krótkofalowe';
	@override String get language => 'Język';
	@override String get hide_map => 'Ukryj mapę';
	@override String get cancel => 'Anuluj';
	@override String get loading => 'Ładowanie...';
	@override String get timeformat => 'Format czasu';
	@override String get lat => 'Latitude';
	@override String get data => 'Data';
	@override String get visibility => 'Widoczność';
	@override String get deleted_card_weather => 'Usuwanie miasta';
	@override String get celsius => 'Celsjusz';
	@override String get no_location => 'Włącz usługę lokalizacyjną, aby uzyskać dane pogodowe dla bieżącej lokalizacji.';
	@override String get create => 'Stwórz';
	@override String get edit => 'Edytuj';
	@override String get search => 'Szukaj...';
	@override String get uv_extreme => 'Extremalny';
	@override String get light => 'Jasny';
	@override String get cloudcover => 'Zachmurzenie';
	@override String get uv_very_high => 'Bardzo wysoki';
	@override String get snow => 'Śnieg';
	@override String get done => 'Gotowe';
	@override String get theme => 'Motyw';
	@override String get name => 'Pogoda';
	@override String get time_range => 'Częstotliwość (w godzinach)';
	@override String get about_app => 'O aplikacji';
	@override String get save => 'Zapisz';
	@override String get evaporation => 'Parowanie';
	@override String get freezing_rain => 'Mroźny deszcz';
	@override String get uv_average => 'Umiarkowany';
	@override String get reset_color => 'Przywróc domyślne';
	@override String get metric => 'Metric';
	@override String get overcast => 'Pochmurnie';
	@override String get pressure => 'Ciśnienie';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperial';
	@override String get location => 'Lokalizacja';
	@override String get error_occurred => 'Wystąpił błąd';
	@override String get validate_value => 'Proszę wprowadzić wartość';
	@override String get lon => 'Longitude';
	@override String get wind => 'Wiatr';
	@override String get normal => 'Normalny';
	@override String get dark => 'Ciemny';
	@override String get settings => 'Ustaw.';
	@override String get south => 'Południe';
	@override String get windgusts => 'Porywy wiatru';
	@override String get northwest => 'Północny zachód';
	@override String get open_meteo => 'Dane z Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Deszcz';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Wartość musi mieścić się w przedziale od -180 do 180';
	@override String get description => 'Aplikacja pogodowa z aktualną prognozą na każdą godzinę, dzień i tydzień dla dowolnego miejsca.';
	@override String get fahrenheit => 'Fahrenheita';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dynamiczne kolory';
	@override String get confirm => 'Zapisz';
	@override String get no_results => 'Brak wyników';
}

/// The flat map containing all translations for locale <pl-PL>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPlPl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Brak internetu',
			'edit_city_hint' => 'Edytuj informacje o mieście',
			'location_not_found' => 'Nie udało się określić Twojej lokalizacji',
			'mi' => 'mi',
			'next' => 'Dalej',
			'discard' => 'Odrzuć',
			'east' => 'Wschód',
			'time_end' => 'Czas zakończenia',
			'search_method' => 'Użyj wyszukiwania lub geolokalizacji',
			'hourly_variables' => 'Godzinowe zmienne pogodowe',
			'uv_index' => 'Indeks UV',
			'clear_sky' => 'Czyste niebo',
			'k_24' => '24-hour',
			'no_weather_card' => 'Dodaj miasto',
			'drizzle' => 'Mżawka',
			'humidity' => 'Wilgoć',
			'telegram' => 'Telegram',
			'functions' => 'Funkcje',
			'cities' => 'Miasta',
			'southeast' => 'południowy wschód',
			'validate_number' => 'Proszę wprowadzić poprawny numer',
			'city' => 'Miasto',
			'uv_high' => 'Wysoki',
			'time' => 'Czas w mieście',
			'uv_low' => 'Niski',
			'name3' => 'Skontaktuj się z nami',
			'apparent_temperature_min' => 'Minimalna temperatura pozorna',
			'direction' => 'Kierunek',
			'heavy_rains' => 'Przelotne opady deszczu',
			'apparent_temperature_max' => 'Maksymalna pozorna temperatura',
			'k_12' => '12-hour',
			'discord' => 'Discord',
			'discard_changes' => 'Czy na pewno chcesz odrzucić zmiany?',
			'notifications' => 'Powiadomienia',
			'mph' => 'mph',
			'west' => 'Zachód',
			'validate90' => 'Wartość musi mieścić się w zakresie od -90 do 90',
			'name2' => 'Wygodny design',
			'feels' => 'Odczuwalna',
			'precipitation_probability' => 'Prawdopodobieństwo opadów',
			'license' => 'Licencje',
			'widget_background' => 'Tło widżetu',
			'large_element' => 'Duże wyświetlanie pogody',
			'unsaved_changes' => 'Niezapisane zmiany',
			'drizzling_rain' => 'Mroźna Mżawka',
			'cloudy' => 'Pochmurno',
			'widget' => 'Widget',
			'precipitation' => 'Opad atmosferyczny',
			'delete' => 'Usuń',
			'deleted_cache_store' => 'Czyszczenie pamięci podręcznej',
			'map' => 'Mapa',
			'description3' => 'Jeśli napotkasz jakiekolwiek problemy, skontaktuj się z nami drogą e-mailową lub w recenzjach aplikacji.',
			'north' => 'Północ',
			'measurements' => 'System środków',
			'start' => 'Rozpocznij',
			'settings_full' => 'Ustawienia',
			'high' => 'Wysoki',
			'daily_variables' => 'Dzienne zmienne pogodowe',
			'low' => 'Niski',
			'on_inter' => 'Włącz Internet, aby uzyskać dane meteorologiczne.',
			'thunderstorm' => 'Burza z piorunami',
			'version' => 'Wersja aplikacji',
			'project' => 'Project on',
			'amoled_theme' => 'AMOLED-theme',
			'deleted_card_weather_query' => 'Czy na pewno chcesz usunąć miasto?',
			'northeast' => 'Północny wschód',
			'add_widget' => 'Dodaj widget',
			'fog' => 'Mgła',
			'description2' => 'Cała nawigacja jest zaprojektowana tak, aby można było jak najwygodniej i najszybciej współdziałać z aplikacją.',
			'mm' => 'mm',
			'no_desc_data' => 'Brak danych',
			'search_city' => 'Znajdź swoje miasto',
			'weather_more' => 'Prognoza pogody na 12 dni',
			'round_degree' => 'Zaokrąglaj stopnie',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Wyszukaj lub wprowadź dane miasta ręcznie',
			'validate_name' => 'Wprowadź nazwę',
			'sunrise' => 'Wschód słońca',
			'km' => 'km',
			'district' => 'Dzielnica',
			'southwest' => 'Południowy zachód',
			'degrees' => 'Stopni',
			'clear_cache_store' => 'Wyczyść pamięć podręczną',
			'skip' => 'Pomiń',
			'h_pa' => 'hPa',
			'appearance' => 'Wygląd',
			'time_start' => 'Czas rozpoczęcia',
			'ready' => 'Gotowe',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Czy na pewno chcesz wyczyścić pamięć podręczną?',
			'widget_text' => 'Tekst widżetu',
			'support' => 'Wsparcie',
			'groups' => 'Nasze grupy',
			'system' => 'System',
			'sunset' => 'Zachód słońca',
			'dewpoint' => 'Punkt rosy',
			'shortwave_radiation' => 'Promieniowanie krótkofalowe',
			'language' => 'Język',
			'hide_map' => 'Ukryj mapę',
			'cancel' => 'Anuluj',
			'loading' => 'Ładowanie...',
			'timeformat' => 'Format czasu',
			'lat' => 'Latitude',
			'data' => 'Data',
			'visibility' => 'Widoczność',
			'deleted_card_weather' => 'Usuwanie miasta',
			'celsius' => 'Celsjusz',
			'no_location' => 'Włącz usługę lokalizacyjną, aby uzyskać dane pogodowe dla bieżącej lokalizacji.',
			'create' => 'Stwórz',
			'edit' => 'Edytuj',
			'search' => 'Szukaj...',
			'uv_extreme' => 'Extremalny',
			'light' => 'Jasny',
			'cloudcover' => 'Zachmurzenie',
			'uv_very_high' => 'Bardzo wysoki',
			'snow' => 'Śnieg',
			'done' => 'Gotowe',
			'theme' => 'Motyw',
			'name' => 'Pogoda',
			'time_range' => 'Częstotliwość (w godzinach)',
			'about_app' => 'O aplikacji',
			'save' => 'Zapisz',
			'evaporation' => 'Parowanie',
			'freezing_rain' => 'Mroźny deszcz',
			'uv_average' => 'Umiarkowany',
			'reset_color' => 'Przywróc domyślne',
			'metric' => 'Metric',
			'overcast' => 'Pochmurnie',
			'pressure' => 'Ciśnienie',
			'inch' => 'inch',
			'imperial' => 'Imperial',
			'location' => 'Lokalizacja',
			'error_occurred' => 'Wystąpił błąd',
			'validate_value' => 'Proszę wprowadzić wartość',
			'lon' => 'Longitude',
			'wind' => 'Wiatr',
			'normal' => 'Normalny',
			'dark' => 'Ciemny',
			'settings' => 'Ustaw.',
			'south' => 'Południe',
			'windgusts' => 'Porywy wiatru',
			'northwest' => 'Północny zachód',
			'open_meteo' => 'Dane z Open-Meteo (CC-BY 4.0)',
			'rain' => 'Deszcz',
			'mm_hg' => 'mmHg',
			'validate180' => 'Wartość musi mieścić się w przedziale od -180 do 180',
			'description' => 'Aplikacja pogodowa z aktualną prognozą na każdą godzinę, dzień i tydzień dla dowolnego miejsca.',
			'fahrenheit' => 'Fahrenheita',
			'm_s' => 'm/s',
			'material_color' => 'Dynamiczne kolory',
			'confirm' => 'Zapisz',
			'no_results' => 'Brak wyników',
			_ => null,
		};
	}
}
