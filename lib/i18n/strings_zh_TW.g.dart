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
class TranslationsZhTw extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-TW>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhTw _root = this; // ignore: unused_field

	@override 
	TranslationsZhTw $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhTw(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => '沒有網路連線';
	@override String get edit_city_hint => '編輯城市資訊';
	@override String get location_not_found => '無法確定您的位置';
	@override String get mi => '英里';
	@override String get next => '下一步';
	@override String get discard => '放棄';
	@override String get east => '東';
	@override String get time_end => '終止時間';
	@override String get search_method => '使用搜尋或地理位置';
	@override String get hourly_variables => '每小時天氣變量';
	@override String get uv_index => 'UV值';
	@override String get clear_sky => '晴朗';
	@override String get k_24 => '24小時';
	@override String get no_weather_card => '新增城市';
	@override String get drizzle => '毛毛雨';
	@override String get humidity => '濕度';
	@override String get telegram => 'Telegram';
	@override String get functions => '功能';
	@override String get cities => '城市';
	@override String get southeast => '東南';
	@override String get validate_number => '請輸入一個有效數字';
	@override String get city => '城市';
	@override String get uv_high => '高';
	@override String get time => '城市時間';
	@override String get uv_low => '低';
	@override String get name3 => '聯絡我們';
	@override String get apparent_temperature_min => '最低體感溫度';
	@override String get direction => '風向';
	@override String get heavy_rains => '大雨';
	@override String get apparent_temperature_max => '最高體感溫度';
	@override String get k_12 => '12小時';
	@override String get discord => 'Discord';
	@override String get discard_changes => '確定要放棄變更嗎？';
	@override String get notifications => '通知';
	@override String get mph => '英里/時';
	@override String get west => '西';
	@override String get validate90 => '數值必須在-90和90之間';
	@override String get name2 => '方便優雅的設計';
	@override String get feels => '體感';
	@override String get precipitation_probability => '降水概率';
	@override String get license => '許可證';
	@override String get widget_background => '小組件背景';
	@override String get large_element => '大型天氣顯示';
	@override String get unsaved_changes => '未儲存的變更';
	@override String get drizzling_rain => '冻雾雨';
	@override String get cloudy => '多雲';
	@override String get widget => '小組件';
	@override String get precipitation => '降水量';
	@override String get delete => '刪除';
	@override String get deleted_cache_store => '正在清除快取';
	@override String get map => '地圖';
	@override String get description3 => '如遇到問題請透過電郵或軟體評論與我們聯絡';
	@override String get north => '北';
	@override String get measurements => '度量單位';
	@override String get start => '開始使用';
	@override String get settings_full => '設定';
	@override String get high => '高';
	@override String get daily_variables => '每日天氣變量';
	@override String get low => '低';
	@override String get on_inter => '啟用網路以獲取氣象資料。';
	@override String get thunderstorm => '雷暴';
	@override String get version => '應用版本';
	@override String get project => '造訪我們的';
	@override String get amoled_theme => 'AMOLED主題';
	@override String get deleted_card_weather_query => '你確定要刪除這個城市嗎？';
	@override String get northeast => '東北';
	@override String get add_widget => '新增小工具';
	@override String get fog => '霧';
	@override String get description2 => '所有導覽均設計得盡可能方便交互';
	@override String get mm => '毫米';
	@override String get no_desc_data => '無數據';
	@override String get search_city => '查找你的所在地';
	@override String get weather_more => '12天天氣預報';
	@override String get round_degree => '四捨五入度數';
	@override String get w_m2 => '瓦/平方米';
	@override String get create_city_hint => '搜尋或手動輸入城市資料';
	@override String get validate_name => '請輸入名稱';
	@override String get sunrise => '日出';
	@override String get km => '公里';
	@override String get district => '區';
	@override String get southwest => '西南';
	@override String get degrees => '度';
	@override String get clear_cache_store => '清除快取';
	@override String get skip => '略過';
	@override String get h_pa => '百帕';
	@override String get appearance => '外觀';
	@override String get time_start => '起始時間';
	@override String get ready => '完成';
	@override String get kph => '公里/時';
	@override String get deleted_cache_store_query => '您確定要清除快取嗎？';
	@override String get widget_text => '小組件文字';
	@override String get support => '支援';
	@override String get groups => '我們的小組';
	@override String get system => '系統';
	@override String get sunset => '日落';
	@override String get dewpoint => '露點';
	@override String get shortwave_radiation => '短波輻射';
	@override String get language => '語言';
	@override String get hide_map => '隱藏地圖';
	@override String get cancel => '取消';
	@override String get loading => '載入中……';
	@override String get timeformat => '時間格式';
	@override String get lat => '維度';
	@override String get data => '資料';
	@override String get visibility => '可見度';
	@override String get deleted_card_weather => '刪除城市';
	@override String get celsius => '攝氏度';
	@override String get no_location => '啟用位置服務以獲取當前位置的天氣資訊。';
	@override String get create => '建立';
	@override String get edit => '編輯';
	@override String get search => '搜尋……';
	@override String get uv_extreme => '超高';
	@override String get light => '明亮';
	@override String get cloudcover => '雲量';
	@override String get uv_very_high => '很高';
	@override String get snow => '雪';
	@override String get done => '完成';
	@override String get theme => '主題';
	@override String get name => '天氣';
	@override String get time_range => '頻率(小時)';
	@override String get about_app => '關於應用';
	@override String get save => '儲存';
	@override String get evaporation => '蒸發量';
	@override String get freezing_rain => '凍雨';
	@override String get uv_average => '中等';
	@override String get reset_color => '重設為預設值';
	@override String get metric => '公制';
	@override String get overcast => '陰天';
	@override String get pressure => '氣壓';
	@override String get inch => '英呎';
	@override String get imperial => '英制';
	@override String get location => '位置';
	@override String get error_occurred => '發生錯誤';
	@override String get validate_value => '請輸入一個值';
	@override String get lon => '精度';
	@override String get wind => '風速';
	@override String get normal => '正常';
	@override String get dark => '黑暗';
	@override String get settings => '設定';
	@override String get south => '南';
	@override String get windgusts => '陣風';
	@override String get northwest => '西北';
	@override String get open_meteo => '來自Open-Meteo的數據 (CC-BY 4.0)';
	@override String get rain => '雨';
	@override String get mm_hg => '毫米汞柱';
	@override String get validate180 => '數值必須在-180和180之間';
	@override String get description => '一個提供實時天氣資訊的天氣軟體。';
	@override String get fahrenheit => '華氏度';
	@override String get m_s => '米/秒';
	@override String get material_color => '動態取色';
	@override String get confirm => '儲存';
	@override String get no_results => '沒有結果';
}

