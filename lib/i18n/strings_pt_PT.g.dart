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
class TranslationsPtPt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPtPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptPt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt-PT>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPtPt _root = this; // ignore: unused_field

	@override 
	TranslationsPtPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtPt(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Sem ligação à Internet';
	@override String get edit_city_hint => 'Editar informações da cidade';
	@override String get location_not_found => 'Não foi possível determinar a sua localização';
	@override String get mi => 'mi';
	@override String get next => 'Seguinte';
	@override String get discard => 'Descartar';
	@override String get east => 'Este';
	@override String get time_end => 'Hora de fim';
	@override String get search_method => 'Utilize a pesquisa ou a geolocalização';
	@override String get hourly_variables => 'Variáveis meteorológicas horárias';
	@override String get uv_index => 'Índice UV';
	@override String get clear_sky => 'Céu limpo';
	@override String get k_24 => '24 horas';
	@override String get no_weather_card => 'Adicione uma cidade';
	@override String get drizzle => 'Chuvisco';
	@override String get humidity => 'Humidade';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funcionalidades';
	@override String get cities => 'Cidades';
	@override String get southeast => 'Sudeste';
	@override String get validate_number => 'Por favor, introduza um número válido';
	@override String get city => 'Cidade';
	@override String get uv_high => 'Alto';
	@override String get time => 'Hora na cidade';
	@override String get uv_low => 'Baixo';
	@override String get name3 => 'Contacte-nos';
	@override String get apparent_temperature_min => 'Temperatura aparente mínima';
	@override String get direction => 'Direção';
	@override String get heavy_rains => 'Aguaceiros';
	@override String get apparent_temperature_max => 'Temperatura aparente máxima';
	@override String get k_12 => '12 horas';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Tem a certeza de que deseja descartar as alterações?';
	@override String get notifications => 'Notificações';
	@override String get mph => 'mph';
	@override String get west => 'Oeste';
	@override String get validate90 => 'O valor deve estar entre -90 e 90';
	@override String get name2 => 'Design Conveniente';
	@override String get feels => 'Sensação térmica';
	@override String get precipitation_probability => 'Probabilidade de precipitação';
	@override String get license => 'Licenças';
	@override String get widget_background => 'Fundo do widget';
	@override String get large_element => 'Visualização expandida do tempo';
	@override String get unsaved_changes => 'Alterações não guardadas';
	@override String get drizzling_rain => 'Chuvisco gelado';
	@override String get cloudy => 'Nublado';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Precipitação';
	@override String get delete => 'Eliminar';
	@override String get deleted_cache_store => 'A limpar a cache';
	@override String get map => 'Mapa';
	@override String get description3 => 'Se encontrar algum problema, contacte-nos por e‑mail ou através das avaliações da aplicação.';
	@override String get north => 'Norte';
	@override String get measurements => 'Sistema de unidades';
	@override String get start => 'Começar';
	@override String get settings_full => 'Definições';
	@override String get high => 'Alto';
	@override String get daily_variables => 'Variáveis meteorológicas diárias';
	@override String get low => 'Baixo';
	@override String get on_inter => 'Ligue a Internet para obter os dados meteorológicos.';
	@override String get thunderstorm => 'Trovoada';
	@override String get version => 'Versão da aplicação';
	@override String get project => 'Projeto em';
	@override String get amoled_theme => 'Tema AMOLED';
	@override String get deleted_card_weather_query => 'Tem a certeza de que pretende eliminar esta cidade?';
	@override String get northeast => 'Nordeste';
	@override String get add_widget => 'Adicionar widget';
	@override String get fog => 'Nevoeiro';
	@override String get description2 => 'Toda a navegação foi pensada para interagir com a aplicação da forma mais rápida e confortável possível.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Sem dados';
	@override String get search_city => 'Procure a sua cidade';
	@override String get weather_more => 'Previsão para 12 dias';
	@override String get round_degree => 'Arredondar graus';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Pesquise ou introduza dados da cidade manualmente';
	@override String get validate_name => 'Por favor, introduza um nome';
	@override String get sunrise => 'Nascer do sol';
	@override String get km => 'km';
	@override String get district => 'Distrito';
	@override String get southwest => 'Sudoeste';
	@override String get degrees => 'Graus';
	@override String get clear_cache_store => 'Limpar cache';
	@override String get skip => 'Ignorar';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Aparência';
	@override String get time_start => 'Hora de início';
	@override String get ready => 'Pronto';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Tem a certeza de que pretende limpar a cache?';
	@override String get widget_text => 'Texto do widget';
	@override String get support => 'Apoio';
	@override String get groups => 'Os nossos grupos';
	@override String get system => 'Sistema';
	@override String get sunset => 'Pôr do sol';
	@override String get dewpoint => 'Ponto de orvalho';
	@override String get shortwave_radiation => 'Radiação de ondas curtas';
	@override String get language => 'Idioma';
	@override String get hide_map => 'Ocultar mapa';
	@override String get cancel => 'Cancelar';
	@override String get loading => 'A carregar...';
	@override String get timeformat => 'Formato da hora';
	@override String get lat => 'Latitude';
	@override String get data => 'Dados';
	@override String get visibility => 'Visibilidade';
	@override String get deleted_card_weather => 'A remover a cidade';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Ative a localização para obter os dados meteorológicos da sua posição atual.';
	@override String get create => 'Criar';
	@override String get edit => 'Editar';
	@override String get search => 'Pesquisar...';
	@override String get uv_extreme => 'Extremo';
	@override String get light => 'Claro';
	@override String get cloudcover => 'Cobertura de nuvens';
	@override String get uv_very_high => 'Muito alto';
	@override String get snow => 'Neve';
	@override String get done => 'Concluído';
	@override String get theme => 'Tema';
	@override String get name => 'Meteorologia';
	@override String get time_range => 'Intervalo (horas)';
	@override String get about_app => 'Sobre a app';
	@override String get save => 'Guardar';
	@override String get evaporation => 'Evapotranspiração';
	@override String get freezing_rain => 'Chuva gelada';
	@override String get uv_average => 'Moderado';
	@override String get reset_color => 'Repor predefinição';
	@override String get metric => 'Métrico';
	@override String get overcast => 'Encoberto';
	@override String get pressure => 'Pressão';
	@override String get inch => 'polegada';
	@override String get imperial => 'Imperial';
	@override String get location => 'Localização';
	@override String get error_occurred => 'Ocorreu um erro';
	@override String get validate_value => 'Por favor, introduza um valor';
	@override String get lon => 'Longitude';
	@override String get wind => 'Vento';
	@override String get normal => 'Normal';
	@override String get dark => 'Escuro';
	@override String get settings => 'Definições';
	@override String get south => 'Sul';
	@override String get windgusts => 'Rajadas de vento';
	@override String get northwest => 'Noroeste';
	@override String get open_meteo => 'Dados fornecidos por Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Chuva';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'O valor deve estar entre -180 e 180';
	@override String get description => 'Aplicação meteorológica com previsões atualizadas por hora, dia e semana para qualquer localização.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Cores dinâmicas';
	@override String get confirm => 'Guardar';
	@override String get no_results => 'Sem resultados';
	@override String get cities_load_error => 'Falha ao carregar cidades';
	@override String get retry => 'Tentar novamente';
	@override String get city_not_found => 'Cidade não encontrada';
}

