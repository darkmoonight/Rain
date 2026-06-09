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
class TranslationsElGr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsElGr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.elGr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <el-GR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsElGr _root = this; // ignore: unused_field

	@override 
	TranslationsElGr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsElGr(meta: meta ?? this.$meta);

	// Translations
	@override String get no_inter => 'Χωρίς Internet';
	@override String get edit_city_hint => 'Επεξεργασία πληροφοριών πόλης';
	@override String get location_not_found => 'Αδυναμία προσδιορισμού της τοποθεσίας σας';
	@override String get mi => 'mi';
	@override String get next => 'Επόμενο';
	@override String get discard => 'Απόρριψη';
	@override String get east => 'Ανατολικά';
	@override String get time_end => 'Ώρα λήξης';
	@override String get search_method => 'Χρήση αναζήτησης ή γεωγραφικής τοποθεσίας';
	@override String get hourly_variables => 'Ωριαίες μεταβλητές καιρού';
	@override String get uv_index => 'Δείκτης UV';
	@override String get clear_sky => 'Αίθριος ουρανός';
	@override String get k_24 => '24ωρο';
	@override String get no_weather_card => 'Επιλογή πόλης';
	@override String get drizzle => 'Ψιχάλα';
	@override String get humidity => 'Υγρασία';
	@override String get telegram => 'Telegram';
	@override String get functions => 'Λειτουργίες';
	@override String get cities => 'Πόλεις';
	@override String get southeast => 'Νοτιοανατολικά';
	@override String get validate_number => 'Παρακαλώ εισάγετε έναν έγκυρο αριθμό';
	@override String get city => 'Πόλη';
	@override String get uv_high => 'Υψηλός';
	@override String get time => 'Τοπική ώρα';
	@override String get uv_low => 'Χαμηλός';
	@override String get name3 => 'Επικοινωνήστε μαζί μας';
	@override String get apparent_temperature_min => 'Ελάχιστη φαινομενική θερμοκρασία';
	@override String get direction => 'Κατεύθυνση';
	@override String get heavy_rains => 'Βροχόπτωση';
	@override String get apparent_temperature_max => 'Μέγιστη φαινομενική θερμοκρασία';
	@override String get k_12 => '12ωρο';
	@override String get discord => 'Discord';
	@override String get discard_changes => 'Είστε σίγουροι ότι θέλετε να απορρίψετε τις αλλαγές σας;';
	@override String get notifications => 'Ειδοποιήσεις';
	@override String get mph => 'mph';
	@override String get west => 'Δύση';
	@override String get validate90 => 'Η τιμή πρέπει να είναι μεταξύ -90 και 90';
	@override String get name2 => 'Εύχρηστος Σχεδιασμός';
	@override String get feels => 'Αίσθηση';
	@override String get precipitation_probability => 'Πιθανότητα βροχόπτωσης';
	@override String get license => 'Άδειες';
	@override String get widget_background => 'Φόντο γραφικού στοιχείου';
	@override String get large_element => 'Μεγάλη παρουσίαση καιρού';
	@override String get unsaved_changes => 'Μη αποθηκευμένες αλλαγές';
	@override String get drizzling_rain => 'Παγωμένη ψιχάλα';
	@override String get cloudy => 'Συννεφιά';
	@override String get widget => 'Γραφικό στοιχείο';
	@override String get precipitation => 'Κατακρήμνιση';
	@override String get delete => 'Διαγραφή';
	@override String get deleted_cache_store => 'Εκκαθάριση προσωρινής μνήμης';
	@override String get map => 'Χάρτης';
	@override String get description3 => 'Εάν αντιμετωπίσετε προβλήματα, επικοινωνήστε μαζί μας μέσω email ή στις κριτικές της εφαρμογής.';
	@override String get north => 'Βορράς';
	@override String get measurements => 'Σύστημα μέτρησης';
	@override String get start => 'Ξεκινήστε';
	@override String get settings_full => 'Ρυθμίσεις';
	@override String get high => 'Υψηλή';
	@override String get daily_variables => 'Ημερήσιες μεταβλητές καιρού';
	@override String get low => 'Χαμηλή';
	@override String get on_inter => 'Ενεργοποιήστε το Internet για να λάβετε μετεωρολογικά δεδομένα.';
	@override String get thunderstorm => 'Καταιγίδα';
	@override String get version => 'Έκδοση εφαρμογής';
	@override String get project => 'Έργο στο';
	@override String get amoled_theme => 'Θέμα AMOLED';
	@override String get deleted_card_weather_query => 'Είστε σίγουροι ότι θέλετε να διαγράψετε την πόλη;';
	@override String get northeast => 'Βορειοανατολικά';
	@override String get add_widget => 'Προσθήκη γραφικού στοιχείου';
	@override String get fog => 'Ομίχλη';
	@override String get description2 => 'Όλη η πλοήγηση έχει σχεδιαστεί για να αλληλεπιδρά με την εφαρμογή όσο το δυνατόν πιο εύκολα και γρήγορα.';
	@override String get mm => 'mm';
	@override String get no_desc_data => 'Χωρίς δεδομένα';
	@override String get search_city => 'Αναζήτηση πόλης';
	@override String get weather_more => '12ήμερη πρόβλεψη καιρού';
	@override String get round_degree => 'Στρογγυλοποίηση μοιρών';
	@override String get w_m2 => 'W/m2';
	@override String get create_city_hint => 'Αναζήτηση ή χειροκίνητη εισαγωγή δεδομένων πόλης';
	@override String get validate_name => 'Παρακαλώ εισάγετε το όνομα';
	@override String get sunrise => 'Ανατολή ηλίου';
	@override String get km => 'χλμ';
	@override String get district => 'Περιοχή';
	@override String get southwest => 'Νοτιοδυτικά';
	@override String get degrees => 'Βαθμοί';
	@override String get clear_cache_store => 'Εκκαθάριση προσωρινής μνήμης';
	@override String get skip => 'Παράλειψη';
	@override String get h_pa => 'hPa';
	@override String get appearance => 'Εμφάνιση';
	@override String get time_start => 'Ώρα εκκίνησης';
	@override String get ready => 'Έτοιμο';
	@override String get kph => 'χλμ/ω';
	@override String get deleted_cache_store_query => 'Είστε σίγουροι ότι θέλετε να εκκαθαρίσετε την προσωρινή μνήμη;';
	@override String get widget_text => 'Κείμενο γραφικού στοιχείου';
	@override String get support => 'Δωρεά';
	@override String get groups => 'Οι ομάδες μας';
	@override String get system => 'Σύστημα';
	@override String get sunset => 'Ηλιοβασίλεμα';
	@override String get dewpoint => 'Σημείο δρόσου';
	@override String get shortwave_radiation => 'Βραχύκυμα ακτινοβολίας';
	@override String get language => 'Γλώσσα';
	@override String get hide_map => 'Απόκρυψη χάρτη';
	@override String get cancel => 'Ακύρωση';
	@override String get loading => 'Φόρτωση...';
	@override String get timeformat => 'Μορφή ώρας';
	@override String get lat => 'Πλάτος';
	@override String get data => 'Δεδομένα';
	@override String get visibility => 'Ορατότητα';
	@override String get deleted_card_weather => 'Διαγραφή πόλης';
	@override String get celsius => 'Κελσίου (C)';
	@override String get no_location => 'Ενεργοποιήστε την υπηρεσία τοποθεσίας για να λαμβάνετε δεδομένα καιρού για την τρέχουσα τοποθεσία.';
	@override String get create => 'Δημιουργία';
	@override String get edit => 'Επεξεργασία';
	@override String get search => 'Αναζήτηση...';
	@override String get uv_extreme => 'Ακραίος';
	@override String get light => 'Φωτεινό';
	@override String get cloudcover => 'Νεφοκάλυψη';
	@override String get uv_very_high => 'Πολύ υψηλός';
	@override String get snow => 'Χιόνι';
	@override String get done => 'Ολοκλήρωση';
	@override String get theme => 'Θέμα';
	@override String get name => 'Καιρός';
	@override String get time_range => 'Συχνότητα (σε ώρες)';
	@override String get about_app => 'Σχετικά με την εφαρμογή';
	@override String get save => 'Αποθήκευση';
	@override String get evaporation => 'Εξατμισοδιαπνοή';
	@override String get freezing_rain => 'Παγωμένη βροχή';
	@override String get uv_average => 'Μέτριος';
	@override String get reset_color => 'Επαναφορά στα προεπιλεγμένα';
	@override String get metric => 'Μετρικό';
	@override String get overcast => 'Νεφελώδης';
	@override String get pressure => 'Πίεση';
	@override String get inch => 'ίντσες';
	@override String get imperial => 'Αυτοκρατορικό';
	@override String get location => 'Τοποθεσία';
	@override String get error_occurred => 'Παρουσιάστηκε σφάλμα';
	@override String get validate_value => 'Παρακαλώ εισάγετε μια τιμή';
	@override String get lon => 'Μήκος';
	@override String get wind => 'Άνεμος';
	@override String get normal => 'Κανονική';
	@override String get dark => 'Σκούρο';
	@override String get settings => 'Ρυθ.';
	@override String get south => 'Νότος';
	@override String get windgusts => 'Ριπή';
	@override String get northwest => 'Βορειοδυτικά';
	@override String get open_meteo => 'Δεδομένα από Open-Meteo (CC-BY 4.0)';
	@override String get rain => 'Βροχή';
	@override String get mm_hg => 'mmHg';
	@override String get validate180 => 'Η τιμή πρέπει να είναι μεταξύ -180 και 180';
	@override String get description => 'Εφαρμογή καιρού με έγκαιρη πρόγνωση για κάθε ώρα, ημέρα και εβδομάδα για οποιαδήποτε τοποθεσία.';
	@override String get fahrenheit => 'Φαρενάιτ (F)';
	@override String get m_s => 'μ/δ';
	@override String get material_color => 'Δυναμικά χρώματα';
	@override String get confirm => 'Αποθήκευση';
	@override String get no_results => 'Δεν υπάρχουν αποτελέσματα';
	@override String get cities_load_error => 'Αποτυχία φόρτωσης πόλεων';
	@override String get retry => 'Επανάληψη';
	@override String get city_not_found => 'Η πόλη δεν βρέθηκε';
	@override String get air_quality => 'Ποιότητα αέρα';
	@override String get aqi_standard => 'Πρότυπο AQI';
	@override String get aqi_european => 'Ευρωπαϊκό AQI';
	@override String get aqi_american => 'Αμερικανικό AQI';
	@override String get aqi_good => 'Καλή';
	@override String get aqi_fair => 'Μέτρια';
	@override String get aqi_moderate => 'Μέτρια';
	@override String get aqi_poor => 'Κακή';
	@override String get aqi_very_poor => 'Πολύ κακή';
	@override String get aqi_extremely_poor => 'Εξαιρετικά κακή';
	@override String get aqi_unhealthy_sensitive => 'Ανθυγιεινή για ευαίσθητους';
	@override String get aqi_unhealthy => 'Ανθυγιεινή';
	@override String get aqi_very_unhealthy => 'Πολύ ανθυγιεινή';
	@override String get aqi_hazardous => 'Επικίνδυνη';
	@override String get pm25 => 'PM2.5';
	@override String get pm10 => 'PM10';
	@override String get ozone => 'O₃';
	@override String get european => 'Ευρωπαϊκό';
	@override String get american => 'Αμερικανικό';
	@override String get aqi_advice_good => 'Καλός αέρας για δραστηριότητες σε εξωτερικό χώρο.';
	@override String get aqi_advice_fair => 'Γενικά εντάξει. Ευαίσθητα άτομα μπορεί να περιορίσουν την παρατεταμένη άσκηση έξω.';
	@override String get aqi_advice_moderate => 'Ευαίσθητες ομάδες θα πρέπει να μειώσουν τον χρόνο έξω.';
	@override String get aqi_advice_poor => 'Περιορίστε τη δραστηριότητα έξω, ειδικά αν είστε ευαίσθητοι στη ρύπανση.';
	@override String get aqi_advice_very_poor => 'Αποφύγετε παρατεταμένη άσκηση έξω. Πιθανές επιπτώσεις στην υγεία για όλους.';
	@override String get aqi_advice_extremely_poor => 'Μείνετε μέσα αν είναι δυνατόν. Δεν συνιστάται δραστηριότητα έξω.';
	@override String get co => 'CO';
	@override String get no2 => 'NO₂';
	@override String get so2 => 'SO₂';
	@override String get pollutants => 'Pollutants';
}

