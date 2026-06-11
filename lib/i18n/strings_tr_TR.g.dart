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
class TranslationsTrTr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTrTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.trTr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr-TR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTrTr _root = this; // ignore: unused_field

	@override 
	TranslationsTrTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTrTr(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'İnternet yok';
	@override String get edit_city_hint => 'Şehir bilgilerini düzenle';
	@override String get location_not_found => 'Konumunuz belirlenemedi';
	@override String get mi => 'mil';
	@override String get next => 'Devam';
	@override String get discard => 'İptal';
	@override String get east => 'Doğu';
	@override String get time_end => 'Bitiş zamanı';
	@override String get search_method => 'Arama veya konum belirleme kullanın';
	@override String get hourly_variables => 'Saatlik hava değişkenleri';
	@override String get uv_index => 'UV-indeksi';
	@override String get clear_sky => 'Açık gökyüzü';
	@override String get k_24 => '24 saat';
	@override String get no_weather_card => 'Şehri ekle';
	@override String get drizzle => 'Çiseleme';
	@override String get humidity => 'Nem';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Fonksiyonlar';
	@override String get cities => 'Şehirler';
	@override String get southeast => 'Güneydoğu';
	@override String get validate_number => 'Lütfen bir sayı girin';
	@override String get city => 'Şehir';
	@override String get uv_high => 'Yüksek';
	@override String get time => 'Şehirde Saat';
	@override String get uv_low => 'Düşük';
	@override String get name3 => 'Bizimle İletişime Geçin';
	@override String get apparent_temperature_min => 'Minimum hissedilen sıcaklık';
	@override String get direction => 'Yön';
	@override String get heavy_rains => 'Aşırı Yağmurlar';
	@override String get apparent_temperature_max => 'Maksimum hissedilen sıcaklık';
	@override String get k_12 => '12 saat';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Değişikliklerinizi iptal etmek istediğinizden emin misiniz?';
	@override String get notifications => 'Bildirme';
	@override String get mph => 'mil/sa';
	@override String get west => 'Batı';
	@override String get validate90 => 'Değer -90 ile 90 arasında olmalıdır';
	@override String get name2 => 'Pratik Tasarım';
	@override String get feels => 'Hissedilen';
	@override String get precipitation_probability => 'Yağış olasılığı';
	@override String get license => 'Lisanslar';
	@override String get widget_background => 'Araç Arka Planı';
	@override String get large_element => 'Büyük hava durumu gösterimi';
	@override String get unsaved_changes => 'Kaydedilmemiş değişiklikler';
	@override String get drizzling_rain => 'Çiseleyen Yağmur';
	@override String get cloudy => 'Bulutlu';
	@override String get widget => 'Araç';
	@override String get precipitation => 'Yağış';
	@override String get delete => 'Sil';
	@override String get deleted_cache_store => 'Önbellek temizleniyor';
	@override String get map => 'Harita';
	@override String get description3 => 'Herhangi bir sorunla karşılaşırsanız, lütfen bize e-posta veya uygulama yorumları aracılığıyla ulaşın.';
	@override String get north => 'Kuzey';
	@override String get measurements => 'Ölçüm sistemi';
	@override String get start => 'Başlat';
	@override String get settings_full => 'Ayarlar';
	@override String get high => 'Yüksek';
	@override String get daily_variables => 'Günlük hava değişkenleri';
	@override String get low => 'Düşük';
	@override String get on_inter => 'Hava durumu verilerini almak için interneti açın.';
	@override String get thunderstorm => 'Gök Gürültülü Fırtına';
	@override String get version => 'Uygulama sürümü';
	@override String get project => 'Proje üzerinde';
	@override String get amoled_theme => 'AMOLED-teması';
	@override String get deleted_card_weather_query => 'Şehri silmek istediğinizden emin misiniz?';
	@override String get northeast => 'Kuzeydoğu';
	@override String get add_widget => 'Widget ekle';
	@override String get fog => 'Sis';
	@override String get description2 => 'Tüm gezinme, uygulama ile mümkün olduğunca rahat ve hızlı etkileşim kurmak için tasarlanmıştır.';
	@override String get mm => 'mm';
	@override String get search_city => 'Şehrinizi bulun';
	@override String get weather_more => '12 günlük hava tahmini';
	@override String get round_degree => 'Dereceleri yuvarla';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Şehir verilerini arayın veya manuel girin';
	@override String get validate_name => 'Lütfen bir isim girin';
	@override String get sunrise => 'Güneş doğuşu';
	@override String get km => 'km';
	@override String get district => 'İlçe';
	@override String get southwest => 'Güneybatı';
	@override String get degrees => 'Dereceler';
	@override String get clear_cache_store => 'Önbelleği temizle';
	@override String get skip => 'Geç';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Görünüm';
	@override String get time_start => 'Başlangıç zamanı';
	@override String get ready => 'Hazır';
	@override String get kph => 'km/sa';
	@override String get deleted_cache_store_query => 'Önbelleği temizlemek istediğinizden emin misiniz?';
	@override String get widget_text => 'Araç metni';
	@override String get support => 'Destek';
	@override String get groups => 'Gruplarımız';
	@override String get system => 'Sistem';
	@override String get sunset => 'Güneş batışı';
	@override String get dewpoint => 'Çiğ noktası';
	@override String get shortwave_radiation => 'Kısa dalga radyasyonu';
	@override String get language => 'Dil';
	@override String get hide_map => 'Haritayı gizle';
	@override String get cancel => 'İptal';
	@override String get loading => 'Yükleniyor...';
	@override String get timeformat => 'Saat biçimi';
	@override String get lat => 'Enlem';
	@override String get data => 'Veri';
	@override String get visibility => 'Görüş';
	@override String get deleted_card_weather => 'Şehir silme';
	@override String get celsius => 'Celsius';
	@override String get no_location => 'Mevcut konumun hava durumu verilerini almak için konum servisini açın.';
	@override String get create => 'Oluştur';
	@override String get edit => 'Düzenle';
	@override String get search => 'Arayış...';
	@override String get uv_extreme => 'Aşırı';
	@override String get light => 'Aydınlık';
	@override String get cloudcover => 'Bulut örtüsü';
	@override String get uv_very_high => 'Çok yüksek';
	@override String get snow => 'Kar';
	@override String get done => 'Tamam';
	@override String get theme => 'Tema';
	@override String get name => 'Hava Durumu';
	@override String get time_range => 'Sıklık (saat cinsinden)';
	@override String get about_app => 'Uygulama hakkında';
	@override String get save => 'Kaydet';
	@override String get evaporation => 'Buharlaşma';
	@override String get freezing_rain => 'Dondurucu Yağmur';
	@override String get uv_average => 'Orta';
	@override String get reset_color => 'Varsayılana sıfırla';
	@override String get metric => 'Metrik';
	@override String get overcast => 'Kapalı';
	@override String get pressure => 'Basınç';
	@override String get inch => 'inç';
	@override String get imperial => 'İmparatorluk';
	@override String get location => 'Konum';
	@override String get error_occurred => 'Bir hata oluştu';
	@override String get validate_value => 'Lütfen bir değer girin';
	@override String get lon => 'Boylam';
	@override String get wind => 'Rüzgar';
	@override String get normal => 'Normal';
	@override String get dark => 'Karanlık';
	@override String get settings => 'Ayarlar';
	@override String get south => 'Güney';
	@override String get windgusts => 'Bir telaş';
	@override String get northwest => 'Kuzeybatı';
	@override String get open_meteo => 'Open-Meteo\'dan veriler (CC-BY 4.0)';
	@override String get rain => 'Yağmur';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Değer -180 ile 180 arasında olmalıdır';
	@override String get description => 'Herhangi bir yer için her saat, gün ve hafta için güncel hava durumu tahmini sunan hava durumu uygulaması.';
	@override String get fahrenheit => 'Fahrenheit';
	@override String get m_s => 'm/s';
	@override String get material_color => 'Dinamik Renkler';
	@override String get confirm => 'Kaydet';
	@override String get no_results => 'Sonuç bulunamadı';
	@override String get cities_load_error => 'Şehirler yüklenemedi';
	@override String get retry => 'Tekrar dene';
	@override String get city_not_found => 'Şehir bulunamadı';
	@override String get air_quality => 'Hava kalitesi';
	@override String get aqi_standard => 'AQI standardı';
	@override String get aqi_european => 'Avrupa AQI';
	@override String get aqi_american => 'ABD AQI';
	@override String get aqi_good => 'İyi';
	@override String get aqi_fair => 'Orta';
	@override String get aqi_moderate => 'Orta';
	@override String get aqi_poor => 'Kötü';
	@override String get aqi_very_poor => 'Çok kötü';
	@override String get aqi_extremely_poor => 'Aşırı kötü';
	@override String get aqi_unhealthy_sensitive => 'Hassas gruplar için sağlıksız';
	@override String get aqi_unhealthy => 'Sağlıksız';
	@override String get aqi_very_unhealthy => 'Çok sağlıksız';
	@override String get aqi_hazardous => 'Tehlikeli';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Avrupa';
	@override String get american => 'Amerikan';
	@override String get aqi_advice_good => 'Açık hava aktiviteleri için iyi hava.';
	@override String get aqi_advice_fair => 'Genel olarak iyi. Hassas kişiler uzun süreli dış mekan eforunu sınırlayabilir.';
	@override String get aqi_advice_moderate => 'Hassas gruplar dışarıda geçirdikleri süreyi azaltmalı.';
	@override String get aqi_advice_poor => 'Özellikle hassassanız açık hava aktivitelerini sınırlayın.';
	@override String get aqi_advice_very_poor => 'Uzun süreli dış mekan eforundan kaçının. Sağlık etkileri görülebilir.';
	@override String get aqi_advice_extremely_poor => 'Mümkünse içeride kalın. Açık hava aktivitesi önerilmez.';
	@override String get aqi_help_how_calculated_european => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.';
	@override String get aqi_help_how_calculated_american => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.';
	@override String get aqi_help_dominant => 'Highest pollutant level';
	@override String get aqi_help_advice_label => 'Recommendation';
	@override String get aqi_help_source => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Kirleticiler';
	@override String get widget_battery_hint => 'For reliable widget updates, disable battery optimization for Rain in app settings';
	@override String get persistent_notification => 'Persistent notification';
	@override String get last_updated => 'Güncellendi';
	@override String get app_font => 'Yazı tipi';
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

/// The flat map containing all translations for locale <tr-TR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTrTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'İnternet yok',
			'edit_city_hint' => 'Şehir bilgilerini düzenle',
			'location_not_found' => 'Konumunuz belirlenemedi',
			'mi' => 'mil',
			'next' => 'Devam',
			'discard' => 'İptal',
			'east' => 'Doğu',
			'time_end' => 'Bitiş zamanı',
			'search_method' => 'Arama veya konum belirleme kullanın',
			'hourly_variables' => 'Saatlik hava değişkenleri',
			'uv_index' => 'UV-indeksi',
			'clear_sky' => 'Açık gökyüzü',
			'k_24' => '24 saat',
			'no_weather_card' => 'Şehri ekle',
			'drizzle' => 'Çiseleme',
			'humidity' => 'Nem',
			'telegram' => 'Telegram',
			'functions' => 'Fonksiyonlar',
			'cities' => 'Şehirler',
			'southeast' => 'Güneydoğu',
			'validate_number' => 'Lütfen bir sayı girin',
			'city' => 'Şehir',
			'uv_high' => 'Yüksek',
			'time' => 'Şehirde Saat',
			'uv_low' => 'Düşük',
			'name3' => 'Bizimle İletişime Geçin',
			'apparent_temperature_min' => 'Minimum hissedilen sıcaklık',
			'direction' => 'Yön',
			'heavy_rains' => 'Aşırı Yağmurlar',
			'apparent_temperature_max' => 'Maksimum hissedilen sıcaklık',
			'k_12' => '12 saat',
			'discord' => 'Discord',
			'discard_changes' => 'Değişikliklerinizi iptal etmek istediğinizden emin misiniz?',
			'notifications' => 'Bildirme',
			'mph' => 'mil/sa',
			'west' => 'Batı',
			'validate90' => 'Değer -90 ile 90 arasında olmalıdır',
			'name2' => 'Pratik Tasarım',
			'feels' => 'Hissedilen',
			'precipitation_probability' => 'Yağış olasılığı',
			'license' => 'Lisanslar',
			'widget_background' => 'Araç Arka Planı',
			'large_element' => 'Büyük hava durumu gösterimi',
			'unsaved_changes' => 'Kaydedilmemiş değişiklikler',
			'drizzling_rain' => 'Çiseleyen Yağmur',
			'cloudy' => 'Bulutlu',
			'widget' => 'Araç',
			'precipitation' => 'Yağış',
			'delete' => 'Sil',
			'deleted_cache_store' => 'Önbellek temizleniyor',
			'map' => 'Harita',
			'description3' => 'Herhangi bir sorunla karşılaşırsanız, lütfen bize e-posta veya uygulama yorumları aracılığıyla ulaşın.',
			'north' => 'Kuzey',
			'measurements' => 'Ölçüm sistemi',
			'start' => 'Başlat',
			'settings_full' => 'Ayarlar',
			'high' => 'Yüksek',
			'daily_variables' => 'Günlük hava değişkenleri',
			'low' => 'Düşük',
			'on_inter' => 'Hava durumu verilerini almak için interneti açın.',
			'thunderstorm' => 'Gök Gürültülü Fırtına',
			'version' => 'Uygulama sürümü',
			'project' => 'Proje üzerinde',
			'amoled_theme' => 'AMOLED-teması',
			'deleted_card_weather_query' => 'Şehri silmek istediğinizden emin misiniz?',
			'northeast' => 'Kuzeydoğu',
			'add_widget' => 'Widget ekle',
			'fog' => 'Sis',
			'description2' => 'Tüm gezinme, uygulama ile mümkün olduğunca rahat ve hızlı etkileşim kurmak için tasarlanmıştır.',
			'mm' => 'mm',
			'search_city' => 'Şehrinizi bulun',
			'weather_more' => '12 günlük hava tahmini',
			'round_degree' => 'Dereceleri yuvarla',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Şehir verilerini arayın veya manuel girin',
			'validate_name' => 'Lütfen bir isim girin',
			'sunrise' => 'Güneş doğuşu',
			'km' => 'km',
			'district' => 'İlçe',
			'southwest' => 'Güneybatı',
			'degrees' => 'Dereceler',
			'clear_cache_store' => 'Önbelleği temizle',
			'skip' => 'Geç',
			'h_pa' => 'hPa',
			'appearance' => 'Görünüm',
			'time_start' => 'Başlangıç zamanı',
			'ready' => 'Hazır',
			'kph' => 'km/sa',
			'deleted_cache_store_query' => 'Önbelleği temizlemek istediğinizden emin misiniz?',
			'widget_text' => 'Araç metni',
			'support' => 'Destek',
			'groups' => 'Gruplarımız',
			'system' => 'Sistem',
			'sunset' => 'Güneş batışı',
			'dewpoint' => 'Çiğ noktası',
			'shortwave_radiation' => 'Kısa dalga radyasyonu',
			'language' => 'Dil',
			'hide_map' => 'Haritayı gizle',
			'cancel' => 'İptal',
			'loading' => 'Yükleniyor...',
			'timeformat' => 'Saat biçimi',
			'lat' => 'Enlem',
			'data' => 'Veri',
			'visibility' => 'Görüş',
			'deleted_card_weather' => 'Şehir silme',
			'celsius' => 'Celsius',
			'no_location' => 'Mevcut konumun hava durumu verilerini almak için konum servisini açın.',
			'create' => 'Oluştur',
			'edit' => 'Düzenle',
			'search' => 'Arayış...',
			'uv_extreme' => 'Aşırı',
			'light' => 'Aydınlık',
			'cloudcover' => 'Bulut örtüsü',
			'uv_very_high' => 'Çok yüksek',
			'snow' => 'Kar',
			'done' => 'Tamam',
			'theme' => 'Tema',
			'name' => 'Hava Durumu',
			'time_range' => 'Sıklık (saat cinsinden)',
			'about_app' => 'Uygulama hakkında',
			'save' => 'Kaydet',
			'evaporation' => 'Buharlaşma',
			'freezing_rain' => 'Dondurucu Yağmur',
			'uv_average' => 'Orta',
			'reset_color' => 'Varsayılana sıfırla',
			'metric' => 'Metrik',
			'overcast' => 'Kapalı',
			'pressure' => 'Basınç',
			'inch' => 'inç',
			'imperial' => 'İmparatorluk',
			'location' => 'Konum',
			'error_occurred' => 'Bir hata oluştu',
			'validate_value' => 'Lütfen bir değer girin',
			'lon' => 'Boylam',
			'wind' => 'Rüzgar',
			'normal' => 'Normal',
			'dark' => 'Karanlık',
			'settings' => 'Ayarlar',
			'south' => 'Güney',
			'windgusts' => 'Bir telaş',
			'northwest' => 'Kuzeybatı',
			'open_meteo' => 'Open-Meteo\'dan veriler (CC-BY 4.0)',
			'rain' => 'Yağmur',
			'mm_hg' => 'mmHg',
			'validate180' => 'Değer -180 ile 180 arasında olmalıdır',
			'description' => 'Herhangi bir yer için her saat, gün ve hafta için güncel hava durumu tahmini sunan hava durumu uygulaması.',
			'fahrenheit' => 'Fahrenheit',
			'm_s' => 'm/s',
			'material_color' => 'Dinamik Renkler',
			'confirm' => 'Kaydet',
			'no_results' => 'Sonuç bulunamadı',
			'cities_load_error' => 'Şehirler yüklenemedi',
			'retry' => 'Tekrar dene',
			'city_not_found' => 'Şehir bulunamadı',
			'air_quality' => 'Hava kalitesi',
			'aqi_standard' => 'AQI standardı',
			'aqi_european' => 'Avrupa AQI',
			'aqi_american' => 'ABD AQI',
			'aqi_good' => 'İyi',
			'aqi_fair' => 'Orta',
			'aqi_moderate' => 'Orta',
			'aqi_poor' => 'Kötü',
			'aqi_very_poor' => 'Çok kötü',
			'aqi_extremely_poor' => 'Aşırı kötü',
			'aqi_unhealthy_sensitive' => 'Hassas gruplar için sağlıksız',
			'aqi_unhealthy' => 'Sağlıksız',
			'aqi_very_unhealthy' => 'Çok sağlıksız',
			'aqi_hazardous' => 'Tehlikeli',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Avrupa',
			'american' => 'Amerikan',
			'aqi_advice_good' => 'Açık hava aktiviteleri için iyi hava.',
			'aqi_advice_fair' => 'Genel olarak iyi. Hassas kişiler uzun süreli dış mekan eforunu sınırlayabilir.',
			'aqi_advice_moderate' => 'Hassas gruplar dışarıda geçirdikleri süreyi azaltmalı.',
			'aqi_advice_poor' => 'Özellikle hassassanız açık hava aktivitelerini sınırlayın.',
			'aqi_advice_very_poor' => 'Uzun süreli dış mekan eforundan kaçının. Sağlık etkileri görülebilir.',
			'aqi_advice_extremely_poor' => 'Mümkünse içeride kalın. Açık hava aktivitesi önerilmez.',
			'aqi_help_how_calculated_european' => 'Hourly European AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, and SO₂. Scale: 0–20 good, 20–40 fair, 40–60 moderate, 60–80 poor, 80–100 very poor, above 100 extremely poor.',
			'aqi_help_how_calculated_american' => 'Hourly US AQI from Open-Meteo (Copernicus CAMS). The overall index is the maximum of the individual indices for PM2.5, PM10, ozone, NO₂, SO₂, and CO. Scale: 0–50 good, 51–100 moderate, 101–150 unhealthy for sensitive groups, 151–200 unhealthy, 201–300 very unhealthy, 301–500 hazardous.',
			'aqi_help_dominant' => 'Highest pollutant level',
			'aqi_help_advice_label' => 'Recommendation',
			'aqi_help_source' => 'Source: Open-Meteo Air Quality API — ground-level concentrations (~10 m), ~11 km grid.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Kirleticiler',
			'widget_battery_hint' => 'For reliable widget updates, disable battery optimization for Rain in app settings',
			'persistent_notification' => 'Persistent notification',
			'last_updated' => 'Güncellendi',
			'app_font' => 'Yazı tipi',
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
