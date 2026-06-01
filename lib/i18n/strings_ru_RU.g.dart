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
class TranslationsRuRu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRuRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ruRu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru-RU>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRuRu _root = this; // ignore: unused_field

	@override 
	TranslationsRuRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRuRu(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Нет интернета';
	@override String get edit_city_hint => 'Редактировать информацию о городе';
	@override String get location_not_found => 'Не удалось определить ваше местоположение';
	@override String get mi => 'миль';
	@override String get next => 'Далее';
	@override String get discard => 'Отменить';
	@override String get east => 'Восток';
	@override String get time_end => 'Время окончания';
	@override String get search_method => 'Воспользуйтесь поиском или геолокацией';
	@override String get hourly_variables => 'Почасовые погодные условия';
	@override String get uv_index => 'УФ-индекс';
	@override String get clear_sky => 'Чистое небо';
	@override String get k_24 => '24-часовой';
	@override String get no_weather_card => 'Добавьте город';
	@override String get drizzle => 'Морось';
	@override String get humidity => 'Влажность';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Функции';
	@override String get cities => 'Города';
	@override String get southeast => 'Юго-восток';
	@override String get validate_number => 'Пожалуйста, введите число';
	@override String get city => 'Город';
	@override String get uv_high => 'Высокий';
	@override String get time => 'Время в городе';
	@override String get uv_low => 'Низкий';
	@override String get name3 => 'Связаться с нами';
	@override String get apparent_temperature_min => 'Минимальная ощущаемая температура';
	@override String get direction => 'Направление';
	@override String get heavy_rains => 'Ливневые дожди';
	@override String get apparent_temperature_max => 'Максимальная ощущаемая температура';
	@override String get k_12 => '12-часовой';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Вы уверены, что хотите отменить изменения?';
	@override String get notifications => 'Уведомления';
	@override String get mph => 'миль/ч';
	@override String get west => 'Запад';
	@override String get validate90 => 'Значение должно быть в диапазоне от -90 до 90';
	@override String get name2 => 'Удобный дизайн';
	@override String get feels => 'Ощущается';
	@override String get precipitation_probability => 'Вероятность выпадения осадков';
	@override String get license => 'Лицензии';
	@override String get widget_background => 'Фон виджета';
	@override String get large_element => 'Отображение погоды большим элементом';
	@override String get unsaved_changes => 'Несохранённые изменения';
	@override String get drizzling_rain => 'Моросящий дождь';
	@override String get cloudy => 'Облачно';
	@override String get widget => 'Виджет';
	@override String get precipitation => 'Осадки';
	@override String get delete => 'Удалить';
	@override String get deleted_cache_store => 'Очистка кэша';
	@override String get map => 'Карта';
	@override String get description3 => 'Если у вас возникнут какие-либо проблемы, пожалуйста, свяжитесь с нами по электронной почте или в отзывах приложения.';
	@override String get north => 'Север';
	@override String get measurements => 'Система мер';
	@override String get start => 'Начать';
	@override String get settings_full => 'Настройки';
	@override String get high => 'Высокое';
	@override String get daily_variables => 'Ежедневные погодные условия';
	@override String get low => 'Низкое';
	@override String get on_inter => 'Включите интернет для получения метеорологических данных.';
	@override String get thunderstorm => 'Гроза';
	@override String get version => 'Версия приложения';
	@override String get project => 'Проект на';
	@override String get amoled_theme => 'AMOLED-тема';
	@override String get deleted_card_weather_query => 'Вы уверены, что хотите удалить город?';
	@override String get northeast => 'Северо-восток';
	@override String get add_widget => 'Добавить виджет';
	@override String get fog => 'Туман';
	@override String get description2 => 'Вся навигация сделана таким образом, чтобы можно было взаимодействовать с приложением максимально удобно и быстро.';
	@override String get mm => 'мм';
	@override String get no_desc_data => 'Нет данных';
	@override String get search_city => 'Найдите свой город';
	@override String get weather_more => 'Прогноз погоды на 12 дней';
	@override String get round_degree => 'Округлить градусы';
	@override String get w_m2 => 'Вт/м2';
	@override String get create_city_hint => 'Найдите или введите данные города вручную';
	@override String get validate_name => 'Пожалуйста, введите название';
	@override String get sunrise => 'Рассвет';
	@override String get km => 'км';
	@override String get district => 'Район';
	@override String get southwest => 'Юго-запад';
	@override String get degrees => 'Градусы';
	@override String get clear_cache_store => 'Очистить кэш';
	@override String get skip => 'Пропустить';
	@override String get h_pa => 'гПа';
	@override String get appearance => 'Внешний вид';
	@override String get time_start => 'Время начала';
	@override String get ready => 'Готово';
	@override String get kph => 'км/ч';
	@override String get deleted_cache_store_query => 'Вы уверены, что хотите очистить кэш?';
	@override String get widget_text => 'Текст виджета';
	@override String get support => 'Поддержка';
	@override String get groups => 'Наши группы';
	@override String get system => 'Системная';
	@override String get sunset => 'Закат';
	@override String get dewpoint => 'Точка росы';
	@override String get shortwave_radiation => 'Коротковолновое излучение';
	@override String get language => 'Язык';
	@override String get hide_map => 'Скрыть карту';
	@override String get cancel => 'Отмена';
	@override String get loading => 'Загрузка...';
	@override String get timeformat => 'Формат времени';
	@override String get lat => 'Широта';
	@override String get data => 'Данные';
	@override String get visibility => 'Видимость';
	@override String get deleted_card_weather => 'Удаление города';
	@override String get celsius => 'Цельсия';
	@override String get no_location => 'Включите службу определения местоположения для получения метеорологических данных для текущего местоположения.';
	@override String get create => 'Создание';
	@override String get edit => 'Редактирование';
	@override String get search => 'Поиск...';
	@override String get uv_extreme => 'Экстремальный';
	@override String get light => 'Светлая';
	@override String get cloudcover => 'Облачный покров';
	@override String get uv_very_high => 'Очень высокий';
	@override String get snow => 'Снег';
	@override String get done => 'Готово';
	@override String get theme => 'Тема';
	@override String get name => 'Погода';
	@override String get time_range => 'Периодичность (в часах)';
	@override String get about_app => 'О приложении';
	@override String get save => 'Сохранить';
	@override String get evaporation => 'Испарения';
	@override String get freezing_rain => 'Ледяной дождь';
	@override String get uv_average => 'Умеренный';
	@override String get reset_color => 'Сбросить по умолчанию';
	@override String get metric => 'Метрическая';
	@override String get overcast => 'Пасмурно';
	@override String get pressure => 'Давление';
	@override String get inch => 'дюйм';
	@override String get imperial => 'Имперская';
	@override String get location => 'Местоположение';
	@override String get error_occurred => 'Произошла ошибка';
	@override String get validate_value => 'Пожалуйста, введите значение';
	@override String get lon => 'Долгота';
	@override String get wind => 'Ветер';
	@override String get normal => 'Нормальное';
	@override String get dark => 'Тёмная';
	@override String get settings => 'Настр.';
	@override String get south => 'Юг';
	@override String get windgusts => 'Шквал';
	@override String get northwest => 'Северо-запад';
	@override String get open_meteo => 'Данные от Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Дождь';
	@override String get mm_hg => 'мм рт. ст.';
	@override String get validate180 => 'Значение должно быть в диапазоне от -180 до 180';
	@override String get description => 'Приложение погоды с актуальным прогнозом на каждый час, день и неделю для любого места.';
	@override String get fahrenheit => 'Фаренгейта';
	@override String get m_s => 'м/с';
	@override String get material_color => 'Динамические цвета';
	@override String get confirm => 'Сохранить';
	@override String get no_results => 'Ничего не найдено';
}

