import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/date_symbol_data_local.dart';
import 'package:rain/i18n/strings.g.dart';

bool _initialized = false;

/// Initializes slang locale, timezone data, and intl formatting for tests.
Future<void> initTestEnvironment() async {
  if (_initialized) return;
  LocaleSettings.setLocale(AppLocale.enUs);
  tz.initializeTimeZones();
  await initializeDateFormatting('en');
  _initialized = true;
}
