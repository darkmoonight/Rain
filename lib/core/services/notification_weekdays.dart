import 'package:rain/core/i18n/locale_format_helper.dart';

/// ISO weekdays used for notification scheduling (Monday = 1 … Sunday = 7).
const notificationIsoWeekdays = [1, 2, 3, 4, 5, 6, 7];

/// Weekday bitmask layout: Monday = bit 0 … Sunday = bit 6.
///
/// [Settings.notificationWeekdaysMask] uses `null` to mean all days enabled.
/// A value of `0` means no days are enabled.
bool _isWeekdayBitSet(int weekday, int mask) =>
    (mask & (1 << (weekday - 1))) != 0;

/// Reference Monday for stable weekday labels (2024-01-01).
final _referenceMonday = DateTime(2024, 1, 1);

/// Wall-clock [DateTime] for [weekday] on the reference week.
DateTime notificationWeekdayDate(int weekday) =>
    _referenceMonday.add(Duration(days: weekday - DateTime.monday));

/// Localized weekday name for [weekday] (ISO).
String notificationWeekdayLabel(
  int weekday,
  String languageCode, {
  bool abbrev = false,
}) {
  final date = notificationWeekdayDate(weekday);
  return abbrev
      ? LocaleFormatHelper.weekdayAbbrev(date, languageCode)
      : LocaleFormatHelper.weekdayName(date, languageCode);
}

/// Enabled ISO weekdays from [mask]; `null` enables every day.
Set<int> notificationWeekdaysFromMask(int? mask) {
  if (mask == null) return notificationIsoWeekdays.toSet();
  if (mask == 0) return {};
  return {
    for (final weekday in notificationIsoWeekdays)
      if (_isWeekdayBitSet(weekday, mask)) weekday,
  };
}

/// Bitmask for [weekdays]; returns `null` when all days are selected.
int? notificationWeekdaysMaskFromSet(Set<int> weekdays) {
  if (weekdays.length >= notificationIsoWeekdays.length) return null;
  if (weekdays.isEmpty) return 0;
  var mask = 0;
  for (final weekday in weekdays) {
    mask |= 1 << (weekday - 1);
  }
  return mask;
}

/// Whether forecast alarms may fire on [weekday] (ISO).
bool isNotificationWeekdayEnabled(int weekday, int? mask) {
  if (mask == null) return true;
  if (mask == 0) return false;
  if (weekday < DateTime.monday || weekday > DateTime.sunday) return false;
  return _isWeekdayBitSet(weekday, mask);
}

/// Abbreviated weekday range when [weekdays] form one consecutive block.
String? formatConsecutiveNotificationWeekdayRange(
  List<int> weekdays,
  String languageCode,
) {
  if (weekdays.length < 2) return null;
  for (var i = 1; i < weekdays.length; i++) {
    if (weekdays[i] != weekdays[i - 1] + 1) return null;
  }
  final start = notificationWeekdayLabel(
    weekdays.first,
    languageCode,
    abbrev: true,
  );
  final end = notificationWeekdayLabel(
    weekdays.last,
    languageCode,
    abbrev: true,
  );
  return '$start–$end';
}
