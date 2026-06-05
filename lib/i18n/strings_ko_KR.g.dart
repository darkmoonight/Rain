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
class TranslationsKoKr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKoKr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.koKr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko-KR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKoKr _root = this; // ignore: unused_field

	@override 
	TranslationsKoKr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKoKr(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => '인터넷 없음';
	@override String get edit_city_hint => '도시 정보 편집';
	@override String get location_not_found => '위치 확인 불가';
	@override String get mi => 'mi';
	@override String get next => '다음';
	@override String get discard => '취소';
	@override String get east => '동';
	@override String get time_end => '종료 시간';
	@override String get search_method => '검색 또는 지리적 위치를 사용하세요';
	@override String get hourly_variables => '시간별 날씨 변수';
	@override String get uv_index => 'UV 정도';
	@override String get clear_sky => '맑음';
	@override String get k_24 => '24시간';
	@override String get no_weather_card => '도시를 추가하세요';
	@override String get drizzle => '이슬비';
	@override String get humidity => '습도';
	@override String get telegram => '텔레그램';
	@override String get functions => '기능';
	@override String get cities => '도시';
	@override String get southeast => '남동';
	@override String get validate_number => '올바른 숫자를 입력해주세요';
	@override String get city => '도시';
	@override String get uv_high => '높은';
	@override String get time => '도시 시간';
	@override String get uv_low => '낮음';
	@override String get name3 => '문의하기';
	@override String get apparent_temperature_min => '최저 기온';
	@override String get direction => '풍향';
	@override String get heavy_rains => '폭우';
	@override String get apparent_temperature_max => '최고 기온';
	@override String get k_12 => '12시간';
	@override String get discord => '디스코드';
	@override String get discard_changes => '변경사항을 취소하시겠습니까?';
	@override String get notifications => '알림';
	@override String get mph => 'mph';
	@override String get west => '서';
	@override String get validate90 => '-90과 90 사이의 값만 가능합니다';
	@override String get name2 => '편리한 디자인';
	@override String get feels => '체감 온도';
	@override String get precipitation_probability => '깅수 확률';
	@override String get license => '라이선스';
	@override String get widget_background => '위젯 배경';
	@override String get large_element => '큰 날씨 표시';
	@override String get unsaved_changes => '저장되지 않은 변경';
	@override String get drizzling_rain => '얼어붙은 이슬비';
	@override String get cloudy => '구름 조금';
	@override String get widget => '위젯';
	@override String get precipitation => '강수량';
	@override String get delete => '삭제';
	@override String get deleted_cache_store => '캐시 삭제 중';
	@override String get map => '지도';
	@override String get description3 => '어떤 오류가 발생했다면, 이메일 또는 앱 리뷰로 문의해주세요.';
	@override String get north => '북';
	@override String get measurements => '표시 방식';
	@override String get start => '시작하기';
	@override String get settings_full => '설정';
	@override String get high => '높음';
	@override String get daily_variables => '일별 날씨 변수';
	@override String get low => '낮음';
	@override String get on_inter => '현재 위치에 대한 정보를 얻기 위해서는 인터넷이 필요합니다.';
	@override String get thunderstorm => '천둥번개';
	@override String get version => '버전';
	@override String get project => '프로젝트 위치:';
	@override String get amoled_theme => 'AMOLED-테마';
	@override String get deleted_card_weather_query => '정말로 이 도시를 삭제하시겠나요?';
	@override String get northeast => '북동';
	@override String get add_widget => '위젯 추가';
	@override String get fog => '안개';
	@override String get description2 => '모든 내비게이션은 가능한 한 편리하고 빠르게 애플리케이션과 상호 작용하도록 설계되었습니다.';
	@override String get mm => 'mm';
	@override String get no_desc_data => '데이터 없음';
	@override String get search_city => '도시를 찾아보세요';
	@override String get weather_more => '12일 일기 예보';
	@override String get round_degree => '온도 반올림';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => '도시 데이터를 검색하거나 수동으로 입력하세요';
	@override String get validate_name => '이름을 입력해주세요';
	@override String get sunrise => '일출';
	@override String get km => 'km';
	@override String get district => '지역';
	@override String get southwest => '남서';
	@override String get degrees => '도';
	@override String get clear_cache_store => '캐시 지우기';
	@override String get skip => '건너뛰기';
	@override String get h_pa => 'hPa';
	@override String get appearance => '디자인';
	@override String get time_start => '시작 시간';
	@override String get ready => '준비됨';
	@override String get kph => 'km/h';
	@override String get deleted_cache_store_query => '캐시를 정말로 지우시겠습니까?';
	@override String get widget_text => '위젯 텍스트';
	@override String get support => '후원하기';
	@override String get groups => '우리 그룹';
	@override String get system => '시스템';
	@override String get sunset => '일몰';
	@override String get dewpoint => '이슬점';
	@override String get shortwave_radiation => '단파 복사';
	@override String get language => '언어';
	@override String get hide_map => '지도를 숨기기';
	@override String get cancel => '취소';
	@override String get loading => '로딩 중...';
	@override String get timeformat => '시간 형식';
	@override String get lat => '위도';
	@override String get data => '데이터';
	@override String get visibility => '가시거리';
	@override String get deleted_card_weather => '도시 삭제하기';
	@override String get celsius => '섭씨';
	@override String get no_location => '현재 위치에 대한 정보를 얻기 위해서는 위치 서비스를 활성화해야 합니다.';
	@override String get create => '만들기';
	@override String get edit => '편집';
	@override String get search => '검색...';
	@override String get uv_extreme => '엄청남!';
	@override String get light => '밝은';
	@override String get cloudcover => '구름';
	@override String get uv_very_high => '매우 높음';
	@override String get snow => '눈';
	@override String get done => '완료';
	@override String get theme => '테마';
	@override String get name => '날씨';
	@override String get time_range => '빈도 (시간 단위)';
	@override String get about_app => '앱 정보';
	@override String get save => '저장';
	@override String get evaporation => '증발량';
	@override String get freezing_rain => '얼어붙는 비';
	@override String get uv_average => '보통';
	@override String get reset_color => '기본값으로 재설정';
	@override String get metric => '미터';
	@override String get overcast => '구름 많음';
	@override String get pressure => '기압';
	@override String get inch => '인치';
	@override String get imperial => '인치';
	@override String get location => '위치';
	@override String get error_occurred => '오류가 발생했습니다';
	@override String get validate_value => '값을 입력해주세요';
	@override String get lon => '경도';
	@override String get wind => '풍속';
	@override String get normal => '보통';
	@override String get dark => '어두운';
	@override String get settings => '설정';
	@override String get south => '남';
	@override String get windgusts => '돌풍';
	@override String get northwest => '북서';
	@override String get open_meteo => 'Open-Meteo의 데이터 (CC-BY 4.0)';
	@override String get rain => '비';
	@override String get mm_hg => '밀리미터 수은주';
	@override String get validate180 => '-180과 180 사이의 값만 가능합니다';
	@override String get description => '어떤 곳이든, 어느 순간이든, 날씨를 확인하세요.';
	@override String get fahrenheit => '화씨';
	@override String get m_s => '미터/초';
	@override String get material_color => '동적 색상';
	@override String get confirm => '저장';
	@override String get no_results => '결과 없음';
	@override String get cities_load_error => '도시를 불러오지 못했습니다';
	@override String get retry => '다시 시도';
}

