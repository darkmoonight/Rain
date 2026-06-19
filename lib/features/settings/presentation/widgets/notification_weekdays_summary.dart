import 'package:rain/core/services/notification_weekdays.dart';
import 'package:rain/i18n/tr.dart';

/// Settings subtitle for [Settings.notificationWeekdaysMask].
String formatNotificationWeekdaysSummary({
  required int? mask,
  required String languageCode,
}) {
  if (mask == null) return 'notificationWeekdaysAll'.tr;
  final enabled = notificationWeekdaysFromMask(mask).toList()..sort();
  if (enabled.isEmpty) return 'notificationWeekdaysNone'.tr;
  if (enabled.length == notificationIsoWeekdays.length) {
    return 'notificationWeekdaysAll'.tr;
  }
  final range = formatConsecutiveNotificationWeekdayRange(
    enabled,
    languageCode,
  );
  if (range != null) return range;
  return enabled
      .map(
        (weekday) =>
            notificationWeekdayLabel(weekday, languageCode, abbrev: true),
      )
      .join(', ');
}
