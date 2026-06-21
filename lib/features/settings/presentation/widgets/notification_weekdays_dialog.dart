import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/services/notification_weekdays.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/features/settings/presentation/widgets/settings_list_dialog_shell.dart';
import 'package:rain/i18n/tr.dart';

/// Saved weekday selection from [showNotificationWeekdaysDialog].
///
/// [mask] is `null` when every day is enabled — that must not be confused with
/// dismissing the dialog (which returns no result at all).
class NotificationWeekdaysDialogResult {
  const NotificationWeekdaysDialogResult({required this.mask});

  /// Bitmask of enabled days; `null` means all days.
  final int? mask;
}

/// Saved weekday mask, or `null` when the dialog is dismissed without saving.
Future<NotificationWeekdaysDialogResult?> showNotificationWeekdaysDialog({
  required BuildContext context,
  required int? currentMask,
  required String languageCode,
}) async {
  return NavigationHelper.showAppDialog<NotificationWeekdaysDialogResult>(
    context: context,
    child: _NotificationWeekdaysDialog(
      currentMask: currentMask,
      languageCode: languageCode,
    ),
  );
}

class _NotificationWeekdaysDialog extends StatefulWidget {
  const _NotificationWeekdaysDialog({
    required this.currentMask,
    required this.languageCode,
  });

  final int? currentMask;
  final String languageCode;

  @override
  State<_NotificationWeekdaysDialog> createState() =>
      _NotificationWeekdaysDialogState();
}

class _NotificationWeekdaysDialogState
    extends State<_NotificationWeekdaysDialog> {
  late Set<int> _selected;

  @override
  void initState() {
    super.initState();
    _selected = notificationWeekdaysFromMask(widget.currentMask);
  }

  void _toggleWeekday(int weekday) {
    setState(() {
      if (_selected.contains(weekday)) {
        // At least one weekday must stay enabled while notifications are on.
        if (_selected.length > 1) {
          _selected.remove(weekday);
        }
      } else {
        _selected.add(weekday);
      }
    });
  }

  void _save() {
    NavigationHelper.back(
      context,
      result: NotificationWeekdaysDialogResult(
        mask: notificationWeekdaysMaskFromSet(_selected),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsListDialogShell(
      header: SettingsListDialogHeader(
        title: 'notificationWeekdays'.tr,
        icon: IconsaxPlusLinear.calendar_1,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: AppConstants.spacingS),
        itemCount: notificationIsoWeekdays.length,
        itemBuilder: (context, index) {
          final weekday = notificationIsoWeekdays[index];

          return SettingsDialogListTile(
            title: notificationWeekdayLabel(weekday, widget.languageCode),
            isSelected: _selected.contains(weekday),
            onTap: () => _toggleWeekday(weekday),
          );
        },
      ),
      footer: SettingsListDialogCancelSaveActions(onSave: _save),
    );
  }
}
