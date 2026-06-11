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
class TranslationsJaJp extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJaJp({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.jaJp,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja-JP>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsJaJp _root = this; // ignore: unused_field

	@override 
	TranslationsJaJp $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJaJp(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'インターネット未接続';
	@override String get edit_city_hint => '都市情報を編集';
	@override String get location_not_found => '現在地を特定できません';
	@override String get mi => 'mi';
	@override String get next => '次へ';
	@override String get discard => '破棄';
	@override String get east => '東';
	@override String get time_end => '終了時刻';
	@override String get search_method => '検索または現在地';
	@override String get hourly_variables => '時間別気象変数';
	@override String get uv_index => 'UV指数';
	@override String get clear_sky => '快晴';
	@override String get k_24 => '24時間制';
	@override String get no_weather_card => '都市を追加';
	@override String get drizzle => '霧雨';
	@override String get humidity => '湿度';
	@override String get telegram => 'Telegram';
	@override String get functions => '機能';
	@override String get cities => '都市';
	@override String get southeast => '南東';
	@override String get validate_number => '有効な数値を入力してください';
	@override String get city => '都市';
	@override String get uv_high => '高い';
	@override String get time => '現地時刻';
	@override String get uv_low => '低い';
	@override String get name3 => 'お問い合わせ';
	@override String get apparent_temperature_min => '最低体感温度';
	@override String get direction => '風向';
	@override String get heavy_rains => 'にわか雨';
	@override String get apparent_temperature_max => '最高体感温度';
	@override String get k_12 => '12時間制';
	@override String get discord => 'Discord';
	@override String get discard_changes => '変更を破棄しますか？';
	@override String get notifications => '通知';
	@override String get mph => 'mph';
	@override String get west => '西';
	@override String get validate90 => '値は -90 〜 90 の範囲で入力してください';
	@override String get name2 => '使いやすいデザイン';
	@override String get feels => '体感';
	@override String get precipitation_probability => '降水確率';
	@override String get license => 'ライセンス';
	@override String get widget_background => 'ウィジェット背景';
	@override String get large_element => '天気の大画面表示';
	@override String get unsaved_changes => '未保存の変更';
	@override String get drizzling_rain => '凍結霧雨';
	@override String get cloudy => '曇り';
	@override String get widget => 'ウィジェット';
	@override String get precipitation => '降水量';
	@override String get delete => '削除';
	@override String get deleted_cache_store => 'キャッシュを削除中';
	@override String get map => 'マップ';
	@override String get description3 => '問題が発生した場合は、メールまたはアプリのレビューからお問い合わせください。';
	@override String get north => '北';
	@override String get measurements => '単位系';
	@override String get start => 'はじめる';
	@override String get settings_full => '設定';
	@override String get high => '高';
	@override String get daily_variables => '日別気象変数';
	@override String get low => '低';
	@override String get on_inter => '気象データを取得するにはインターネットをオンにしてください。';
	@override String get thunderstorm => '雷雨';
	@override String get version => 'アプリバージョン';
	@override String get project => 'プロジェクト';
	@override String get amoled_theme => 'AMOLEDテーマ';
	@override String get deleted_card_weather_query => 'この都市を削除しますか？';
	@override String get northeast => '北東';
	@override String get add_widget => 'ウィジェットを追加';
	@override String get fog => '霧';
	@override String get description2 => 'できる限り快適・迅速に操作できるよう、すべてのナビゲーションが設計されています。';
	@override String get mm => 'mm';
	@override String get search_city => '都市を検索';
	@override String get weather_more => '12日間の天気予報';
	@override String get round_degree => '気温を丸める';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => '都市を検索または手動で入力';
	@override String get validate_name => '名前を入力してください';
	@override String get sunrise => '日の出';
	@override String get km => 'km';
	@override String get district => '地区';
	@override String get southwest => '南西';
	@override String get degrees => '度数';
	@override String get clear_cache_store => 'キャッシュを削除';
	@override String get skip => 'スキップ';
	@override String get h_pa => 'hPa';
	@override String get appearance => '外観';
	@override String get time_start => '開始時刻';
	@override String get ready => '完了';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => 'キャッシュを削除しますか？';
	@override String get widget_text => 'ウィジェットテキスト';
	@override String get support => '寄付';
	@override String get groups => 'コミュニティ';
	@override String get system => 'システム';
	@override String get sunset => '日の入り';
	@override String get dewpoint => '露点';
	@override String get shortwave_radiation => '短波放射';
	@override String get language => '言語';
	@override String get hide_map => 'マップを非表示';
	@override String get cancel => 'キャンセル';
	@override String get loading => '読み込み中...';
	@override String get timeformat => '時刻形式';
	@override String get lat => '緯度';
	@override String get data => 'データ';
	@override String get visibility => '視程';
	@override String get deleted_card_weather => '都市を削除';
	@override String get celsius => '摂氏';
	@override String get no_location => '現在地の天気を取得するには位置情報サービスを有効にしてください。';
	@override String get create => '作成';
	@override String get edit => '編集';
	@override String get search => '検索...';
	@override String get uv_extreme => '極めて高い';
	@override String get light => 'ライト';
	@override String get cloudcover => '雲量';
	@override String get uv_very_high => '非常に高い';
	@override String get snow => '雪';
	@override String get done => '完了';
	@override String get theme => 'テーマ';
	@override String get name => '天気';
	@override String get time_range => '頻度（時間単位）';
	@override String get about_app => 'アプリについて';
	@override String get save => '保存';
	@override String get evaporation => '蒸発散量';
	@override String get freezing_rain => '凍雨';
	@override String get uv_average => '中程度';
	@override String get reset_color => 'デフォルトに戻す';
	@override String get metric => 'メートル法';
	@override String get overcast => '厚い曇り';
	@override String get pressure => '気圧';
	@override String get inch => 'inch';
	@override String get imperial => 'ヤード・ポンド法';
	@override String get location => '現在地';
	@override String get error_occurred => 'エラーが発生しました';
	@override String get validate_value => '値を入力してください';
	@override String get lon => '経度';
	@override String get wind => '風速';
	@override String get normal => '標準';
	@override String get dark => 'ダーク';
	@override String get settings => '設定';
	@override String get south => '南';
	@override String get windgusts => '突風';
	@override String get northwest => '北西';
	@override String get open_meteo => 'データ提供: Open-Meteo (CC-BY 4.0)';
	@override String get rain => '雨';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => '値は -180 〜 180 の範囲で入力してください';
	@override String get description => '場所を問わず、毎時・毎日・毎週の最新予報を表示する天気アプリです。';
	@override String get fahrenheit => '華氏';
	@override String get m_s => 'm/s';
	@override String get material_color => 'ダイナミックカラー';
	@override String get confirm => '保存';
	@override String get no_results => '結果がありません';
	@override String get cities_load_error => '都市を読み込めませんでした';
	@override String get retry => '再試行';
	@override String get city_not_found => '都市が見つかりません';
	@override String get air_quality => '大気質';
	@override String get aqi_standard => 'AQI基準';
	@override String get aqi_european => '欧州AQI';
	@override String get aqi_american => '米国AQI';
	@override String get aqi_good => '良好';
	@override String get aqi_fair => '普通';
	@override String get aqi_moderate => '中程度';
	@override String get aqi_poor => '悪い';
	@override String get aqi_very_poor => '非常に悪い';
	@override String get aqi_extremely_poor => '極めて悪い';
	@override String get aqi_unhealthy_sensitive => '敏感な人には不健康';
	@override String get aqi_unhealthy => '不健康';
	@override String get aqi_very_unhealthy => '非常に不健康';
	@override String get aqi_hazardous => '危険';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => '欧州';
	@override String get american => '米国';
	@override String get aqi_advice_good => '屋外活動に適した空気です。';
	@override String get aqi_advice_fair => '概ね問題ありません。敏感な方は長時間の屋外運動を控えてください。';
	@override String get aqi_advice_moderate => '敏感な方は屋外での時間を減らすことをおすすめします。';
	@override String get aqi_advice_poor => '特に敏感な方は屋外活動を控えめにしてください。';
	@override String get aqi_advice_very_poor => '長時間の屋外運動は避けてください。健康への影響が出る可能性があります。';
	@override String get aqi_advice_extremely_poor => '可能であれば屋内に留まってください。屋外活動はおすすめしません。';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => '汚染物質';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => '更新';
	@override String get app_font => 'フォント';
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

/// The flat map containing all translations for locale <ja-JP>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJaJp {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'インターネット未接続',
			'edit_city_hint' => '都市情報を編集',
			'location_not_found' => '現在地を特定できません',
			'mi' => 'mi',
			'next' => '次へ',
			'discard' => '破棄',
			'east' => '東',
			'time_end' => '終了時刻',
			'search_method' => '検索または現在地',
			'hourly_variables' => '時間別気象変数',
			'uv_index' => 'UV指数',
			'clear_sky' => '快晴',
			'k_24' => '24時間制',
			'no_weather_card' => '都市を追加',
			'drizzle' => '霧雨',
			'humidity' => '湿度',
			'telegram' => 'Telegram',
			'functions' => '機能',
			'cities' => '都市',
			'southeast' => '南東',
			'validate_number' => '有効な数値を入力してください',
			'city' => '都市',
			'uv_high' => '高い',
			'time' => '現地時刻',
			'uv_low' => '低い',
			'name3' => 'お問い合わせ',
			'apparent_temperature_min' => '最低体感温度',
			'direction' => '風向',
			'heavy_rains' => 'にわか雨',
			'apparent_temperature_max' => '最高体感温度',
			'k_12' => '12時間制',
			'discord' => 'Discord',
			'discard_changes' => '変更を破棄しますか？',
			'notifications' => '通知',
			'mph' => 'mph',
			'west' => '西',
			'validate90' => '値は -90 〜 90 の範囲で入力してください',
			'name2' => '使いやすいデザイン',
			'feels' => '体感',
			'precipitation_probability' => '降水確率',
			'license' => 'ライセンス',
			'widget_background' => 'ウィジェット背景',
			'large_element' => '天気の大画面表示',
			'unsaved_changes' => '未保存の変更',
			'drizzling_rain' => '凍結霧雨',
			'cloudy' => '曇り',
			'widget' => 'ウィジェット',
			'precipitation' => '降水量',
			'delete' => '削除',
			'deleted_cache_store' => 'キャッシュを削除中',
			'map' => 'マップ',
			'description3' => '問題が発生した場合は、メールまたはアプリのレビューからお問い合わせください。',
			'north' => '北',
			'measurements' => '単位系',
			'start' => 'はじめる',
			'settings_full' => '設定',
			'high' => '高',
			'daily_variables' => '日別気象変数',
			'low' => '低',
			'on_inter' => '気象データを取得するにはインターネットをオンにしてください。',
			'thunderstorm' => '雷雨',
			'version' => 'アプリバージョン',
			'project' => 'プロジェクト',
			'amoled_theme' => 'AMOLEDテーマ',
			'deleted_card_weather_query' => 'この都市を削除しますか？',
			'northeast' => '北東',
			'add_widget' => 'ウィジェットを追加',
			'fog' => '霧',
			'description2' => 'できる限り快適・迅速に操作できるよう、すべてのナビゲーションが設計されています。',
			'mm' => 'mm',
			'search_city' => '都市を検索',
			'weather_more' => '12日間の天気予報',
			'round_degree' => '気温を丸める',
			'w_m2' => 'W/m2',
			'create_city_hint' => '都市を検索または手動で入力',
			'validate_name' => '名前を入力してください',
			'sunrise' => '日の出',
			'km' => 'km',
			'district' => '地区',
			'southwest' => '南西',
			'degrees' => '度数',
			'clear_cache_store' => 'キャッシュを削除',
			'skip' => 'スキップ',
			'h_pa' => 'hPa',
			'appearance' => '外観',
			'time_start' => '開始時刻',
			'ready' => '完了',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'キャッシュを削除しますか？',
			'widget_text' => 'ウィジェットテキスト',
			'support' => '寄付',
			'groups' => 'コミュニティ',
			'system' => 'システム',
			'sunset' => '日の入り',
			'dewpoint' => '露点',
			'shortwave_radiation' => '短波放射',
			'language' => '言語',
			'hide_map' => 'マップを非表示',
			'cancel' => 'キャンセル',
			'loading' => '読み込み中...',
			'timeformat' => '時刻形式',
			'lat' => '緯度',
			'data' => 'データ',
			'visibility' => '視程',
			'deleted_card_weather' => '都市を削除',
			'celsius' => '摂氏',
			'no_location' => '現在地の天気を取得するには位置情報サービスを有効にしてください。',
			'create' => '作成',
			'edit' => '編集',
			'search' => '検索...',
			'uv_extreme' => '極めて高い',
			'light' => 'ライト',
			'cloudcover' => '雲量',
			'uv_very_high' => '非常に高い',
			'snow' => '雪',
			'done' => '完了',
			'theme' => 'テーマ',
			'name' => '天気',
			'time_range' => '頻度（時間単位）',
			'about_app' => 'アプリについて',
			'save' => '保存',
			'evaporation' => '蒸発散量',
			'freezing_rain' => '凍雨',
			'uv_average' => '中程度',
			'reset_color' => 'デフォルトに戻す',
			'metric' => 'メートル法',
			'overcast' => '厚い曇り',
			'pressure' => '気圧',
			'inch' => 'inch',
			'imperial' => 'ヤード・ポンド法',
			'location' => '現在地',
			'error_occurred' => 'エラーが発生しました',
			'validate_value' => '値を入力してください',
			'lon' => '経度',
			'wind' => '風速',
			'normal' => '標準',
			'dark' => 'ダーク',
			'settings' => '設定',
			'south' => '南',
			'windgusts' => '突風',
			'northwest' => '北西',
			'open_meteo' => 'データ提供: Open-Meteo (CC-BY 4.0)',
			'rain' => '雨',
			'mm_hg' => 'mmHg',
			'validate180' => '値は -180 〜 180 の範囲で入力してください',
			'description' => '場所を問わず、毎時・毎日・毎週の最新予報を表示する天気アプリです。',
			'fahrenheit' => '華氏',
			'm_s' => 'm/s',
			'material_color' => 'ダイナミックカラー',
			'confirm' => '保存',
			'no_results' => '結果がありません',
			'cities_load_error' => '都市を読み込めませんでした',
			'retry' => '再試行',
			'city_not_found' => '都市が見つかりません',
			'air_quality' => '大気質',
			'aqi_standard' => 'AQI基準',
			'aqi_european' => '欧州AQI',
			'aqi_american' => '米国AQI',
			'aqi_good' => '良好',
			'aqi_fair' => '普通',
			'aqi_moderate' => '中程度',
			'aqi_poor' => '悪い',
			'aqi_very_poor' => '非常に悪い',
			'aqi_extremely_poor' => '極めて悪い',
			'aqi_unhealthy_sensitive' => '敏感な人には不健康',
			'aqi_unhealthy' => '不健康',
			'aqi_very_unhealthy' => '非常に不健康',
			'aqi_hazardous' => '危険',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => '欧州',
			'american' => '米国',
			'aqi_advice_good' => '屋外活動に適した空気です。',
			'aqi_advice_fair' => '概ね問題ありません。敏感な方は長時間の屋外運動を控えてください。',
			'aqi_advice_moderate' => '敏感な方は屋外での時間を減らすことをおすすめします。',
			'aqi_advice_poor' => '特に敏感な方は屋外活動を控えめにしてください。',
			'aqi_advice_very_poor' => '長時間の屋外運動は避けてください。健康への影響が出る可能性があります。',
			'aqi_advice_extremely_poor' => '可能であれば屋内に留まってください。屋外活動はおすすめしません。',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => '汚染物質',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => '更新',
			'app_font' => 'フォント',
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
