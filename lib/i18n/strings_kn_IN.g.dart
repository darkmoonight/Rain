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
class TranslationsKnIn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKnIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.knIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <kn-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKnIn _root = this; // ignore: unused_field

	@override 
	TranslationsKnIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKnIn(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'ಇಂಟರ್ನೆಟ್ ಇಲ್ಲ';
	@override String get edit_city_hint => 'ನಗರ ಮಾಹಿತಿ ಸಂಪಾದಿಸಿ';
	@override String get location_not_found => 'ನಿಮ್ಮ ಸ್ಥಳವನ್ನು ನಿರ್ಧರಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';
	@override String get mi => 'ಮೈಲ್';
	@override String get next => 'ಮುಂದೆ';
	@override String get discard => 'ತ್ಯಜಿಸಿ';
	@override String get east => 'ಪೂರ್ವ';
	@override String get time_end => 'ಅಂತ್ಯ ಸಮಯ';
	@override String get search_method => 'ಹುಡುಕಾಟ ಅಥವಾ ಜಿಯೋಲೊಕೇಶನ್ ಬಳಸಿ';
	@override String get hourly_variables => 'ಗಂಟೆಯ ಹವಾಮಾನ ಅಸ್ಥಿರಗಳು';
	@override String get uv_index => 'UV ಸೂಚ್ಯಂಕ';
	@override String get clear_sky => 'ಸ್ಪಷ್ಟ ಆಕಾಶ';
	@override String get k_24 => '24-ಗಂಟೆ';
	@override String get no_weather_card => 'ನಗರವನ್ನು ಸೇರಿಸಿ';
	@override String get drizzle => 'ಚಿಮುಕಿಸುವ ಮಳೆ';
	@override String get humidity => 'ಆರ್ದ್ರತೆ';
	@override String get telegram => 'ಟೆಲಿಗ್ರಾಮ್';
	@override String get functions => 'ಕಾರ್ಯಗಳು';
	@override String get cities => 'ನಗರಗಳು';
	@override String get southeast => 'ಆಗ್ನೇಯ';
	@override String get validate_number => 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ';
	@override String get city => 'ನಗರ';
	@override String get uv_high => 'ಹೆಚ್ಚು';
	@override String get time => 'ನಗರದಲ್ಲಿ ಸಮಯ';
	@override String get uv_low => 'ಕಡಿಮೆ';
	@override String get name3 => 'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ';
	@override String get apparent_temperature_min => 'ಕನಿಷ್ಠ ಸ್ಪಷ್ಟ ತಾಪಮಾನ';
	@override String get direction => 'ದಿಕ್ಕು';
	@override String get heavy_rains => 'ಮಳೆ ಸುರಿಯುವಿಕೆ';
	@override String get apparent_temperature_max => 'ಗರಿಷ್ಠ ಸ್ಪಷ್ಟ ತಾಪಮಾನ';
	@override String get k_12 => '12-ಗಂಟೆ';
	@override String get discord => 'ಡಿಸ್ಕಾರ್ಡ್';
	@override String get discard_changes => 'ನಿಮ್ಮ ಬದಲಾವಣೆಗಳನ್ನು ತ್ಯಜಿಸಲು ನೀವು ಖಚಿತವಾಗಿದ್ದೀರಾ?';
	@override String get notifications => 'ಅಧಿಸೂಚನೆಗಳು';
	@override String get mph => 'ಮೈಲ್/ಗಂ';
	@override String get west => 'ಪಶ್ಚಿಮ';
	@override String get validate90 => 'ಮೌಲ್ಯವು -90 ಮತ್ತು 90 ರ ನಡುವೆ ಇರಬೇಕು';
	@override String get name2 => 'ಅನುಕೂಲಕರ ವಿನ್ಯಾಸ';
	@override String get feels => 'ಅನುಭವ';
	@override String get precipitation_probability => 'ಮಳೆಯ ಸಂಭವನೀಯತೆ';
	@override String get license => 'ಪರವಾನಗಿಗಳು';
	@override String get widget_background => 'ವಿಜೆಟ್ ಹಿನ್ನೆಲೆ';
	@override String get large_element => 'ದೊಡ್ಡ ಹವಾಮಾನ ಪ್ರದರ್ಶನ';
	@override String get unsaved_changes => 'ಉಳಿಸದ ಬದಲಾವಣೆಗಳು';
	@override String get drizzling_rain => 'ಹೆಪ್ಪುಗಟ್ಟುವ ಚಿಮುಕಿಸುವ ಮಳೆ';
	@override String get cloudy => 'ಮೋಡ';
	@override String get widget => 'ವಿಜೆಟ್';
	@override String get precipitation => 'ಮಳೆ';
	@override String get delete => 'ಅಳಿಸಿ';
	@override String get deleted_cache_store => 'ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಲಾಗುತ್ತಿದೆ';
	@override String get map => 'ನಕ್ಷೆ';
	@override String get description3 => 'ನೀವು ಯಾವುದೇ ಸಮಸ್ಯೆಗಳನ್ನು ಎದುರಿಸಿದರೆ, ದಯವಿಟ್ಟು ಇಮೇಲ್ ಮೂಲಕ ಅಥವಾ ಅಪ್ಲಿಕೇಶನ್ ವಿಮರ್ಶೆಗಳಲ್ಲಿ ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ.';
	@override String get north => 'ಉತ್ತರ';
	@override String get measurements => 'ಮಾಪನ ವ್ಯವಸ್ಥೆ';
	@override String get start => 'ಪ್ರಾರಂಭಿಸಿ';
	@override String get settings_full => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';
	@override String get high => 'ಹೆಚ್ಚು';
	@override String get daily_variables => 'ದೈನಂದಿನ ಹವಾಮಾನ ಅಸ್ಥಿರಗಳು';
	@override String get low => 'ಕಡಿಮೆ';
	@override String get on_inter => 'ಹವಾಮಾನ ಡೇಟಾವನ್ನು ಪಡೆಯಲು ಇಂಟರ್ನೆಟ್ ಆನ್ ಮಾಡಿ.';
	@override String get thunderstorm => 'ಗುಡುಗು ಸಹಿತ ಮಳೆ';
	@override String get version => 'ಅಪ್ಲಿಕೇಶನ್ ಆವೃತ್ತಿ';
	@override String get project => 'ಪ್ರಾಜೆಕ್ಟ್ ಆನ್';
	@override String get amoled_theme => 'AMOLED ಥೀಮ್';
	@override String get deleted_card_weather_query => 'ನೀವು ನಿಜವಾಗಿಯೂ ನಗರವನ್ನು ಅಳಿಸಲು ಬಯಸುವಿರಾ?';
	@override String get northeast => 'ಈಶಾನ್ಯ';
	@override String get add_widget => 'ವಿಜೆಟ್ ಸೇರಿಸಿ';
	@override String get fog => 'ಮಂಜು';
	@override String get description2 => 'ಎಲ್ಲಾ ನ್ಯಾವಿಗೇಶನ್ ಅಪ್ಲಿಕೇಶನ್‌ನೊಂದಿಗೆ ಸಾಧ್ಯವಾದಷ್ಟು ಅನುಕೂಲಕರವಾಗಿ ಮತ್ತು ತ್ವರಿತವಾಗಿ ಸಂವಹನ ನಡೆಸಲು ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ.';
	@override String get mm => 'ಮಿ.ಮೀ';
	@override String get no_desc_data => 'ಡೇಟಾ ಇಲ್ಲ';
	@override String get search_city => 'ನಿಮ್ಮ ನಗರವನ್ನು ಹುಡುಕಿ';
	@override String get weather_more => '12-ದಿನಗಳ ಹವಾಮಾನ ಮುನ್ಸೂಚನೆ';
	@override String get round_degree => 'ರೌಂಡ್ ಡಿಗ್ರಿಗಳು';
	@override String get w_m2 => 'W/m²';
	@override String get create_city_hint => 'ನಗರ ಡೇಟಾ ಹುಡುಕಿ ಅಥವಾ ಮ್ಯಾನ್ಯುವಲ್ ಆಗಿ ನಮೂದಿಸಿ';
	@override String get validate_name => 'ದಯವಿಟ್ಟು ಹೆಸರನ್ನು ನಮೂದಿಸಿ';
	@override String get sunrise => 'ಸೂರ್ಯೋದಯ';
	@override String get km => 'ಕಿ.ಮೀ';
	@override String get district => 'ಜಿಲ್ಲೆ';
	@override String get southwest => 'ನೈಋತ್ಯ';
	@override String get degrees => 'ಡಿಗ್ರಿಗಳು';
	@override String get clear_cache_store => 'ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಿ';
	@override String get skip => 'ಬಿಟ್ಟುಬಿಡಿ';
	@override String get h_pa => 'ಹೆಕ್ಟೋಪಾಸ್ಕಲ್';
	@override String get appearance => 'ನೋಟ';
	@override String get time_start => 'ಪ್ರಾರಂಭ ಸಮಯ';
	@override String get ready => 'ಸಿದ್ಧ';
	@override String get kph => 'ಕಿ.ಮೀ/ಗಂ';
	@override String get deleted_cache_store_query => 'ನೀವು ನಿಜವಾಗಿಯೂ ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಲು ಬಯಸುವಿರಾ?';
	@override String get widget_text => 'ವಿಜೆಟ್ ಪಠ್ಯ';
	@override String get support => 'ದಾನ ಮಾಡಿ';
	@override String get groups => 'ನಮ್ಮ ಗುಂಪುಗಳು';
	@override String get system => 'ವ್ಯವಸ್ಥೆ';
	@override String get sunset => 'ಸೂರ್ಯಾಸ್ತ';
	@override String get dewpoint => 'ಇಬ್ಬನಿ ಬಿಂದು';
	@override String get shortwave_radiation => 'ಶಾರ್ಟ್‌ವೇವ್ ವಿಕಿರಣ';
	@override String get language => 'ಭಾಷೆ';
	@override String get hide_map => 'ನಕ್ಷೆ ಮರೆಮಾಡಿ';
	@override String get cancel => 'ರದ್ದುಗೊಳಿಸಿ';
	@override String get loading => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ...';
	@override String get timeformat => 'ಸಮಯ ಸ್ವರೂಪ';
	@override String get lat => 'ಅಕ್ಷಾಂಶ';
	@override String get data => 'ಡೇಟಾ';
	@override String get visibility => 'ಗೋಚರತೆ';
	@override String get deleted_card_weather => 'ನಗರವನ್ನು ಅಳಿಸಿ';
	@override String get celsius => 'ಸೆಲ್ಸಿಯಸ್';
	@override String get no_location => 'ಪ್ರಸ್ತುತ ಸ್ಥಳಕ್ಕೆ ಹವಾಮಾನ ಡೇಟಾವನ್ನು ಪಡೆಯಲು ಸ್ಥಳ ಸೇವೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';
	@override String get create => 'ರಚಿಸಿ';
	@override String get edit => 'ಸಂಪಾದಿಸಿ';
	@override String get search => 'ಹುಡುಕಿ...';
	@override String get uv_extreme => 'ಅತ್ಯಂತ';
	@override String get light => 'ಹಗುರ';
	@override String get cloudcover => 'ಮೋಡದ ಆವರಣ';
	@override String get uv_very_high => 'ಬಹಳ ಹೆಚ್ಚು';
	@override String get snow => 'ಹಿಮ';
	@override String get done => 'ಮುಗಿದಿದೆ';
	@override String get theme => 'ಥೀಮ್';
	@override String get name => 'ಹವಾಮಾನ';
	@override String get time_range => 'ಆವರ್ತನೆ (ಗಂಟೆಗಳಲ್ಲಿ)';
	@override String get about_app => 'ಆ್ಯಪ್ ಬಗ್ಗೆ';
	@override String get save => 'ಉಳಿಸಿ';
	@override String get evaporation => 'ಆವಿಯಾಗುವಿಕೆ';
	@override String get freezing_rain => 'ಹೆಪ್ಪುಗಟ್ಟುವ ಮಳೆ';
	@override String get uv_average => 'ಮಧ್ಯಮ';
	@override String get reset_color => 'ಡಿಫಾಲ್ಟ್‌ಗೆ ಮರುಹೊಂದಿಸಿ';
	@override String get metric => 'ಮೆಟ್ರಿಕ್';
	@override String get overcast => 'ಮೋಡ ಕವಿದ';
	@override String get pressure => 'ಒತ್ತಡ';
	@override String get inch => 'ಇಂಚು';
	@override String get imperial => 'ಇಂಪೀರಿಯಲ್';
	@override String get location => 'ಸ್ಥಳ';
	@override String get error_occurred => 'ದೋಷ ಸಂಭವಿಸಿದೆ';
	@override String get validate_value => 'ದಯವಿಟ್ಟು ಮೌಲ್ಯವನ್ನು ನಮೂದಿಸಿ';
	@override String get lon => 'ರೇಖಾಂಶ';
	@override String get wind => 'ಗಾಳಿ';
	@override String get normal => 'ಸಾಮಾನ್ಯ';
	@override String get dark => 'ಗಾಢ';
	@override String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';
	@override String get south => 'ದಕ್ಷಿಣ';
	@override String get windgusts => 'ಗಾಳಿಯ ಝಾಪಟೆ';
	@override String get northwest => 'ವಾಯವ್ಯ';
	@override String get open_meteo => 'Open-Meteo ನಿಂದ ಡೇಟಾ (CC-BY 4.0)';
	@override String get rain => 'ಮಳೆ';
	@override String get mm_hg => 'ಮಿ.ಮೀ ಪಾದರಸ';
	@override String get validate180 => 'ಮೌಲ್ಯವು -180 ಮತ್ತು 180 ರ ನಡುವೆ ಇರಬೇಕು';
	@override String get description => 'ಯಾವುದೇ ಸ್ಥಳಕ್ಕೆ ಪ್ರತಿ ಗಂಟೆ, ದಿನ ಮತ್ತು ವಾರಕ್ಕೆ ನವೀಕೃತ ಮುನ್ಸೂಚನೆಯೊಂದಿಗೆ ಹವಾಮಾನ ಅಪ್ಲಿಕೇಶನ್.';
	@override String get fahrenheit => 'ಫ್ಯಾರನ್‌ಹೀಟ್';
	@override String get m_s => 'ಮೀ/ಸೆ';
	@override String get material_color => 'ಡೈನಾಮಿಕ್ ಬಣ್ಣಗಳು';
	@override String get confirm => 'ಉಳಿಸಿ';
	@override String get no_results => 'ಯಾವುದೇ ಫಲಿತಾಂಶಗಳಿಲ್ಲ';
	@override String get cities_load_error => 'ನಗರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';
	@override String get retry => 'ಮರುಪ್ರಯತ್ನ';
}