/// The flat map containing all translations for locale <ru-RU>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRuRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Нет интернета',
			'edit_city_hint' => 'Редактировать информацию о городе',
			'location_not_found' => 'Не удалось определить ваше местоположение',
			'mi' => 'миль',
			'next' => 'Далее',
			'discard' => 'Отменить',
			'east' => 'Восток',
			'time_end' => 'Время окончания',
			'search_method' => 'Воспользуйтесь поиском или геолокацией',
			'hourly_variables' => 'Почасовые погодные условия',
			'uv_index' => 'УФ-индекс',
			'clear_sky' => 'Чистое небо',
			'k_24' => '24-часовой',
			'no_weather_card' => 'Добавьте город',
			'drizzle' => 'Морось',
			'humidity' => 'Влажность',
			'telegram' => 'Telegram',
			'functions' => 'Функции',
			'cities' => 'Города',
			'southeast' => 'Юго-восток',
			'validate_number' => 'Пожалуйста, введите число',
			'city' => 'Город',
			'uv_high' => 'Высокий',
			'time' => 'Время в городе',
			'uv_low' => 'Низкий',
			'name3' => 'Связаться с нами',
			'apparent_temperature_min' => 'Минимальная ощущаемая температура',
			'direction' => 'Направление',
			'heavy_rains' => 'Ливневые дожди',
			'apparent_temperature_max' => 'Максимальная ощущаемая температура',
			'k_12' => '12-часовой',
			'discord' => 'Discord',
			'discard_changes' => 'Вы уверены, что хотите отменить изменения?',
			'notifications' => 'Уведомления',
			'mph' => 'миль/ч',
			'west' => 'Запад',
			'validate90' => 'Значение должно быть в диапазоне от -90 до 90',
			'name2' => 'Удобный дизайн',
			'feels' => 'Ощущается',
			'precipitation_probability' => 'Вероятность выпадения осадков',
			'license' => 'Лицензии',
			'widget_background' => 'Фон виджета',
			'large_element' => 'Отображение погоды большим элементом',
			'unsaved_changes' => 'Несохранённые изменения',
			'drizzling_rain' => 'Моросящий дождь',
			'cloudy' => 'Облачно',
			'widget' => 'Виджет',
			'precipitation' => 'Осадки',
			'delete' => 'Удалить',
			'deleted_cache_store' => 'Очистка кэша',
			'map' => 'Карта',
			'description3' => 'Если у вас возникнут какие-либо проблемы, пожалуйста, свяжитесь с нами по электронной почте или в отзывах приложения.',
			'north' => 'Север',
			'measurements' => 'Система мер',
			'start' => 'Начать',
			'settings_full' => 'Настройки',
			'high' => 'Высокое',
			'daily_variables' => 'Ежедневные погодные условия',
			'low' => 'Низкое',
			'on_inter' => 'Включите интернет для получения метеорологических данных.',
			'thunderstorm' => 'Гроза',
			'version' => 'Версия приложения',
			'project' => 'Проект на',
			'amoled_theme' => 'AMOLED-тема',
			'deleted_card_weather_query' => 'Вы уверены, что хотите удалить город?',
			'northeast' => 'Северо-восток',
			'add_widget' => 'Добавить виджет',
			'fog' => 'Туман',
			'description2' => 'Вся навигация сделана таким образом, чтобы можно было взаимодействовать с приложением максимально удобно и быстро.',
			'mm' => 'мм',
			'no_desc_data' => 'Нет данных',
			'search_city' => 'Найдите свой город',
			'weather_more' => 'Прогноз погоды на 12 дней',
			'round_degree' => 'Округлить градусы',
			'w_m2' => 'Вт/м2',
			'create_city_hint' => 'Найдите или введите данные города вручную',
			'validate_name' => 'Пожалуйста, введите название',
			'sunrise' => 'Рассвет',
			'km' => 'км',
			'district' => 'Район',
			'southwest' => 'Юго-запад',
			'degrees' => 'Градусы',
			'clear_cache_store' => 'Очистить кэш',
			'skip' => 'Пропустить',
			'h_pa' => 'гПа',
			'appearance' => 'Внешний вид',
			'time_start' => 'Время начала',
			'ready' => 'Готово',
			'kph' => 'км/ч',
			'deleted_cache_store_query' => 'Вы уверены, что хотите очистить кэш?',
			'widget_text' => 'Текст виджета',
			'support' => 'Поддержка',
			'groups' => 'Наши группы',
			'system' => 'Системная',
			'sunset' => 'Закат',
			'dewpoint' => 'Точка росы',
			'shortwave_radiation' => 'Коротковолновое излучение',
			'language' => 'Язык',
			'hide_map' => 'Скрыть карту',
			'cancel' => 'Отмена',
			'loading' => 'Загрузка...',
			'timeformat' => 'Формат времени',
			'lat' => 'Широта',
			'data' => 'Данные',
			'visibility' => 'Видимость',
			'deleted_card_weather' => 'Удаление города',
			'celsius' => 'Цельсия',
			'no_location' => 'Включите службу определения местоположения для получения метеорологических данных для текущего местоположения.',
			'create' => 'Создание',
			'edit' => 'Редактирование',
			'search' => 'Поиск...',
			'uv_extreme' => 'Экстремальный',
			'light' => 'Светлая',
			'cloudcover' => 'Облачный покров',
			'uv_very_high' => 'Очень высокий',
			'snow' => 'Снег',
			'done' => 'Готово',
			'theme' => 'Тема',
			'name' => 'Погода',
			'time_range' => 'Периодичность (в часах)',
			'about_app' => 'О приложении',
			'save' => 'Сохранить',
			'evaporation' => 'Испарения',
			'freezing_rain' => 'Ледяной дождь',
			'uv_average' => 'Умеренный',
			'reset_color' => 'Сбросить по умолчанию',
			'metric' => 'Метрическая',
			'overcast' => 'Пасмурно',
			'pressure' => 'Давление',
			'inch' => 'дюйм',
			'imperial' => 'Имперская',
			'location' => 'Местоположение',
			'error_occurred' => 'Произошла ошибка',
			'validate_value' => 'Пожалуйста, введите значение',
			'lon' => 'Долгота',
			'wind' => 'Ветер',
			'normal' => 'Нормальное',
			'dark' => 'Тёмная',
			'settings' => 'Настр.',
			'south' => 'Юг',
			'windgusts' => 'Шквал',
			'northwest' => 'Северо-запад',
			'open_meteo' => 'Данные от Open-Meteo (CC-BY 4.0)',
			'rain' => 'Дождь',
			'mm_hg' => 'мм рт. ст.',
			'validate180' => 'Значение должно быть в диапазоне от -180 до 180',
			'description' => 'Приложение погоды с актуальным прогнозом на каждый час, день и неделю для любого места.',
			'fahrenheit' => 'Фаренгейта',
			'm_s' => 'м/с',
			'material_color' => 'Динамические цвета',
			'confirm' => 'Сохранить',
			'no_results' => 'Ничего не найдено',
			_ => null,
		};
	}
}
