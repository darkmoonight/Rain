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
class TranslationsPtBr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPtBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPtBr _root = this; // ignore: unused_field

	@override 
	TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Sem conexão';
	@override String get edit_city_hint => 'Editar informações da cidade';
	@override String get location_not_found => 'Não foi possível determinar sua localização';
	@override String get mi => 'mi';
	@override String get next => 'Próximo';
	@override String get discard => 'Descartar';
	@override String get east => 'Leste';
	@override String get time_end => 'Hora de término';
	@override String get search_method => 'Use a pesquisa ou a geolocalização';
	@override String get hourly_variables => 'Variáveis meteorológicas horárias';
	@override String get uv_index => 'UV-índice';
	@override String get clear_sky => 'Céu limpo';
	@override String get k_24 => '24 horas';
	@override String get no_weather_card => 'Adicione uma cidade';
	@override String get drizzle => 'Garoa';
	@override String get humidity => 'Umidade';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Funções';
	@override String get cities => 'Cidades';
	@override String get southeast => 'Sudeste';
	@override String get validate_number => 'Por favor escreva um número válido';
	@override String get city => 'Cidade';
	@override String get uv_high => 'Alto';
	@override String get time => 'Clima na cidade';
	@override String get uv_low => 'Baixo';
	@override String get name3 => 'Entre em Contato Conosco';
	@override String get apparent_temperature_min => 'Temperatura aparente mínima';
	@override String get direction => 'Direção';
	@override String get heavy_rains => 'Chuva pesada';
	@override String get apparent_temperature_max => 'Temperatura aparente máxima';
	@override String get k_12 => '12 horas';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Tem certeza que deseja descartar suas alterações?';
	@override String get notifications => 'Notificações';
	@override String get mph => 'mph';
	@override String get west => 'Oeste';
	@override String get validate90 => 'Valor deve estar entre -90 and 90';
	@override String get name2 => 'Design Conveniente';
	@override String get feels => 'Sensação';
	@override String get precipitation_probability => 'Probabilidade de precipitação';
	@override String get license => 'Licenças';
	@override String get widget_background => 'Fundo do widget';
	@override String get large_element => 'Exibição grande do clima';
	@override String get unsaved_changes => 'Alterações não salvas';
	@override String get drizzling_rain => 'Chuva fraca';
	@override String get cloudy => 'Nublado';
	@override String get widget => 'Widget';
	@override String get precipitation => 'Precipitação';
	@override String get delete => 'Deletar';
	@override String get deleted_cache_store => 'Limpando cache';
	@override String get map => 'Mapa';
	@override String get description3 => 'Se você encontrar algum problema, entre em contato conosco por e-mail ou nas avaliações do aplicativo.';
	@override String get north => 'Norte';
	@override String get measurements => 'Sistema de medidas';
	@override String get start => 'Iniciar';
	@override String get settings_full => 'Configurações';
	@override String get high => 'Alto';
	@override String get daily_variables => 'Variáveis meteorológicas diárias';
	@override String get low => 'Baixo';
	@override String get on_inter => 'Conecte-se a internet para atualizar os dados de clima.';
	@override String get thunderstorm => 'Tempestade';
	@override String get version => 'Versão do aplicativo';
	@override String get project => 'Projeto em';
	@override String get amoled_theme => 'AMOLED-tema';
	@override String get deleted_card_weather_query => 'Você tem certeza que deseja remover esta cidade?';
	@override String get northeast => 'Nordeste';
	@override String get add_widget => 'Adicionar widget';
	@override String get fog => 'Névoa';
	@override String get description2 => 'Toda a navegação é projetada para interagir com o aplicativo da maneira mais conveniente e rápida possível.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Sem dados';
	@override String get search_city => 'Procure sua cidade';
	@override String get weather_more => 'Previsão do tempo para 12 dias';
	@override String get round_degree => 'Arredondar graus';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'Pesquise ou insira dados da cidade manualmente';
	@override String get validate_name => 'Por favor escreva um nome';
	@override String get sunrise => 'Nascer do sol';
	@override String get km => 'km';
	@override String get district => 'Distrito';
	@override String get southwest => 'Sudoeste';
	@override String get degrees => 'Graus';
	@override String get clear_cache_store => 'Limpar cache';
	@override String get skip => 'Pular';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Aparência';
	@override String get time_start => 'Hora de início';
	@override String get ready => 'Pronto';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'Tem certeza de que deseja limpar o cache?';
	@override String get widget_text => 'Texto do widget';
	@override String get support => 'Suporte';
	@override String get groups => 'Nossos grupos';
	@override String get system => 'Sistema';
	@override String get sunset => 'Pôr do sol';
	@override String get dewpoint => 'Ponto de orvalho';
	@override String get shortwave_radiation => 'Radiação de ondas curtas';
	@override String get language => 'Idioma';
	@override String get hide_map => 'Ocultar mapa';
	@override String get cancel => 'Cancelar';
	@override String get loading => 'Carregando...';
	@override String get timeformat => 'Formato de hora';
	@override String get lat => 'Latitude';
	@override String get data => 'Dados';
	@override String get visibility => 'Visibilidade';
	@override String get deleted_card_weather => 'Deletando a cidade';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Habilite a localização para obter dados de clima do local atual.';
	@override String get create => 'Criar';
	@override String get edit => 'Editar';
	@override String get search => 'Pesquisar...';
	@override String get uv_extreme => 'Extremo';
	@override String get light => 'Claro';
	@override String get cloudcover => 'Сobertura de nuvens';
	@override String get uv_very_high => 'Muito alto';
	@override String get snow => 'Neve';
	@override String get done => 'Concluído';
	@override String get theme => 'Tema';
	@override String get name => 'Clima';
	@override String get time_range => 'Frequência (em horas)';
	@override String get about_app => 'Sobre o app';
	@override String get save => 'Salvar';
	@override String get evaporation => 'Evapotranspirações';
	@override String get freezing_rain => 'Chuva congelante';
	@override String get uv_average => 'Moderado';
	@override String get reset_color => 'Redefinir para padrão';
	@override String get metric => 'Métrico';
	@override String get overcast => 'Encoberto';
	@override String get pressure => 'Pressão';
	@override String get inch => 'inch';
	@override String get imperial => 'Imperial';
	@override String get location => 'Localização';
	@override String get error_occurred => 'Ocorreu um erro';
	@override String get validate_value => 'Por favor escreva um valor';
	@override String get lon => 'Longitude';
	@override String get wind => 'Vento';
	@override String get normal => 'Normal';
	@override String get dark => 'Escuro';
	@override String get settings => 'Configurações.';
	@override String get south => 'Sul';
	@override String get windgusts => 'Rajadas';
	@override String get northwest => 'Noroeste';
	@override String get open_meteo => 'Dados do Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Chuva';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Valor deve estar entre -180 and 180';
	@override String get description => 'Aplicativo de previsão do tempo com previsão atualizada para cada hora, dia e semana para qualquer local.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Cores Dinâmicas';
	@override String get confirm => 'Salvar';
	@override String get no_results => 'Nenhum resultado';
	@override String get cities_load_error => 'Falha ao carregar cidades';
	@override String get retry => 'Tentar novamente';
}