/// The flat map containing all translations for locale <kn-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKnIn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'ಇಂಟರ್ನೆಟ್ ಇಲ್ಲ',
			'edit_city_hint' => 'ನಗರ ಮಾಹಿತಿ ಸಂಪಾದಿಸಿ',
			'location_not_found' => 'ನಿಮ್ಮ ಸ್ಥಳವನ್ನು ನಿರ್ಧರಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ',
			'mi' => 'ಮೈಲ್',
			'next' => 'ಮುಂದೆ',
			'discard' => 'ತ್ಯಜಿಸಿ',
			'east' => 'ಪೂರ್ವ',
			'time_end' => 'ಅಂತ್ಯ ಸಮಯ',
			'search_method' => 'ಹುಡುಕಾಟ ಅಥವಾ ಜಿಯೋಲೊಕೇಶನ್ ಬಳಸಿ',
			'hourly_variables' => 'ಗಂಟೆಯ ಹವಾಮಾನ ಅಸ್ಥಿರಗಳು',
			'uv_index' => 'UV ಸೂಚ್ಯಂಕ',
			'clear_sky' => 'ಸ್ಪಷ್ಟ ಆಕಾಶ',
			'k_24' => '24-ಗಂಟೆ',
			'no_weather_card' => 'ನಗರವನ್ನು ಸೇರಿಸಿ',
			'drizzle' => 'ಚಿಮುಕಿಸುವ ಮಳೆ',
			'humidity' => 'ಆರ್ದ್ರತೆ',
			'telegram' => 'ಟೆಲಿಗ್ರಾಮ್',
			'functions' => 'ಕಾರ್ಯಗಳು',
			'cities' => 'ನಗರಗಳು',
			'southeast' => 'ಆಗ್ನೇಯ',
			'validate_number' => 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ',
			'city' => 'ನಗರ',
			'uv_high' => 'ಹೆಚ್ಚು',
			'time' => 'ನಗರದಲ್ಲಿ ಸಮಯ',
			'uv_low' => 'ಕಡಿಮೆ',
			'name3' => 'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ',
			'apparent_temperature_min' => 'ಕನಿಷ್ಠ ಸ್ಪಷ್ಟ ತಾಪಮಾನ',
			'direction' => 'ದಿಕ್ಕು',
			'heavy_rains' => 'ಮಳೆ ಸುರಿಯುವಿಕೆ',
			'apparent_temperature_max' => 'ಗರಿಷ್ಠ ಸ್ಪಷ್ಟ ತಾಪಮಾನ',
			'k_12' => '12-ಗಂಟೆ',
			'discord' => 'ಡಿಸ್ಕಾರ್ಡ್',
			'discard_changes' => 'ನಿಮ್ಮ ಬದಲಾವಣೆಗಳನ್ನು ತ್ಯಜಿಸಲು ನೀವು ಖಚಿತವಾಗಿದ್ದೀರಾ?',
			'notifications' => 'ಅಧಿಸೂಚನೆಗಳು',
			'mph' => 'ಮೈಲ್/ಗಂ',
			'west' => 'ಪಶ್ಚಿಮ',
			'validate90' => 'ಮೌಲ್ಯವು -90 ಮತ್ತು 90 ರ ನಡುವೆ ಇರಬೇಕು',
			'name2' => 'ಅನುಕೂಲಕರ ವಿನ್ಯಾಸ',
			'feels' => 'ಅನುಭವ',
			'precipitation_probability' => 'ಮಳೆಯ ಸಂಭವನೀಯತೆ',
			'license' => 'ಪರವಾನಗಿಗಳು',
			'widget_background' => 'ವಿಜೆಟ್ ಹಿನ್ನೆಲೆ',
			'large_element' => 'ದೊಡ್ಡ ಹವಾಮಾನ ಪ್ರದರ್ಶನ',
			'unsaved_changes' => 'ಉಳಿಸದ ಬದಲಾವಣೆಗಳು',
			'drizzling_rain' => 'ಹೆಪ್ಪುಗಟ್ಟುವ ಚಿಮುಕಿಸುವ ಮಳೆ',
			'cloudy' => 'ಮೋಡ',
			'widget' => 'ವಿಜೆಟ್',
			'precipitation' => 'ಮಳೆ',
			'delete' => 'ಅಳಿಸಿ',
			'deleted_cache_store' => 'ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಲಾಗುತ್ತಿದೆ',
			'map' => 'ನಕ್ಷೆ',
			'description3' => 'ನೀವು ಯಾವುದೇ ಸಮಸ್ಯೆಗಳನ್ನು ಎದುರಿಸಿದರೆ, ದಯವಿಟ್ಟು ಇಮೇಲ್ ಮೂಲಕ ಅಥವಾ ಅಪ್ಲಿಕೇಶನ್ ವಿಮರ್ಶೆಗಳಲ್ಲಿ ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ.',
			'north' => 'ಉತ್ತರ',
			'measurements' => 'ಮಾಪನ ವ್ಯವಸ್ಥೆ',
			'start' => 'ಪ್ರಾರಂಭಿಸಿ',
			'settings_full' => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
			'high' => 'ಹೆಚ್ಚು',
			'daily_variables' => 'ದೈನಂದಿನ ಹವಾಮಾನ ಅಸ್ಥಿರಗಳು',
			'low' => 'ಕಡಿಮೆ',
			'on_inter' => 'ಹವಾಮಾನ ಡೇಟಾವನ್ನು ಪಡೆಯಲು ಇಂಟರ್ನೆಟ್ ಆನ್ ಮಾಡಿ.',
			'thunderstorm' => 'ಗುಡುಗು ಸಹಿತ ಮಳೆ',
			'version' => 'ಅಪ್ಲಿಕೇಶನ್ ಆವೃತ್ತಿ',
			'project' => 'ಪ್ರಾಜೆಕ್ಟ್ ಆನ್',
			'amoled_theme' => 'AMOLED ಥೀಮ್',
			'deleted_card_weather_query' => 'ನೀವು ನಿಜವಾಗಿಯೂ ನಗರವನ್ನು ಅಳಿಸಲು ಬಯಸುವಿರಾ?',
			'northeast' => 'ಈಶಾನ್ಯ',
			'add_widget' => 'ವಿಜೆಟ್ ಸೇರಿಸಿ',
			'fog' => 'ಮಂಜು',
			'description2' => 'ಎಲ್ಲಾ ನ್ಯಾವಿಗೇಶನ್ ಅಪ್ಲಿಕೇಶನ್‌ನೊಂದಿಗೆ ಸಾಧ್ಯವಾದಷ್ಟು ಅನುಕೂಲಕರವಾಗಿ ಮತ್ತು ತ್ವರಿತವಾಗಿ ಸಂವಹನ ನಡೆಸಲು ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ.',
			'mm' => 'ಮಿ.ಮೀ',
			'no_desc_data' => 'ಡೇಟಾ ಇಲ್ಲ',
			'search_city' => 'ನಿಮ್ಮ ನಗರವನ್ನು ಹುಡುಕಿ',
			'weather_more' => '12-ದಿನಗಳ ಹವಾಮಾನ ಮುನ್ಸೂಚನೆ',
			'round_degree' => 'ರೌಂಡ್ ಡಿಗ್ರಿಗಳು',
			'w_m2' => 'W/m²',
			'create_city_hint' => 'ನಗರ ಡೇಟಾ ಹುಡುಕಿ ಅಥವಾ ಮ್ಯಾನ್ಯುವಲ್ ಆಗಿ ನಮೂದಿಸಿ',
			'validate_name' => 'ದಯವಿಟ್ಟು ಹೆಸರನ್ನು ನಮೂದಿಸಿ',
			'sunrise' => 'ಸೂರ್ಯೋದಯ',
			'km' => 'ಕಿ.ಮೀ',
			'district' => 'ಜಿಲ್ಲೆ',
			'southwest' => 'ನೈಋತ್ಯ',
			'degrees' => 'ಡಿಗ್ರಿಗಳು',
			'clear_cache_store' => 'ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಿ',
			'skip' => 'ಬಿಟ್ಟುಬಿಡಿ',
			'h_pa' => 'ಹೆಕ್ಟೋಪಾಸ್ಕಲ್',
			'appearance' => 'ನೋಟ',
			'time_start' => 'ಪ್ರಾರಂಭ ಸಮಯ',
			'ready' => 'ಸಿದ್ಧ',
			'kph' => 'ಕಿ.ಮೀ/ಗಂ',
			'deleted_cache_store_query' => 'ನೀವು ನಿಜವಾಗಿಯೂ ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಲು ಬಯಸುವಿರಾ?',
			'widget_text' => 'ವಿಜೆಟ್ ಪಠ್ಯ',
			'support' => 'ದಾನ ಮಾಡಿ',
			'groups' => 'ನಮ್ಮ ಗುಂಪುಗಳು',
			'system' => 'ವ್ಯವಸ್ಥೆ',
			'sunset' => 'ಸೂರ್ಯಾಸ್ತ',
			'dewpoint' => 'ಇಬ್ಬನಿ ಬಿಂದು',
			'shortwave_radiation' => 'ಶಾರ್ಟ್‌ವೇವ್ ವಿಕಿರಣ',
			'language' => 'ಭಾಷೆ',
			'hide_map' => 'ನಕ್ಷೆ ಮರೆಮಾಡಿ',
			'cancel' => 'ರದ್ದುಗೊಳಿಸಿ',
			'loading' => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ...',
			'timeformat' => 'ಸಮಯ ಸ್ವರೂಪ',
			'lat' => 'ಅಕ್ಷಾಂಶ',
			'data' => 'ಡೇಟಾ',
			'visibility' => 'ಗೋಚರತೆ',
			'deleted_card_weather' => 'ನಗರವನ್ನು ಅಳಿಸಿ',
			'celsius' => 'ಸೆಲ್ಸಿಯಸ್',
			'no_location' => 'ಪ್ರಸ್ತುತ ಸ್ಥಳಕ್ಕೆ ಹವಾಮಾನ ಡೇಟಾವನ್ನು ಪಡೆಯಲು ಸ್ಥಳ ಸೇವೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.',
			'create' => 'ರಚಿಸಿ',
			'edit' => 'ಸಂಪಾದಿಸಿ',
			'search' => 'ಹುಡುಕಿ...',
			'uv_extreme' => 'ಅತ್ಯಂತ',
			'light' => 'ಹಗುರ',
			'cloudcover' => 'ಮೋಡದ ಆವರಣ',
			'uv_very_high' => 'ಬಹಳ ಹೆಚ್ಚು',
			'snow' => 'ಹಿಮ',
			'done' => 'ಮುಗಿದಿದೆ',
			'theme' => 'ಥೀಮ್',
			'name' => 'ಹವಾಮಾನ',
			'time_range' => 'ಆವರ್ತನೆ (ಗಂಟೆಗಳಲ್ಲಿ)',
			'about_app' => 'ಆ್ಯಪ್ ಬಗ್ಗೆ',
			'save' => 'ಉಳಿಸಿ',
			'evaporation' => 'ಆವಿಯಾಗುವಿಕೆ',
			'freezing_rain' => 'ಹೆಪ್ಪುಗಟ್ಟುವ ಮಳೆ',
			'uv_average' => 'ಮಧ್ಯಮ',
			'reset_color' => 'ಡಿಫಾಲ್ಟ್‌ಗೆ ಮರುಹೊಂದಿಸಿ',
			'metric' => 'ಮೆಟ್ರಿಕ್',
			'overcast' => 'ಮೋಡ ಕವಿದ',
			'pressure' => 'ಒತ್ತಡ',
			'inch' => 'ಇಂಚು',
			'imperial' => 'ಇಂಪೀರಿಯಲ್',
			'location' => 'ಸ್ಥಳ',
			'error_occurred' => 'ದೋಷ ಸಂಭವಿಸಿದೆ',
			'validate_value' => 'ದಯವಿಟ್ಟು ಮೌಲ್ಯವನ್ನು ನಮೂದಿಸಿ',
			'lon' => 'ರೇಖಾಂಶ',
			'wind' => 'ಗಾಳಿ',
			'normal' => 'ಸಾಮಾನ್ಯ',
			'dark' => 'ಗಾಢ',
			'settings' => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
			'south' => 'ದಕ್ಷಿಣ',
			'windgusts' => 'ಗಾಳಿಯ ಝಾಪಟೆ',
			'northwest' => 'ವಾಯವ್ಯ',
			'open_meteo' => 'Open-Meteo ನಿಂದ ಡೇಟಾ (CC-BY 4.0)',
			'rain' => 'ಮಳೆ',
			'mm_hg' => 'ಮಿ.ಮೀ ಪಾದರಸ',
			'validate180' => 'ಮೌಲ್ಯವು -180 ಮತ್ತು 180 ರ ನಡುವೆ ಇರಬೇಕು',
			'description' => 'ಯಾವುದೇ ಸ್ಥಳಕ್ಕೆ ಪ್ರತಿ ಗಂಟೆ, ದಿನ ಮತ್ತು ವಾರಕ್ಕೆ ನವೀಕೃತ ಮುನ್ಸೂಚನೆಯೊಂದಿಗೆ ಹವಾಮಾನ ಅಪ್ಲಿಕೇಶನ್.',
			'fahrenheit' => 'ಫ್ಯಾರನ್‌ಹೀಟ್',
			'm_s' => 'ಮೀ/ಸೆ',
			'material_color' => 'ಡೈನಾಮಿಕ್ ಬಣ್ಣಗಳು',
			'confirm' => 'ಉಳಿಸಿ',
			'no_results' => 'ಯಾವುದೇ ಫಲಿತಾಂಶಗಳಿಲ್ಲ',
			'cities_load_error' => 'ನಗರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ',
			'retry' => 'ಮರುಪ್ರಯತ್ನ',
			_ => null,
		};
	}
}
