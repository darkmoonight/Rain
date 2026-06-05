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
class TranslationsZhCn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => '无网络连接';
	@override String get edit_city_hint => '编辑城市信息';
	@override String get location_not_found => '无法确定您的位置';
	@override String get mi => '英里';
	@override String get next => '下一步';
	@override String get discard => '放弃';
	@override String get east => '东';
	@override String get time_end => '结束时间';
	@override String get search_method => '使用搜索或地理定位';
	@override String get hourly_variables => '每小时天气变量';
	@override String get uv_index => '紫外线指数';
	@override String get clear_sky => '晴朗';
	@override String get k_24 => '24小时制';
	@override String get no_weather_card => '添加城市';
	@override String get drizzle => '毛毛雨';
	@override String get humidity => '湿度';
	@override String get telegram => 'Telegram';
	@override String get functions => '功能';
	@override String get cities => '城市';
	@override String get southeast => '东南';
	@override String get validate_number => '请输入有效数字';
	@override String get city => '城市';
	@override String get uv_high => '高';
	@override String get time => '城市时间';
	@override String get uv_low => '低';
	@override String get name3 => '联系我们';
	@override String get apparent_temperature_min => '最低体感温度';
	@override String get direction => '风向';
	@override String get heavy_rains => '阵雨';
	@override String get apparent_temperature_max => '最高体感温度';
	@override String get k_12 => '12小时制';
	@override String get discord => 'Discord';
	@override String get discard_changes => '确定要放弃更改吗？';
	@override String get notifications => '通知';
	@override String get mph => '英里/小时';
	@override String get west => '西';
	@override String get validate90 => '值必须介于-90和90之间';
	@override String get name2 => '方便的设计';
	@override String get feels => '体感温度';
	@override String get precipitation_probability => '降水概率';
	@override String get license => '许可证';
	@override String get widget_background => '小部件背景';
	@override String get large_element => '大天气显示';
	@override String get unsaved_changes => '未保存的更改';
	@override String get drizzling_rain => '冻毛毛雨';
	@override String get cloudy => '多云';
	@override String get widget => '小部件';
	@override String get precipitation => '降水量';
	@override String get delete => '删除';
	@override String get deleted_cache_store => '正在清除缓存';
	@override String get map => '地图';
	@override String get description3 => '如果您遇到任何问题，请通过电子邮件或应用评论与我们联系。';
	@override String get north => '北';
	@override String get measurements => '度量系统';
	@override String get start => '开始';
	@override String get settings_full => '设置';
	@override String get high => '最高';
	@override String get daily_variables => '每日天气变量';
	@override String get low => '最低';
	@override String get on_inter => '打开网络连接以获取气象数据。';
	@override String get thunderstorm => '雷暴';
	@override String get version => '应用程序版本';
	@override String get project => '项目使用';
	@override String get amoled_theme => 'AMOLED主题';
	@override String get deleted_card_weather_query => '确定要删除该城市吗？';
	@override String get northeast => '东北';
	@override String get add_widget => '添加小部件';
	@override String get fog => '雾';
	@override String get description2 => '所有导航均设计成能够尽可能方便快捷地与应用程序交互。';
	@override String get mm => '毫米';
	@override String get no_desc_data => '无数据';
	@override String get search_city => '查找城市';
	@override String get weather_more => '12天天气预报';
	@override String get round_degree => '四舍五入度数';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => '搜索或手动输入城市数据';
	@override String get validate_name => '请输入名称';
	@override String get sunrise => '日出';
	@override String get km => '千米';
	@override String get district => '区域';
	@override String get southwest => '西南';
	@override String get degrees => '度';
	@override String get clear_cache_store => '清除缓存';
	@override String get skip => '跳过';
	@override String get h_pa => '百帕';
	@override String get appearance => '外观';
	@override String get time_start => '开始时间';
	@override String get ready => '完成';
	@override String get kph => '千米/小时';
	@override String get deleted_cache_store_query => '您确定要清除缓存吗？';
	@override String get widget_text => '小部件文本';
	@override String get support => '支持';
	@override String get groups => '我们的组';
	@override String get system => '系统';
	@override String get sunset => '日落';
	@override String get dewpoint => '露点';
	@override String get shortwave_radiation => '短波辐射';
	@override String get language => '语言';
	@override String get hide_map => '隐藏地图';
	@override String get cancel => '取消';
	@override String get loading => '加载中...';
	@override String get timeformat => '时间格式';
	@override String get lat => '纬度';
	@override String get data => '数据';
	@override String get visibility => '能见度';
	@override String get deleted_card_weather => '删除城市';
	@override String get celsius => '摄氏度';
	@override String get no_location => '启用定位服务以获取当前位置的天气数据。';
	@override String get create => '创建';
	@override String get edit => '编辑';
	@override String get search => '搜索...';
	@override String get uv_extreme => '极高';
	@override String get light => '亮';
	@override String get cloudcover => '云量';
	@override String get uv_very_high => '很高';
	@override String get snow => '雪';
	@override String get done => '完成';
	@override String get theme => '主题';
	@override String get name => '天气';
	@override String get time_range => '频率（小时）';
	@override String get about_app => '关于应用';
	@override String get save => '保存';
	@override String get evaporation => '蒸发量';
	@override String get freezing_rain => '冻雨';
	@override String get uv_average => '中等';
	@override String get reset_color => '重置为默认值';
	@override String get metric => '公制';
	@override String get overcast => '阴天';
	@override String get pressure => '气压';
	@override String get inch => '英寸';
	@override String get imperial => '英制';
	@override String get location => '位置';
	@override String get error_occurred => '发生错误';
	@override String get validate_value => '请输入值';
	@override String get lon => '经度';
	@override String get wind => '风速';
	@override String get normal => '正常';
	@override String get dark => '暗';
	@override String get settings => '设置';
	@override String get south => '南';
	@override String get windgusts => '阵风';
	@override String get northwest => '西北';
	@override String get open_meteo => '来自Open-Meteo的数据 (CC-BY 4.0)';
	@override String get rain => '雨';
	@override String get mm_hg => '毫米汞柱';
	@override String get validate180 => '值必须介于-180和180之间';
	@override String get description => '天气应用，提供每小时、每天和每周的实时预报，适用于任何地点。';
	@override String get fahrenheit => '华氏度';
	@override String get m_s => '米/秒';
	@override String get material_color => '动态颜色';
	@override String get confirm => '保存';
	@override String get no_results => '无结果';
	@override String get cities_load_error => '无法加载城市';
	@override String get retry => '重试';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => '无网络连接',
			'edit_city_hint' => '编辑城市信息',
			'location_not_found' => '无法确定您的位置',
			'mi' => '英里',
			'next' => '下一步',
			'discard' => '放弃',
			'east' => '东',
			'time_end' => '结束时间',
			'search_method' => '使用搜索或地理定位',
			'hourly_variables' => '每小时天气变量',
			'uv_index' => '紫外线指数',
			'clear_sky' => '晴朗',
			'k_24' => '24小时制',
			'no_weather_card' => '添加城市',
			'drizzle' => '毛毛雨',
			'humidity' => '湿度',
			'telegram' => 'Telegram',
			'functions' => '功能',
			'cities' => '城市',
			'southeast' => '东南',
			'validate_number' => '请输入有效数字',
			'city' => '城市',
			'uv_high' => '高',
			'time' => '城市时间',
			'uv_low' => '低',
			'name3' => '联系我们',
			'apparent_temperature_min' => '最低体感温度',
			'direction' => '风向',
			'heavy_rains' => '阵雨',
			'apparent_temperature_max' => '最高体感温度',
			'k_12' => '12小时制',
			'discord' => 'Discord',
			'discard_changes' => '确定要放弃更改吗？',
			'notifications' => '通知',
			'mph' => '英里/小时',
			'west' => '西',
			'validate90' => '值必须介于-90和90之间',
			'name2' => '方便的设计',
			'feels' => '体感温度',
			'precipitation_probability' => '降水概率',
			'license' => '许可证',
			'widget_background' => '小部件背景',
			'large_element' => '大天气显示',
			'unsaved_changes' => '未保存的更改',
			'drizzling_rain' => '冻毛毛雨',
			'cloudy' => '多云',
			'widget' => '小部件',
			'precipitation' => '降水量',
			'delete' => '删除',
			'deleted_cache_store' => '正在清除缓存',
			'map' => '地图',
			'description3' => '如果您遇到任何问题，请通过电子邮件或应用评论与我们联系。',
			'north' => '北',
			'measurements' => '度量系统',
			'start' => '开始',
			'settings_full' => '设置',
			'high' => '最高',
			'daily_variables' => '每日天气变量',
			'low' => '最低',
			'on_inter' => '打开网络连接以获取气象数据。',
			'thunderstorm' => '雷暴',
			'version' => '应用程序版本',
			'project' => '项目使用',
			'amoled_theme' => 'AMOLED主题',
			'deleted_card_weather_query' => '确定要删除该城市吗？',
			'northeast' => '东北',
			'add_widget' => '添加小部件',
			'fog' => '雾',
			'description2' => '所有导航均设计成能够尽可能方便快捷地与应用程序交互。',
			'mm' => '毫米',
			'no_desc_data' => '无数据',
			'search_city' => '查找城市',
			'weather_more' => '12天天气预报',
			'round_degree' => '四舍五入度数',
			'w_m2' => 'W/m2',
			'create_city_hint' => '搜索或手动输入城市数据',
			'validate_name' => '请输入名称',
			'sunrise' => '日出',
			'km' => '千米',
			'district' => '区域',
			'southwest' => '西南',
			'degrees' => '度',
			'clear_cache_store' => '清除缓存',
			'skip' => '跳过',
			'h_pa' => '百帕',
			'appearance' => '外观',
			'time_start' => '开始时间',
			'ready' => '完成',
			'kph' => '千米/小时',
			'deleted_cache_store_query' => '您确定要清除缓存吗？',
			'widget_text' => '小部件文本',
			'support' => '支持',
			'groups' => '我们的组',
			'system' => '系统',
			'sunset' => '日落',
			'dewpoint' => '露点',
			'shortwave_radiation' => '短波辐射',
			'language' => '语言',
			'hide_map' => '隐藏地图',
			'cancel' => '取消',
			'loading' => '加载中...',
			'timeformat' => '时间格式',
			'lat' => '纬度',
			'data' => '数据',
			'visibility' => '能见度',
			'deleted_card_weather' => '删除城市',
			'celsius' => '摄氏度',
			'no_location' => '启用定位服务以获取当前位置的天气数据。',
			'create' => '创建',
			'edit' => '编辑',
			'search' => '搜索...',
			'uv_extreme' => '极高',
			'light' => '亮',
			'cloudcover' => '云量',
			'uv_very_high' => '很高',
			'snow' => '雪',
			'done' => '完成',
			'theme' => '主题',
			'name' => '天气',
			'time_range' => '频率（小时）',
			'about_app' => '关于应用',
			'save' => '保存',
			'evaporation' => '蒸发量',
			'freezing_rain' => '冻雨',
			'uv_average' => '中等',
			'reset_color' => '重置为默认值',
			'metric' => '公制',
			'overcast' => '阴天',
			'pressure' => '气压',
			'inch' => '英寸',
			'imperial' => '英制',
			'location' => '位置',
			'error_occurred' => '发生错误',
			'validate_value' => '请输入值',
			'lon' => '经度',
			'wind' => '风速',
			'normal' => '正常',
			'dark' => '暗',
			'settings' => '设置',
			'south' => '南',
			'windgusts' => '阵风',
			'northwest' => '西北',
			'open_meteo' => '来自Open-Meteo的数据 (CC-BY 4.0)',
			'rain' => '雨',
			'mm_hg' => '毫米汞柱',
			'validate180' => '值必须介于-180和180之间',
			'description' => '天气应用，提供每小时、每天和每周的实时预报，适用于任何地点。',
			'fahrenheit' => '华氏度',
			'm_s' => '米/秒',
			'material_color' => '动态颜色',
			'confirm' => '保存',
			'no_results' => '无结果',
			'cities_load_error' => '无法加载城市',
			'retry' => '重试',
			_ => null,
		};
	}
}