/// The flat map containing all translations for locale <pt-BR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPtBr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Sem conexão',
			'edit_city_hint' => 'Editar informações da cidade',
			'location_not_found' => 'Não foi possível determinar sua localização',
			'mi' => 'mi',
			'next' => 'Próximo',
			'discard' => 'Descartar',
			'east' => 'Leste',
			'time_end' => 'Hora de término',
			'search_method' => 'Use a pesquisa ou a geolocalização',
			'hourly_variables' => 'Variáveis meteorológicas horárias',
			'uv_index' => 'UV-índice',
			'clear_sky' => 'Céu limpo',
			'k_24' => '24 horas',
			'no_weather_card' => 'Adicione uma cidade',
			'drizzle' => 'Garoa',
			'humidity' => 'Umidade',
			'telegram' => 'Telegram',
			'functions' => 'Funções',
			'cities' => 'Cidades',
			'southeast' => 'Sudeste',
			'validate_number' => 'Por favor escreva um número válido',
			'city' => 'Cidade',
			'uv_high' => 'Alto',
			'time' => 'Clima na cidade',
			'uv_low' => 'Baixo',
			'name3' => 'Entre em Contato Conosco',
			'apparent_temperature_min' => 'Temperatura aparente mínima',
			'direction' => 'Direção',
			'heavy_rains' => 'Chuva pesada',
			'apparent_temperature_max' => 'Temperatura aparente máxima',
			'k_12' => '12 horas',
			'discord' => 'Discord',
			'discard_changes' => 'Tem certeza que deseja descartar suas alterações?',
			'notifications' => 'Notificações',
			'mph' => 'mph',
			'west' => 'Oeste',
			'validate90' => 'Valor deve estar entre -90 and 90',
			'name2' => 'Design Conveniente',
			'feels' => 'Sensação',
			'precipitation_probability' => 'Probabilidade de precipitação',
			'license' => 'Licenças',
			'widget_background' => 'Fundo do widget',
			'large_element' => 'Exibição grande do clima',
			'unsaved_changes' => 'Alterações não salvas',
			'drizzling_rain' => 'Chuva fraca',
			'cloudy' => 'Nublado',
			'widget' => 'Widget',
			'precipitation' => 'Precipitação',
			'delete' => 'Deletar',
			'deleted_cache_store' => 'Limpando cache',
			'map' => 'Mapa',
			'description3' => 'Se você encontrar algum problema, entre em contato conosco por e-mail ou nas avaliações do aplicativo.',
			'north' => 'Norte',
			'measurements' => 'Sistema de medidas',
			'start' => 'Iniciar',
			'settings_full' => 'Configurações',
			'high' => 'Alto',
			'daily_variables' => 'Variáveis meteorológicas diárias',
			'low' => 'Baixo',
			'on_inter' => 'Conecte-se a internet para atualizar os dados de clima.',
			'thunderstorm' => 'Tempestade',
			'version' => 'Versão do aplicativo',
			'project' => 'Projeto em',
			'amoled_theme' => 'AMOLED-tema',
			'deleted_card_weather_query' => 'Você tem certeza que deseja remover esta cidade?',
			'northeast' => 'Nordeste',
			'add_widget' => 'Adicionar widget',
			'fog' => 'Névoa',
			'description2' => 'Toda a navegação é projetada para interagir com o aplicativo da maneira mais conveniente e rápida possível.',
			'mm' => 'mm',
			'no_desc_data' => 'Sem dados',
			'search_city' => 'Procure sua cidade',
			'weather_more' => 'Previsão do tempo para 12 dias',
			'round_degree' => 'Arredondar graus',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'Pesquise ou insira dados da cidade manualmente',
			'validate_name' => 'Por favor escreva um nome',
			'sunrise' => 'Nascer do sol',
			'km' => 'km',
			'district' => 'Distrito',
			'southwest' => 'Sudoeste',
			'degrees' => 'Graus',
			'clear_cache_store' => 'Limpar cache',
			'skip' => 'Pular',
			'h_pa' => 'hPa',
			'appearance' => 'Aparência',
			'time_start' => 'Hora de início',
			'ready' => 'Pronto',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Tem certeza de que deseja limpar o cache?',
			'widget_text' => 'Texto do widget',
			'support' => 'Suporte',
			'groups' => 'Nossos grupos',
			'system' => 'Sistema',
			'sunset' => 'Pôr do sol',
			'dewpoint' => 'Ponto de orvalho',
			'shortwave_radiation' => 'Radiação de ondas curtas',
			'language' => 'Idioma',
			'hide_map' => 'Ocultar mapa',
			'cancel' => 'Cancelar',
			'loading' => 'Carregando...',
			'timeformat' => 'Formato de hora',
			'lat' => 'Latitude',
			'data' => 'Dados',
			'visibility' => 'Visibilidade',
			'deleted_card_weather' => 'Deletando a cidade',
			'celsius' => 'Celsius',
			'no_location' => 'Habilite a localização para obter dados de clima do local atual.',
			'create' => 'Criar',
			'edit' => 'Editar',
			'search' => 'Pesquisar...',
			'uv_extreme' => 'Extremo',
			'light' => 'Claro',
			'cloudcover' => 'Сobertura de nuvens',
			'uv_very_high' => 'Muito alto',
			'snow' => 'Neve',
			'done' => 'Concluído',
			'theme' => 'Tema',
			'name' => 'Clima',
			'time_range' => 'Frequência (em horas)',
			'about_app' => 'Sobre o app',
			'save' => 'Salvar',
			'evaporation' => 'Evapotranspirações',
			'freezing_rain' => 'Chuva congelante',
			'uv_average' => 'Moderado',
			'reset_color' => 'Redefinir para padrão',
			'metric' => 'Métrico',
			'overcast' => 'Encoberto',
			'pressure' => 'Pressão',
			'inch' => 'inch',
			'imperial' => 'Imperial',
			'location' => 'Localização',
			'error_occurred' => 'Ocorreu um erro',
			'validate_value' => 'Por favor escreva um valor',
			'lon' => 'Longitude',
			'wind' => 'Vento',
			'normal' => 'Normal',
			'dark' => 'Escuro',
			'settings' => 'Configurações.',
			'south' => 'Sul',
			'windgusts' => 'Rajadas',
			'northwest' => 'Noroeste',
			'open_meteo' => 'Dados do Open-Meteo (CC-BY 4.0)',
			'rain' => 'Chuva',
			'mm_hg' => 'mmHg',
			'validate180' => 'Valor deve estar entre -180 and 180',
			'description' => 'Aplicativo de previsão do tempo com previsão atualizada para cada hora, dia e semana para qualquer local.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Cores Dinâmicas',
			'confirm' => 'Salvar',
			'no_results' => 'Nenhum resultado',
			'cities_load_error' => 'Falha ao carregar cidades',
			'retry' => 'Tentar novamente',
			_ => null,
		};
	}
}