/// The flat map containing all translations for locale <el-GR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsElGr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'no_inter' => 'Χωρίς Internet',
			'edit_city_hint' => 'Επεξεργασία πληροφοριών πόλης',
			'location_not_found' => 'Αδυναμία προσδιορισμού της τοποθεσίας σας',
			'mi' => 'mi',
			'next' => 'Επόμενο',
			'discard' => 'Απόρριψη',
			'east' => 'Ανατολικά',
			'time_end' => 'Ώρα λήξης',
			'search_method' => 'Χρήση αναζήτησης ή γεωγραφικής τοποθεσίας',
			'hourly_variables' => 'Ωριαίες μεταβλητές καιρού',
			'uv_index' => 'Δείκτης UV',
			'clear_sky' => 'Αίθριος ουρανός',
			'k_24' => '24ωρο',
			'no_weather_card' => 'Επιλογή πόλης',
			'drizzle' => 'Ψιχάλα',
			'humidity' => 'Υγρασία',
			'telegram' => 'Telegram',
			'functions' => 'Λειτουργίες',
			'cities' => 'Πόλεις',
			'southeast' => 'Νοτιοανατολικά',
			'validate_number' => 'Παρακαλώ εισάγετε έναν έγκυρο αριθμό',
			'city' => 'Πόλη',
			'uv_high' => 'Υψηλός',
			'time' => 'Τοπική ώρα',
			'uv_low' => 'Χαμηλός',
			'name3' => 'Επικοινωνήστε μαζί μας',
			'apparent_temperature_min' => 'Ελάχιστη φαινομενική θερμοκρασία',
			'direction' => 'Κατεύθυνση',
			'heavy_rains' => 'Βροχόπτωση',
			'apparent_temperature_max' => 'Μέγιστη φαινομενική θερμοκρασία',
			'k_12' => '12ωρο',
			'discord' => 'Discord',
			'discard_changes' => 'Είστε σίγουροι ότι θέλετε να απορρίψετε τις αλλαγές σας;',
			'notifications' => 'Ειδοποιήσεις',
			'mph' => 'mph',
			'west' => 'Δύση',
			'validate90' => 'Η τιμή πρέπει να είναι μεταξύ -90 και 90',
			'name2' => 'Εύχρηστος Σχεδιασμός',
			'feels' => 'Αίσθηση',
			'precipitation_probability' => 'Πιθανότητα βροχόπτωσης',
			'license' => 'Άδειες',
			'widget_background' => 'Φόντο γραφικού στοιχείου',
			'large_element' => 'Μεγάλη παρουσίαση καιρού',
			'unsaved_changes' => 'Μη αποθηκευμένες αλλαγές',
			'drizzling_rain' => 'Παγωμένη ψιχάλα',
			'cloudy' => 'Συννεφιά',
			'widget' => 'Γραφικό στοιχείο',
			'precipitation' => 'Κατακρήμνιση',
			'delete' => 'Διαγραφή',
			'deleted_cache_store' => 'Εκκαθάριση προσωρινής μνήμης',
			'map' => 'Χάρτης',
			'description3' => 'Εάν αντιμετωπίσετε προβλήματα, επικοινωνήστε μαζί μας μέσω email ή στις κριτικές της εφαρμογής.',
			'north' => 'Βορράς',
			'measurements' => 'Σύστημα μέτρησης',
			'start' => 'Ξεκινήστε',
			'settings_full' => 'Ρυθμίσεις',
			'high' => 'Υψηλή',
			'daily_variables' => 'Ημερήσιες μεταβλητές καιρού',
			'low' => 'Χαμηλή',
			'on_inter' => 'Ενεργοποιήστε το Internet για να λάβετε μετεωρολογικά δεδομένα.',
			'thunderstorm' => 'Καταιγίδα',
			'version' => 'Έκδοση εφαρμογής',
			'project' => 'Έργο στο',
			'amoled_theme' => 'Θέμα AMOLED',
			'deleted_card_weather_query' => 'Είστε σίγουροι ότι θέλετε να διαγράψετε την πόλη;',
			'northeast' => 'Βορειοανατολικά',
			'add_widget' => 'Προσθήκη γραφικού στοιχείου',
			'fog' => 'Ομίχλη',
			'description2' => 'Όλη η πλοήγηση έχει σχεδιαστεί για να αλληλεπιδρά με την εφαρμογή όσο το δυνατόν πιο εύκολα και γρήγορα.',
			'mm' => 'mm',
			'no_desc_data' => 'Χωρίς δεδομένα',
			'search_city' => 'Αναζήτηση πόλης',
			'weather_more' => '12ήμερη πρόβλεψη καιρού',
			'round_degree' => 'Στρογγυλοποίηση μοιρών',
			'w_m2' => 'W/m2',
			'create_city_hint' => 'Αναζήτηση ή χειροκίνητη εισαγωγή δεδομένων πόλης',
			'validate_name' => 'Παρακαλώ εισάγετε το όνομα',
			'sunrise' => 'Ανατολή ηλίου',
			'km' => 'χλμ',
			'district' => 'Περιοχή',
			'southwest' => 'Νοτιοδυτικά',
			'degrees' => 'Βαθμοί',
			'clear_cache_store' => 'Εκκαθάριση προσωρινής μνήμης',
			'skip' => 'Παράλειψη',
			'h_pa' => 'hPa',
			'appearance' => 'Εμφάνιση',
			'time_start' => 'Ώρα εκκίνησης',
			'ready' => 'Έτοιμο',
			'kph' => 'χλμ/ω',
			'deleted_cache_store_query' => 'Είστε σίγουροι ότι θέλετε να εκκαθαρίσετε την προσωρινή μνήμη;',
			'widget_text' => 'Κείμενο γραφικού στοιχείου',
			'support' => 'Δωρεά',
			'groups' => 'Οι ομάδες μας',
			'system' => 'Σύστημα',
			'sunset' => 'Ηλιοβασίλεμα',
			'dewpoint' => 'Σημείο δρόσου',
			'shortwave_radiation' => 'Βραχύκυμα ακτινοβολίας',
			'language' => 'Γλώσσα',
			'hide_map' => 'Απόκρυψη χάρτη',
			'cancel' => 'Ακύρωση',
			'loading' => 'Φόρτωση...',
			'timeformat' => 'Μορφή ώρας',
			'lat' => 'Πλάτος',
			'data' => 'Δεδομένα',
			'visibility' => 'Ορατότητα',
			'deleted_card_weather' => 'Διαγραφή πόλης',
			'celsius' => 'Κελσίου (C)',
			'no_location' => 'Ενεργοποιήστε την υπηρεσία τοποθεσίας για να λαμβάνετε δεδομένα καιρού για την τρέχουσα τοποθεσία.',
			'create' => 'Δημιουργία',
			'edit' => 'Επεξεργασία',
			'search' => 'Αναζήτηση...',
			'uv_extreme' => 'Ακραίος',
			'light' => 'Φωτεινό',
			'cloudcover' => 'Νεφοκάλυψη',
			'uv_very_high' => 'Πολύ υψηλός',
			'snow' => 'Χιόνι',
			'done' => 'Ολοκλήρωση',
			'theme' => 'Θέμα',
			'name' => 'Καιρός',
			'time_range' => 'Συχνότητα (σε ώρες)',
			'about_app' => 'Σχετικά με την εφαρμογή',
			'save' => 'Αποθήκευση',
			'evaporation' => 'Εξατμισοδιαπνοή',
			'freezing_rain' => 'Παγωμένη βροχή',
			'uv_average' => 'Μέτριος',
			'reset_color' => 'Επαναφορά στα προεπιλεγμένα',
			'metric' => 'Μετρικό',
			'overcast' => 'Νεφελώδης',
			'pressure' => 'Πίεση',
			'inch' => 'ίντσες',
			'imperial' => 'Αυτοκρατορικό',
			'location' => 'Τοποθεσία',
			'error_occurred' => 'Παρουσιάστηκε σφάλμα',
			'validate_value' => 'Παρακαλώ εισάγετε μια τιμή',
			'lon' => 'Μήκος',
			'wind' => 'Άνεμος',
			'normal' => 'Κανονική',
			'dark' => 'Σκούρο',
			'settings' => 'Ρυθ.',
			'south' => 'Νότος',
			'windgusts' => 'Ριπή',
			'northwest' => 'Βορειοδυτικά',
			'open_meteo' => 'Δεδομένα από Open-Meteo (CC-BY 4.0)',
			'rain' => 'Βροχή',
			'mm_hg' => 'mmHg',
			'validate180' => 'Η τιμή πρέπει να είναι μεταξύ -180 και 180',
			'description' => 'Εφαρμογή καιρού με έγκαιρη πρόγνωση για κάθε ώρα, ημέρα και εβδομάδα για οποιαδήποτε τοποθεσία.',
			'fahrenheit' => 'Φαρενάιτ (F)',
			'm_s' => 'μ/δ',
			'material_color' => 'Δυναμικά χρώματα',
			'confirm' => 'Αποθήκευση',
			'no_results' => 'Δεν υπάρχουν αποτελέσματα',
			'cities_load_error' => 'Αποτυχία φόρτωσης πόλεων',
			'retry' => 'Επανάληψη',
			'city_not_found' => 'Η πόλη δεν βρέθηκε',
			'air_quality' => 'Ποιότητα αέρα',
			'aqi_standard' => 'Πρότυπο AQI',
			'aqi_european' => 'Ευρωπαϊκό AQI',
			'aqi_american' => 'Αμερικανικό AQI',
			'aqi_good' => 'Καλή',
			'aqi_fair' => 'Μέτρια',
			'aqi_moderate' => 'Μέτρια',
			'aqi_poor' => 'Κακή',
			'aqi_very_poor' => 'Πολύ κακή',
			'aqi_extremely_poor' => 'Εξαιρετικά κακή',
			'aqi_unhealthy_sensitive' => 'Ανθυγιεινή για ευαίσθητους',
			'aqi_unhealthy' => 'Ανθυγιεινή',
			'aqi_very_unhealthy' => 'Πολύ ανθυγιεινή',
			'aqi_hazardous' => 'Επικίνδυνη',
			'pm25' => 'PM2.5',
			'pm10' => 'PM10',
			'ozone' => 'O₃',
			'european' => 'Ευρωπαϊκό',
			'american' => 'Αμερικανικό',
			'aqi_advice_good' => 'Καλός αέρας για δραστηριότητες σε εξωτερικό χώρο.',
			'aqi_advice_fair' => 'Γενικά εντάξει. Ευαίσθητα άτομα μπορεί να περιορίσουν την παρατεταμένη άσκηση έξω.',
			'aqi_advice_moderate' => 'Ευαίσθητες ομάδες θα πρέπει να μειώσουν τον χρόνο έξω.',
			'aqi_advice_poor' => 'Περιορίστε τη δραστηριότητα έξω, ειδικά αν είστε ευαίσθητοι στη ρύπανση.',
			'aqi_advice_very_poor' => 'Αποφύγετε παρατεταμένη άσκηση έξω. Πιθανές επιπτώσεις στην υγεία για όλους.',
			'aqi_advice_extremely_poor' => 'Μείνετε μέσα αν είναι δυνατόν. Δεν συνιστάται δραστηριότητα έξω.',
			'co' => 'CO',
			'no2' => 'NO₂',
			'so2' => 'SO₂',
			'pollutants' => 'Pollutants',
			_ => null,
		};
	}
}
