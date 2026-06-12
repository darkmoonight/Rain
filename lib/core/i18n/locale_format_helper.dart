import 'package:intl/intl.dart';
import 'package:rain/core/utils/string_utils.dart';

/// Locale-aware date labels for cards, headers, and forecast rows.
///
/// intl returns lowercase weekdays in some locales (e.g. Russian); every
/// formatter here capitalizes the first letter for consistent UI labels.
class LocaleFormatHelper {
  LocaleFormatHelper._();

  static String _format(DateTime date, String languageCode, String pattern) =>
      capitalizeFirst(DateFormat(pattern, languageCode).format(date));

  /// Full weekday name (`EEEE`), e.g. Monday / Понедельник.
  static String weekdayName(DateTime date, String languageCode) =>
      _format(date, languageCode, 'EEEE');

  /// Short weekday (`E`), e.g. Mon / пн.
  static String weekdayAbbrev(DateTime date, String languageCode) =>
      _format(date, languageCode, 'E');

  /// Long date with weekday (`MMMMEEEEd`) for daily list rows and detail headers.
  static String fullDateWithWeekday(DateTime date, String languageCode) =>
      _format(date, languageCode, 'MMMMEEEEd');

  /// Calendar date with weekday (`yMMMEd`).
  static String calendarDate(DateTime date, String languageCode) =>
      _format(date, languageCode, 'yMMMEd');
}