/// The flat map containing all translations for locale <pt-PT>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPtPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Sem ligação à Internet',
			'edit_city_hint' => 'Editar informações da cidade',
			'location_not_found' => 'Não foi possível determinar a sua localização',
			'mi' => 'mi',
			'next' => 'Seguinte',
			'discard' => 'Descartar',
			'east' => 'Este',
			'time_end' => 'Hora de fim',
			'search_method' => 'Utilize a pesquisa ou a geolocalização',
			'hourly_variables' => 'Variáveis meteorológicas horárias',
			'uv_index' => 'Índice UV',
			'clear_sky' => 'Céu limpo',
			'k_24' => '24 horas',
			'no_weather_card' => 'Adicione uma cidade',
			'drizzle' => 'Chuvisco',
			'humidity' => 'Humidade',
			'telegram' => 'Telegram',
			'functions' => 'Funcionalidades',
			'cities' => 'Cidades',
			'southeast' => 'Sudeste',
			'validate_number' => 'Por favor, introduza um número válido',
			'city' => 'Cidade',
			'uv_high' => 'Alto',
			'time' => 'Hora na cidade',
			'uv_low' => 'Baixo',
			'name3' => 'Contacte-nos',
			'apparent_temperature_min' => 'Temperatura aparente mínima',
			'direction' => 'Direção',
			'heavy_rains' => 'Aguaceiros',
			'apparent_temperature_max' => 'Temperatura aparente máxima',
			'k_12' => '12 horas',
			'discord' => 'Discord',
			'discard_changes' => 'Tem a certeza de que deseja descartar as alterações?',
			'notifications' => 'Notificações',
			'mph' => 'mph',
			'west' => 'Oeste',
			'validate90' => 'O valor deve estar entre -90 e 90',
			'name2' => 'Design Conveniente',
			'feels' => 'Sensação térmica',
			'precipitation_probability' => 'Probabilidade de precipitação',
			'license' => 'Licenças',
			'widget_background' => 'Fundo do widget',
			'large_element' => 'Visualização expandida do tempo',
			'unsaved_changes' => 'Alterações não guardadas',
			'drizzling_rain' => 'Chuvisco gelado',
			'cloudy' => 'Nublado',
			'widget' => 'Widget',
			'precipitation' => 'Precipitação',
			'delete' => 'Eliminar',
			'deleted_cache_store' => 'A limpar a cache',
			'map' => 'Mapa',
			'description3' => 'Se encontrar algum problema, contacte-nos por e‑mail ou através das avaliações da aplicação.',
			'north' => 'Norte',
			'measurements' => 'Sistema de unidades',
			'start' => 'Começar',
			'settings_full' => 'Definições',
			'high' => 'Alto',
			'daily_variables' => 'Variáveis meteorológicas diárias',
			'low' => 'Baixo',
			'on_inter' => 'Ligue a Internet para obter os dados meteorológicos.',
			'thunderstorm' => 'Trovoada',
			'version' => 'Versão da aplicação',
			'project' => 'Projeto em',
			'amoled_theme' => 'Tema AMOLED',
			'deleted_card_weather_query' => 'Tem a certeza de que pretende eliminar esta cidade?',
			'northeast' => 'Nordeste',
			'add_widget' => 'Adicionar widget',
			'fog' => 'Nevoeiro',
			'description2' => 'Toda a navegação foi pensada para interagir com a aplicação da forma mais rápida e confortável possível.',
			'mm' => 'mm',
			'no_desc_data' => 'Sem dados',
			'search_city' => 'Procure a sua cidade',
			'weather_more' => 'Previsão para 12 dias',
			'round_degree' => 'Arredondar graus',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Pesquise ou introduza dados da cidade manualmente',
			'validate_name' => 'Por favor, introduza um nome',
			'sunrise' => 'Nascer do sol',
			'km' => 'km',
			'district' => 'Distrito',
			'southwest' => 'Sudoeste',
			'degrees' => 'Graus',
			'clear_cache_store' => 'Limpar cache',
			'skip' => 'Ignorar',
			'h_pa' => 'hPa',
			'appearance' => 'Aparência',
			'time_start' => 'Hora de início',
			'ready' => 'Pronto',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Tem a certeza de que pretende limpar a cache?',
			'widget_text' => 'Texto do widget',
			'support' => 'Apoio',
			'groups' => 'Os nossos grupos',
			'system' => 'Sistema',
			'sunset' => 'Pôr do sol',
			'dewpoint' => 'Ponto de orvalho',
			'shortwave_radiation' => 'Radiação de ondas curtas',
			'language' => 'Idioma',
			'hide_map' => 'Ocultar mapa',
			'cancel' => 'Cancelar',
			'loading' => 'A carregar...',
			'timeformat' => 'Formato da hora',
			'lat' => 'Latitude',
			'data' => 'Dados',
			'visibility' => 'Visibilidade',
			'deleted_card_weather' => 'A remover a cidade',
			'celsius' => 'Celsius',
			'no_location' => 'Ative a localização para obter os dados meteorológicos da sua posição atual.',
			'create' => 'Criar',
			'edit' => 'Editar',
			'search' => 'Pesquisar...',
			'uv_extreme' => 'Extremo',
			'light' => 'Claro',
			'cloudcover' => 'Cobertura de nuvens',
			'uv_very_high' => 'Muito alto',
			'snow' => 'Neve',
			'done' => 'Concluído',
			'theme' => 'Tema',
			'name' => 'Meteorologia',
			'time_range' => 'Intervalo (horas)',
			'about_app' => 'Sobre a app',
			'save' => 'Guardar',
			'evaporation' => 'Evapotranspiração',
			'freezing_rain' => 'Chuva gelada',
			'uv_average' => 'Moderado',
			'reset_color' => 'Repor predefinição',
			'metric' => 'Métrico',
			'overcast' => 'Encoberto',
			'pressure' => 'Pressão',
			'inch' => 'polegada',
			'imperial' => 'Imperial',
			'location' => 'Localização',
			'error_occurred' => 'Ocorreu um erro',
			'validate_value' => 'Por favor, introduza um valor',
			'lon' => 'Longitude',
			'wind' => 'Vento',
			'normal' => 'Normal',
			'dark' => 'Escuro',
			'settings' => 'Definições',
			'south' => 'Sul',
			'windgusts' => 'Rajadas de vento',
			'northwest' => 'Noroeste',
			'open_meteo' => 'Dados fornecidos por Open-Meteo (CC-BY 4.0)',
			'rain' => 'Chuva',
			'mm_hg' => 'mmHg',
			'validate180' => 'O valor deve estar entre -180 e 180',
			'description' => 'Aplicação meteorológica com previsões atualizadas por hora, dia e semana para qualquer localização.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Cores dinâmicas',
			'confirm' => 'Guardar',
			'no_results' => 'Sem resultados',
			'cities_load_error' => 'Falha ao carregar cidades',
			'retry' => 'Tentar novamente',
			'city_not_found' => 'Cidade não encontrada',
			_ => null,
		};
	}
}