/// The flat map containing all translations for locale <ko-KR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKoKr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => '인터넷 없음',
			'edit_city_hint' => '도시 정보 편집',
			'location_not_found' => '위치 확인 불가',
			'mi' => 'mi',
			'next' => '다음',
			'discard' => '취소',
			'east' => '동',
			'time_end' => '종료 시간',
			'search_method' => '검색 또는 지리적 위치를 사용하세요',
			'hourly_variables' => '시간별 날씨 변수',
			'uv_index' => 'UV 정도',
			'clear_sky' => '맑음',
			'k_24' => '24시간',
			'no_weather_card' => '도시를 추가하세요',
			'drizzle' => '이슬비',
			'humidity' => '습도',
			'telegram' => '텔레그램',
			'functions' => '기능',
			'cities' => '도시',
			'southeast' => '남동',
			'validate_number' => '올바른 숫자를 입력해주세요',
			'city' => '도시',
			'uv_high' => '높은',
			'time' => '도시 시간',
			'uv_low' => '낮음',
			'name3' => '문의하기',
			'apparent_temperature_min' => '최저 기온',
			'direction' => '풍향',
			'heavy_rains' => '폭우',
			'apparent_temperature_max' => '최고 기온',
			'k_12' => '12시간',
			'discord' => '디스코드',
			'discard_changes' => '변경사항을 취소하시겠습니까?',
			'notifications' => '알림',
			'mph' => 'mph',
			'west' => '서',
			'validate90' => '-90과 90 사이의 값만 가능합니다',
			'name2' => '편리한 디자인',
			'feels' => '체감 온도',
			'precipitation_probability' => '깅수 확률',
			'license' => '라이선스',
			'widget_background' => '위젯 배경',
			'large_element' => '큰 날씨 표시',
			'unsaved_changes' => '저장되지 않은 변경',
			'drizzling_rain' => '얼어붙은 이슬비',
			'cloudy' => '구름 조금',
			'widget' => '위젯',
			'precipitation' => '강수량',
			'delete' => '삭제',
			'deleted_cache_store' => '캐시 삭제 중',
			'map' => '지도',
			'description3' => '어떤 오류가 발생했다면, 이메일 또는 앱 리뷰로 문의해주세요.',
			'north' => '북',
			'measurements' => '표시 방식',
			'start' => '시작하기',
			'settings_full' => '설정',
			'high' => '높음',
			'daily_variables' => '일별 날씨 변수',
			'low' => '낮음',
			'on_inter' => '현재 위치에 대한 정보를 얻기 위해서는 인터넷이 필요합니다.',
			'thunderstorm' => '천둥번개',
			'version' => '버전',
			'project' => '프로젝트 위치:',
			'amoled_theme' => 'AMOLED-테마',
			'deleted_card_weather_query' => '정말로 이 도시를 삭제하시겠나요?',
			'northeast' => '북동',
			'add_widget' => '위젯 추가',
			'fog' => '안개',
			'description2' => '모든 내비게이션은 가능한 한 편리하고 빠르게 애플리케이션과 상호 작용하도록 설계되었습니다.',
			'mm' => 'mm',
			'no_desc_data' => '데이터 없음',
			'search_city' => '도시를 찾아보세요',
			'weather_more' => '12일 일기 예보',
			'round_degree' => '온도 반올림',
			'w_m2' => 'W/m2',
			'create_city_hint' => '도시 데이터를 검색하거나 수동으로 입력하세요',
			'validate_name' => '이름을 입력해주세요',
			'sunrise' => '일출',
			'km' => 'km',
			'district' => '지역',
			'southwest' => '남서',
			'degrees' => '도',
			'clear_cache_store' => '캐시 지우기',
			'skip' => '건너뛰기',
			'h_pa' => 'hPa',
			'appearance' => '디자인',
			'time_start' => '시작 시간',
			'ready' => '준비됨',
			'kph' => 'km/h',
			'deleted_cache_store_query' => '캐시를 정말로 지우시겠습니까?',
			'widget_text' => '위젯 텍스트',
			'support' => '후원하기',
			'groups' => '우리 그룹',
			'system' => '시스템',
			'sunset' => '일몰',
			'dewpoint' => '이슬점',
			'shortwave_radiation' => '단파 복사',
			'language' => '언어',
			'hide_map' => '지도를 숨기기',
			'cancel' => '취소',
			'loading' => '로딩 중...',
			'timeformat' => '시간 형식',
			'lat' => '위도',
			'data' => '데이터',
			'visibility' => '가시거리',
			'deleted_card_weather' => '도시 삭제하기',
			'celsius' => '섭씨',
			'no_location' => '현재 위치에 대한 정보를 얻기 위해서는 위치 서비스를 활성화해야 합니다.',
			'create' => '만들기',
			'edit' => '편집',
			'search' => '검색...',
			'uv_extreme' => '엄청남!',
			'light' => '밝은',
			'cloudcover' => '구름',
			'uv_very_high' => '매우 높음',
			'snow' => '눈',
			'done' => '완료',
			'theme' => '테마',
			'name' => '날씨',
			'time_range' => '빈도 (시간 단위)',
			'about_app' => '앱 정보',
			'save' => '저장',
			'evaporation' => '증발량',
			'freezing_rain' => '얼어붙는 비',
			'uv_average' => '보통',
			'reset_color' => '기본값으로 재설정',
			'metric' => '미터',
			'overcast' => '구름 많음',
			'pressure' => '기압',
			'inch' => '인치',
			'imperial' => '인치',
			'location' => '위치',
			'error_occurred' => '오류가 발생했습니다',
			'validate_value' => '값을 입력해주세요',
			'lon' => '경도',
			'wind' => '풍속',
			'normal' => '보통',
			'dark' => '어두운',
			'settings' => '설정',
			'south' => '남',
			'windgusts' => '돌풍',
			'northwest' => '북서',
			'open_meteo' => 'Open-Meteo의 데이터 (CC-BY 4.0)',
			'rain' => '비',
			'mm_hg' => '밀리미터 수은주',
			'validate180' => '-180과 180 사이의 값만 가능합니다',
			'description' => '어떤 곳이든, 어느 순간이든, 날씨를 확인하세요.',
			'fahrenheit' => '화씨',
			'm_s' => '미터/초',
			'material_color' => '동적 색상',
			'confirm' => '저장',
			'no_results' => '결과 없음',
			'cities_load_error' => '도시를 불러오지 못했습니다',
			'retry' => '다시 시도',
			_ => null,
		};
	}
}
