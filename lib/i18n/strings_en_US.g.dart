///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEnUs = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.enUs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en-US>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en-US: 'No Internet'
	String get no_inter => 'No Internet';

	/// en-US: 'Edit city information'
	String get edit_city_hint => 'Edit city information';

	/// en-US: 'Unable to determine your location'
	String get location_not_found => 'Unable to determine your location';

	/// en-US: 'mi'
	String get mi => 'mi';

	/// en-US: 'Next'
	String get next => 'Next';

	/// en-US: 'Discard'
	String get discard => 'Discard';

	/// en-US: 'East'
	String get east => 'East';

	/// en-US: 'End time'
	String get time_end => 'End time';

	/// en-US: 'Use search or geolocation'
	String get search_method => 'Use search or geolocation';

	/// en-US: 'Hourly weather variables'
	String get hourly_variables => 'Hourly weather variables';

	/// en-US: 'UV-index'
	String get uv_index => 'UV-index';

	/// en-US: 'Clear sky'
	String get clear_sky => 'Clear sky';

	/// en-US: '24-hour'
	String get k_24 => '24-hour';

	/// en-US: 'Add a city'
	String get no_weather_card => 'Add a city';

	/// en-US: 'Drizzle'
	String get drizzle => 'Drizzle';

	/// en-US: 'Humidity'
	String get humidity => 'Humidity';

	/// en-US: 'Telegram'
	String get telegram => 'Telegram';

	/// en-US: 'Functions'
	String get functions => 'Functions';

	/// en-US: 'Cities'
	String get cities => 'Cities';

	/// en-US: 'Southeast'
	String get southeast => 'Southeast';

	/// en-US: 'Please enter a valid number'
	String get validate_number => 'Please enter a valid number';

	/// en-US: 'City'
	String get city => 'City';

	/// en-US: 'High'
	String get uv_high => 'High';

	/// en-US: 'Time in the city'
	String get time => 'Time in the city';

	/// en-US: 'Low'
	String get uv_low => 'Low';

	/// en-US: 'Contact Us'
	String get name3 => 'Contact Us';

	/// en-US: 'Minimum apparent temperature'
	String get apparent_temperature_min => 'Minimum apparent temperature';

	/// en-US: 'Direction'
	String get direction => 'Direction';

	/// en-US: 'Rain showers'
	String get heavy_rains => 'Rain showers';

	/// en-US: 'Maximum apparent temperature'
	String get apparent_temperature_max => 'Maximum apparent temperature';

	/// en-US: '12-hour'
	String get k_12 => '12-hour';

	/// en-US: 'Discord'
	String get discord => 'Discord';

	/// en-US: 'Are you sure you want to discard your changes?'
	String get discard_changes => 'Are you sure you want to discard your changes?';

	/// en-US: 'Notifications'
	String get notifications => 'Notifications';

	/// en-US: 'mph'
	String get mph => 'mph';

	/// en-US: 'West'
	String get west => 'West';

	/// en-US: 'Value must be between -90 and 90'
	String get validate90 => 'Value must be between -90 and 90';

	/// en-US: 'Convenient Design'
	String get name2 => 'Convenient Design';

	/// en-US: 'Feels'
	String get feels => 'Feels';

	/// en-US: 'Precipitation probability'
	String get precipitation_probability => 'Precipitation probability';

	/// en-US: 'Licenses'
	String get license => 'Licenses';

	/// en-US: 'Widget background'
	String get widget_background => 'Widget background';

	/// en-US: 'Large weather display'
	String get large_element => 'Large weather display';

	/// en-US: 'Unsaved changes'
	String get unsaved_changes => 'Unsaved changes';

	/// en-US: 'Freezing Drizzle'
	String get drizzling_rain => 'Freezing Drizzle';

	/// en-US: 'Cloudy'
	String get cloudy => 'Cloudy';

	/// en-US: 'Widget'
	String get widget => 'Widget';

	/// en-US: 'Precipitation'
	String get precipitation => 'Precipitation';

	/// en-US: 'Delete'
	String get delete => 'Delete';

	/// en-US: 'Clearing the cache'
	String get deleted_cache_store => 'Clearing the cache';

	/// en-US: 'Map'
	String get map => 'Map';

	/// en-US: 'If you encounter any issues, please contact us via email or in the application reviews.'
	String get description3 => 'If you encounter any issues, please contact us via email or in the application reviews.';

	/// en-US: 'North'
	String get north => 'North';

	/// en-US: 'System of measures'
	String get measurements => 'System of measures';

	/// en-US: 'Get Started'
	String get start => 'Get Started';

	/// en-US: 'Settings'
	String get settings_full => 'Settings';

	/// en-US: 'High'
	String get high => 'High';

	/// en-US: 'Daily weather variables'
	String get daily_variables => 'Daily weather variables';

	/// en-US: 'Low'
	String get low => 'Low';

	/// en-US: 'Turn on the Internet to get meteorological data.'
	String get on_inter => 'Turn on the Internet to get meteorological data.';

	/// en-US: 'Thunderstorm'
	String get thunderstorm => 'Thunderstorm';

	/// en-US: 'Application version'
	String get version => 'Application version';

	/// en-US: 'Project on'
	String get project => 'Project on';

	/// en-US: 'AMOLED-theme'
	String get amoled_theme => 'AMOLED-theme';

	/// en-US: 'Are you sure you want to delete the city?'
	String get deleted_card_weather_query => 'Are you sure you want to delete the city?';

	/// en-US: 'Northeast'
	String get northeast => 'Northeast';

	/// en-US: 'Add widget'
	String get add_widget => 'Add widget';

	/// en-US: 'Fog'
	String get fog => 'Fog';

	/// en-US: 'All navigation is designed to interact with the application as conveniently and quickly as possible.'
	String get description2 => 'All navigation is designed to interact with the application as conveniently and quickly as possible.';

	/// en-US: 'mm'
	String get mm => 'mm';

	/// en-US: 'No data'
	String get no_desc_data => 'No data';

	/// en-US: 'Find your city'
	String get search_city => 'Find your city';

	/// en-US: '12-day weather forecast'
	String get weather_more => '12-day weather forecast';

	/// en-US: 'Round degrees'
	String get round_degree => 'Round degrees';

	/// en-US: 'W/m2'
	String get w_m2 => 'W/m2';

	/// en-US: 'Search or enter city data manually'
	String get create_city_hint => 'Search or enter city data manually';

	/// en-US: 'Please enter the name'
	String get validate_name => 'Please enter the name';

	/// en-US: 'Sunrise'
	String get sunrise => 'Sunrise';

	/// en-US: 'km'
	String get km => 'km';

	/// en-US: 'District'
	String get district => 'District';

	/// en-US: 'Southwest'
	String get southwest => 'Southwest';

	/// en-US: 'Degrees'
	String get degrees => 'Degrees';

	/// en-US: 'Clear cache'
	String get clear_cache_store => 'Clear cache';

	/// en-US: 'Skip'
	String get skip => 'Skip';

	/// en-US: 'hPa'
	String get h_pa => 'hPa';

	/// en-US: 'Appearance'
	String get appearance => 'Appearance';

	/// en-US: 'Start time'
	String get time_start => 'Start time';

	/// en-US: 'Ready'
	String get ready => 'Ready';

	/// en-US: 'km/h'
	String get kph => 'km/h';

	/// en-US: 'Are you sure you want to clear the cache?'
	String get deleted_cache_store_query => 'Are you sure you want to clear the cache?';

	/// en-US: 'Widget text'
	String get widget_text => 'Widget text';

	/// en-US: 'Donate'
	String get support => 'Donate';

	/// en-US: 'Our groups'
	String get groups => 'Our groups';

	/// en-US: 'System'
	String get system => 'System';

	/// en-US: 'Sunset'
	String get sunset => 'Sunset';

	/// en-US: 'Dewpoint'
	String get dewpoint => 'Dewpoint';

	/// en-US: 'Shortwave radiation'
	String get shortwave_radiation => 'Shortwave radiation';

	/// en-US: 'Language'
	String get language => 'Language';

	/// en-US: 'Hide map'
	String get hide_map => 'Hide map';

	/// en-US: 'Cancel'
	String get cancel => 'Cancel';

	/// en-US: 'Loading...'
	String get loading => 'Loading...';

	/// en-US: 'Time format'
	String get timeformat => 'Time format';

	/// en-US: 'Latitude'
	String get lat => 'Latitude';

	/// en-US: 'Data'
	String get data => 'Data';

	/// en-US: 'Visibility'
	String get visibility => 'Visibility';

	/// en-US: 'Deleting a city'
	String get deleted_card_weather => 'Deleting a city';

	/// en-US: 'Celsius'
	String get celsius => 'Celsius';

	/// en-US: 'Enable the location service to get weather data for the current location.'
	String get no_location => 'Enable the location service to get weather data for the current location.';

	/// en-US: 'Create'
	String get create => 'Create';

	/// en-US: 'Edit'
	String get edit => 'Edit';

	/// en-US: 'Search...'
	String get search => 'Search...';

	/// en-US: 'Extreme'
	String get uv_extreme => 'Extreme';

	/// en-US: 'Light'
	String get light => 'Light';

	/// en-US: 'Cloudcover'
	String get cloudcover => 'Cloudcover';

	/// en-US: 'Very high'
	String get uv_very_high => 'Very high';

	/// en-US: 'Snow'
	String get snow => 'Snow';

	/// en-US: 'Done'
	String get done => 'Done';

	/// en-US: 'Theme'
	String get theme => 'Theme';

	/// en-US: 'Weather'
	String get name => 'Weather';

	/// en-US: 'Frequency (in hours)'
	String get time_range => 'Frequency (in hours)';

	/// en-US: 'About the app'
	String get about_app => 'About the app';

	/// en-US: 'Save'
	String get save => 'Save';

	/// en-US: 'Evapotranspiration'
	String get evaporation => 'Evapotranspiration';

	/// en-US: 'Freezing Rain'
	String get freezing_rain => 'Freezing Rain';

	/// en-US: 'Moderate'
	String get uv_average => 'Moderate';

	/// en-US: 'Reset to default'
	String get reset_color => 'Reset to default';

	/// en-US: 'Metric'
	String get metric => 'Metric';

	/// en-US: 'Overcast'
	String get overcast => 'Overcast';

	/// en-US: 'Pressure'
	String get pressure => 'Pressure';

	/// en-US: 'inch'
	String get inch => 'inch';

	/// en-US: 'Imperial'
	String get imperial => 'Imperial';

	/// en-US: 'Location'
	String get location => 'Location';

	/// en-US: 'An error occurred'
	String get error_occurred => 'An error occurred';

	/// en-US: 'Please enter a value'
	String get validate_value => 'Please enter a value';

	/// en-US: 'Longitude'
	String get lon => 'Longitude';

	/// en-US: 'Wind'
	String get wind => 'Wind';

	/// en-US: 'Normal'
	String get normal => 'Normal';

	/// en-US: 'Dark'
	String get dark => 'Dark';

	/// en-US: 'Set.'
	String get settings => 'Set.';

	/// en-US: 'South'
	String get south => 'South';

	/// en-US: 'Gust'
	String get windgusts => 'Gust';

	/// en-US: 'Northwest'
	String get northwest => 'Northwest';

	/// en-US: 'Data by Open-Meteo (CC-BY 4.0)'
	String get open_meteo => 'Data by Open-Meteo (CC-BY 4.0)';

	/// en-US: 'Rain'
	String get rain => 'Rain';

	/// en-US: 'mmHg'
	String get mm_hg => 'mmHg';

	/// en-US: 'Value must be between -180 and 180'
	String get validate180 => 'Value must be between -180 and 180';

	/// en-US: 'Weather application with an up-to-date forecast for each hour, day, and week for any location.'
	String get description => 'Weather application with an up-to-date forecast for each hour, day, and week for any location.';

	/// en-US: 'Fahrenheit'
	String get fahrenheit => 'Fahrenheit';

	/// en-US: 'm/s'
	String get m_s => 'm/s';

	/// en-US: 'Dynamic colors'
	String get material_color => 'Dynamic colors';

	/// en-US: 'Confirm'
	String get confirm => 'Confirm';

	/// en-US: 'No results'
	String get no_results => 'No results';

	/// en-US: 'Failed to load cities'
	String get cities_load_error => 'Failed to load cities';

	/// en-US: 'City not found'
	String get city_not_found => 'City not found';

	/// en-US: 'Retry'
	String get retry => 'Retry';

	/// en-US: 'Air quality'
	String get air_quality => 'Air quality';

	/// en-US: 'AQI standard'
	String get aqi_standard => 'AQI standard';

	/// en-US: 'European AQI'
	String get aqi_european => 'European AQI';

	/// en-US: 'US AQI'
	String get aqi_american => 'US AQI';

	/// en-US: 'Good'
	String get aqi_good => 'Good';

	/// en-US: 'Fair'
	String get aqi_fair => 'Fair';

	/// en-US: 'Moderate'
	String get aqi_moderate => 'Moderate';

	/// en-US: 'Poor'
	String get aqi_poor => 'Poor';

	/// en-US: 'Very poor'
	String get aqi_very_poor => 'Very poor';

	/// en-US: 'Extremely poor'
	String get aqi_extremely_poor => 'Extremely poor';

	/// en-US: 'Unhealthy for sensitive groups'
	String get aqi_unhealthy_sensitive => 'Unhealthy for sensitive groups';

	/// en-US: 'Unhealthy'
	String get aqi_unhealthy => 'Unhealthy';

	/// en-US: 'Very unhealthy'
	String get aqi_very_unhealthy => 'Very unhealthy';

	/// en-US: 'Hazardous'
	String get aqi_hazardous => 'Hazardous';

	/// en-US: 'PM2.5'
	String get pm25 => 'PM2.5';

	/// en-US: 'PM10'
	String get pm10 => 'PM10';

	/// en-US: 'O₃'
	String get ozone => 'O₃';

	/// en-US: 'CO'
	String get co => 'CO';

	/// en-US: 'NO₂'
	String get no2 => 'NO₂';

	/// en-US: 'SO₂'
	String get so2 => 'SO₂';

	/// en-US: 'Pollutants'
	String get pollutants => 'Pollutants';

	/// en-US: 'European'
	String get european => 'European';

	/// en-US: 'American'
	String get american => 'American';

	/// en-US: 'Great air for outdoor activities.'
	String get aqi_advice_good => 'Great air for outdoor activities.';

	/// en-US: 'Generally fine. Sensitive people may want to limit long outdoor exertion.'
	String get aqi_advice_fair => 'Generally fine. Sensitive people may want to limit long outdoor exertion.';

	/// en-US: 'Sensitive groups should reduce prolonged time outdoors.'
	String get aqi_advice_moderate => 'Sensitive groups should reduce prolonged time outdoors.';

	/// en-US: 'Limit outdoor activity, especially if you are sensitive to air pollution.'
	String get aqi_advice_poor => 'Limit outdoor activity, especially if you are sensitive to air pollution.';

	/// en-US: 'Avoid prolonged outdoor exertion. Everyone may feel health effects.'
	String get aqi_advice_very_poor => 'Avoid prolonged outdoor exertion. Everyone may feel health effects.';

	/// en-US: 'Stay indoors if possible. Outdoor activity is not recommended.'
	String get aqi_advice_extremely_poor => 'Stay indoors if possible. Outdoor activity is not recommended.';
}