/// The flat map containing all translations for locale <zh-TW>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhTw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => '沒有網路連線',
			'edit_city_hint' => '編輯城市資訊',
			'location_not_found' => '無法確定您的位置',
			'mi' => '英里',
			'next' => '下一步',
			'discard' => '放棄',
			'east' => '東',
			'time_end' => '終止時間',
			'search_method' => '使用搜尋或地理位置',
			'hourly_variables' => '每小時天氣變量',
			'uv_index' => 'UV值',
			'clear_sky' => '晴朗',
			'k_24' => '24小時',
			'no_weather_card' => '新增城市',
			'drizzle' => '毛毛雨',
			'humidity' => '濕度',
			'telegram' => 'Telegram',
			'functions' => '功能',
			'cities' => '城市',
			'southeast' => '東南',
			'validate_number' => '請輸入一個有效數字',
			'city' => '城市',
			'uv_high' => '高',
			'time' => '城市時間',
			'uv_low' => '低',
			'name3' => '聯絡我們',
			'apparent_temperature_min' => '最低體感溫度',
			'direction' => '風向',
			'heavy_rains' => '大雨',
			'apparent_temperature_max' => '最高體感溫度',
			'k_12' => '12小時',
			'discord' => 'Discord',
			'discard_changes' => '確定要放棄變更嗎？',
			'notifications' => '通知',
			'mph' => '英里/時',
			'west' => '西',
			'validate90' => '數值必須在-90和90之間',
			'name2' => '方便優雅的設計',
			'feels' => '體感',
			'precipitation_probability' => '降水概率',
			'license' => '許可證',
			'widget_background' => '小組件背景',
			'large_element' => '大型天氣顯示',
			'unsaved_changes' => '未儲存的變更',
			'drizzling_rain' => '冻雾雨',
			'cloudy' => '多雲',
			'widget' => '小組件',
			'precipitation' => '降水量',
			'delete' => '刪除',
			'deleted_cache_store' => '正在清除快取',
			'map' => '地圖',
			'description3' => '如遇到問題請透過電郵或軟體評論與我們聯絡',
			'north' => '北',
			'measurements' => '度量單位',
			'start' => '開始使用',
			'settings_full' => '設定',
			'high' => '高',
			'daily_variables' => '每日天氣變量',
			'low' => '低',
			'on_inter' => '啟用網路以獲取氣象資料。',
			'thunderstorm' => '雷暴',
			'version' => '應用版本',
			'project' => '造訪我們的',
			'amoled_theme' => 'AMOLED主題',
			'deleted_card_weather_query' => '你確定要刪除這個城市嗎？',
			'northeast' => '東北',
			'add_widget' => '新增小工具',
			'fog' => '霧',
			'description2' => '所有導覽均設計得盡可能方便交互',
			'mm' => '毫米',
			'no_desc_data' => '無數據',
			'search_city' => '查找你的所在地',
			'weather_more' => '12天天氣預報',
			'round_degree' => '四捨五入度數',
			'w_m2' => '瓦/平方米',
			'create_city_hint' => '搜尋或手動輸入城市資料',
			'validate_name' => '請輸入名稱',
			'sunrise' => '日出',
			'km' => '公里',
			'district' => '區',
			'southwest' => '西南',
			'degrees' => '度',
			'clear_cache_store' => '清除快取',
			'skip' => '略過',
			'h_pa' => '百帕',
			'appearance' => '外觀',
			'time_start' => '起始時間',
			'ready' => '完成',
			'kph' => '公里/時',
			'deleted_cache_store_query' => '您確定要清除快取嗎？',
			'widget_text' => '小組件文字',
			'support' => '支援',
			'groups' => '我們的小組',
			'system' => '系統',
			'sunset' => '日落',
			'dewpoint' => '露點',
			'shortwave_radiation' => '短波輻射',
			'language' => '語言',
			'hide_map' => '隱藏地圖',
			'cancel' => '取消',
			'loading' => '載入中……',
			'timeformat' => '時間格式',
			'lat' => '維度',
			'data' => '資料',
			'visibility' => '可見度',
			'deleted_card_weather' => '刪除城市',
			'celsius' => '攝氏度',
			'no_location' => '啟用位置服務以獲取當前位置的天氣資訊。',
			'create' => '建立',
			'edit' => '編輯',
			'search' => '搜尋……',
			'uv_extreme' => '超高',
			'light' => '明亮',
			'cloudcover' => '雲量',
			'uv_very_high' => '很高',
			'snow' => '雪',
			'done' => '完成',
			'theme' => '主題',
			'name' => '天氣',
			'time_range' => '頻率(小時)',
			'about_app' => '關於應用',
			'save' => '儲存',
			'evaporation' => '蒸發量',
			'freezing_rain' => '凍雨',
			'uv_average' => '中等',
			'reset_color' => '重設為預設值',
			'metric' => '公制',
			'overcast' => '陰天',
			'pressure' => '氣壓',
			'inch' => '英呎',
			'imperial' => '英制',
			'location' => '位置',
			'error_occurred' => '發生錯誤',
			'validate_value' => '請輸入一個值',
			'lon' => '精度',
			'wind' => '風速',
			'normal' => '正常',
			'dark' => '黑暗',
			'settings' => '設定',
			'south' => '南',
			'windgusts' => '陣風',
			'northwest' => '西北',
			'open_meteo' => '來自Open-Meteo的數據 (CC-BY 4.0)',
			'rain' => '雨',
			'mm_hg' => '毫米汞柱',
			'validate180' => '數值必須在-180和180之間',
			'description' => '一個提供實時天氣資訊的天氣軟體。',
			'fahrenheit' => '華氏度',
			'm_s' => '米/秒',
			'material_color' => '動態取色',
			'confirm' => '儲存',
			'no_results' => '沒有結果',
			_ => null,
		};
	}
}
