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
	@override String get no_desc_data => 'データなし';
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
			'no_desc_data' => 'データなし',
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
			_ => null,
		};
	}
}