/// The flat map containing all translations for locale <en-US>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'No Internet',
			'edit_city_hint' => 'Edit city information',
			'location_not_found' => 'Unable to determine your location',
			'mi' => 'mi',
			'next' => 'Next',
			'discard' => 'Discard',
			'east' => 'East',
			'time_end' => 'End time',
			'search_method' => 'Use search or geolocation',
			'hourly_variables' => 'Hourly weather variables',
			'uv_index' => 'UV-index',
			'clear_sky' => 'Clear sky',
			'k_24' => '24-hour',
			'no_weather_card' => 'Add a city',
			'drizzle' => 'Drizzle',
			'humidity' => 'Humidity',
			'telegram' => 'Telegram',
			'functions' => 'Functions',
			'cities' => 'Cities',
			'southeast' => 'Southeast',
			'validate_number' => 'Please enter a valid number',
			'city' => 'City',
			'uv_high' => 'High',
			'time' => 'Time in the city',
			'uv_low' => 'Low',
			'name3' => 'Contact Us',
			'apparent_temperature_min' => 'Minimum apparent temperature',
			'direction' => 'Direction',
			'heavy_rains' => 'Rain showers',
			'apparent_temperature_max' => 'Maximum apparent temperature',
			'k_12' => '12-hour',
			'discord' => 'Discord',
			'discard_changes' => 'Are you sure you want to discard your changes?',
			'notifications' => 'Notifications',
			'mph' => 'mph',
			'west' => 'West',
			'validate90' => 'Value must be between -90 and 90',
			'name2' => 'Convenient Design',
			'feels' => 'Feels',
			'precipitation_probability' => 'Precipitation probability',
			'license' => 'Licenses',
			'widget_background' => 'Widget background',
			'large_element' => 'Large weather display',
			'unsaved_changes' => 'Unsaved changes',
			'drizzling_rain' => 'Freezing Drizzle',
			'cloudy' => 'Cloudy',
			'widget' => 'Widget',
			'precipitation' => 'Precipitation',
			'delete' => 'Delete',
			'deleted_cache_store' => 'Clearing the cache',
			'map' => 'Map',
			'description3' => 'If you encounter any issues, please contact us via email or in the application reviews.',
			'north' => 'North',
			'measurements' => 'System of measures',
			'start' => 'Get Started',
			'settings_full' => 'Settings',
			'high' => 'High',
			'daily_variables' => 'Daily weather variables',
			'low' => 'Low',
			'on_inter' => 'Turn on the Internet to get meteorological data.',
			'thunderstorm' => 'Thunderstorm',
			'version' => 'Application version',
			'project' => 'Project on',
			'amoled_theme' => 'AMOLED-theme',
			'deleted_card_weather_query' => 'Are you sure you want to delete the city?',
			'northeast' => 'Northeast',
			'add_widget' => 'Add widget',
			'fog' => 'Fog',
			'description2' => 'All navigation is designed to interact with the application as conveniently and quickly as possible.',
			'mm' => 'mm',
			'no_desc_data' => 'No data',
			'search_city' => 'Find your city',
			'weather_more' => '12-day weather forecast',
			'round_degree' => 'Round degrees',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Search or enter city data manually',
			'validate_name' => 'Please enter the name',
			'sunrise' => 'Sunrise',
			'km' => 'km',
			'district' => 'District',
			'southwest' => 'Southwest',
			'degrees' => 'Degrees',
			'clear_cache_store' => 'Clear cache',
			'skip' => 'Skip',
			'h_pa' => 'hPa',
			'appearance' => 'Appearance',
			'time_start' => 'Start time',
			'ready' => 'Ready',
			'kph' => 'km/h',
			'deleted_cache_store_query' => 'Are you sure you want to clear the cache?',
			'widget_text' => 'Widget text',
			'support' => 'Donate',
			'groups' => 'Our groups',
			'system' => 'System',
			'sunset' => 'Sunset',
			'dewpoint' => 'Dewpoint',
			'shortwave_radiation' => 'Shortwave radiation',
			'language' => 'Language',
			'hide_map' => 'Hide map',
			'cancel' => 'Cancel',
			'loading' => 'Loading...',
			'timeformat' => 'Time format',
			'lat' => 'Latitude',
			'data' => 'Data',
			'visibility' => 'Visibility',
			'deleted_card_weather' => 'Deleting a city',
			'celsius' => 'Celsius',
			'no_location' => 'Enable the location service to get weather data for the current location.',
			'create' => 'Create',
			'edit' => 'Edit',
			'search' => 'Search...',
			'uv_extreme' => 'Extreme',
			'light' => 'Light',
			'cloudcover' => 'Cloudcover',
			'uv_very_high' => 'Very high',
			'snow' => 'Snow',
			'done' => 'Done',
			'theme' => 'Theme',
			'name' => 'Weather',
			'time_range' => 'Frequency (in hours)',
			'about_app' => 'About the app',
			'save' => 'Save',
			'evaporation' => 'Evapotranspiration',
			'freezing_rain' => 'Freezing Rain',
			'uv_average' => 'Moderate',
			'reset_color' => 'Reset to default',
			'metric' => 'Metric',
			'overcast' => 'Overcast',
			'pressure' => 'Pressure',
			'inch' => 'inch',
			'imperial' => 'Imperial',
			'location' => 'Location',
			'error_occurred' => 'An error occurred',
			'validate_value' => 'Please enter a value',
			'lon' => 'Longitude',
			'wind' => 'Wind',
			'normal' => 'Normal',
			'dark' => 'Dark',
			'settings' => 'Set.',
			'south' => 'South',
			'windgusts' => 'Gust',
			'northwest' => 'Northwest',
			'open_meteo' => 'Data by Open-Meteo (CC-BY 4.0)',
			'rain' => 'Rain',
			'mm_hg' => 'mmHg',
			'validate180' => 'Value must be between -180 and 180',
			'description' => 'Weather application with an up-to-date forecast for each hour, day, and week for any location.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dynamic colors',
			'confirm' => 'Confirm',
			'no_results' => 'No results',
			'cities_load_error' => 'Failed to load cities',
			'city_not_found' => 'City not found',
			'retry' => 'Retry',
			'air_quality' => 'Air quality',
			'aqi_standard' => 'AQI standard',
			'aqi_european' => 'European AQI',
			'aqi_american' => 'US AQI',
			'aqi_good' => 'Good',
			'aqi_fair' => 'Fair',
			'aqi_moderate' => 'Moderate',
			'aqi_poor' => 'Poor',
			'aqi_very_poor' => 'Very poor',
			'aqi_extremely_poor' => 'Extremely poor',
			'aqi_unhealthy_sensitive' => 'Unhealthy for sensitive groups',
			'aqi_unhealthy' => 'Unhealthy',
			'aqi_very_unhealthy' => 'Very unhealthy',
			'aqi_hazardous' => 'Hazardous',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Pollutants',
			'european' => 'European',
			'american' => 'American',
			'aqi_advice_good' => 'Great air for outdoor activities.',
			'aqi_advice_fair' => 'Generally fine. Sensitive people may want to limit long outdoor exertion.',
			'aqi_advice_moderate' => 'Sensitive groups should reduce prolonged time outdoors.',
			'aqi_advice_poor' => 'Limit outdoor activity, especially if you are sensitive to air pollution.',
			'aqi_advice_very_poor' => 'Avoid prolonged outdoor exertion. Everyone may feel health effects.',
			'aqi_advice_extremely_poor' => 'Stay indoors if possible. Outdoor activity is not recommended.',
			_ => null,
		};
	}
}
