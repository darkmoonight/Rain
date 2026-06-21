import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/utils/app_time_picker.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/settings/presentation/widgets/notification_weekdays_dialog.dart';
import 'package:rain/features/settings/presentation/widgets/notification_weekdays_summary.dart';
import 'package:rain/features/settings/presentation/widgets/selection_dialog.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section_state.dart';
import 'package:rain/features/settings/presentation/widgets/settings_switch_tile.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/i18n/tr.dart';

/// Location and notification settings.
class SettingsFunctionsSection extends ConsumerStatefulWidget {
  const SettingsFunctionsSection({super.key});

  @override
  ConsumerState<SettingsFunctionsSection> createState() =>
      _SettingsFunctionsSectionState();
}

class _SettingsFunctionsSectionState
    extends SettingsSectionConsumerState<SettingsFunctionsSection> {
  Settings get settings => ref.watch(settingsProvider);

  AppSettingsState get appSettings => ref.watch(appSettingsProvider);

  String _safeFormatTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return 'timeUnavailable'.tr;
    // Rebuild when settings are persisted so formatted labels stay in sync.
    ref.watch(settingsRevisionProvider);
    return TimeIndexHelper.formatTime(
      timeStr,
      ref.watch(settingsProvider),
      ref.watch(localeProvider).languageCode,
    );
  }

  String _notificationWeekdaysLabel() => formatNotificationWeekdaysSummary(
    mask: settings.notificationWeekdaysMask,
    languageCode: ref.watch(localeProvider).languageCode,
  );

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'functions',
      icon: IconsaxPlusBold.code_1,
      children: [
        SettingsSwitchTile(
          leading: const Icon(IconsaxPlusLinear.map),
          title: 'location',
          value: settings.location,
          onChanged: (value) => _onLocationChanged(value, context),
        ),
        SettingsSwitchTile(
          leading: const Icon(IconsaxPlusLinear.notification_1),
          title: 'notifications',
          value: settings.notifications,
          onChanged: _onNotificationsChanged,
        ),
        if (Platform.isAndroid)
          SettingsSwitchTile(
            leading: const Icon(IconsaxPlusLinear.notification_bing),
            title: 'persistentNotification',
            value: settings.persistentNotification,
            onChanged: _onPersistentNotificationChanged,
          ),
        if (settings.notifications) ...[
          SettingsSwitchTile(
            leading: const Icon(IconsaxPlusLinear.volume_high),
            title: 'notificationSound',
            value: settings.notificationSound,
            onChanged: (value) async {
              settings.notificationSound = value;
              await actions.saveWithForecastReschedule();
            },
          ),
          SettingsTile(
            leading: const Icon(IconsaxPlusLinear.notification_status),
            title: 'timeRange',
            value: '${appSettings.timeRange}',
            onTap: () => _showTimeRangeDialog(context),
          ),
          SettingsTile(
            leading: const Icon(IconsaxPlusLinear.timer_start),
            title: 'timeStart',
            value: _safeFormatTime(
              settings.timeStart ?? AppConstants.defaultNotificationTimeStart,
            ),
            onTap: () => _showTimeStartPicker(context),
          ),
          SettingsTile(
            leading: const Icon(IconsaxPlusLinear.timer_pause),
            title: 'timeEnd',
            value: _safeFormatTime(
              settings.timeEnd ?? AppConstants.defaultNotificationTimeEnd,
            ),
            onTap: () => _showTimeEndPicker(context),
          ),
          SettingsTile(
            leading: const Icon(IconsaxPlusLinear.calendar_1),
            title: 'notificationWeekdays',
            subtitleText: _notificationWeekdaysLabel(),
            onTap: () => _showNotificationWeekdaysDialog(context),
          ),
        ],
      ],
    );
  }

  void _showTimeRangeDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'timeRange'.tr,
      icon: IconsaxPlusLinear.notification_status,
      items: [
        for (
          var i = AppConstants.minNotificationIntervalHours;
          i <= AppConstants.maxNotificationIntervalHours;
          i++
        )
          '$i',
      ],
      currentValue: '${appSettings.timeRange}',
      itemBuilder: (value) => value,
      onSelected: (value) async {
        settings.timeRange = int.parse(value);
        await actions.saveWithForecastReschedule();
      },
    );
  }

  Future<void> _showNotificationWeekdaysDialog(BuildContext context) async {
    final result = await showNotificationWeekdaysDialog(
      context: context,
      currentMask: settings.notificationWeekdaysMask,
      languageCode: ref.read(localeProvider).languageCode,
    );
    if (result == null || !mounted) return;

    settings.notificationWeekdaysMask = result.mask;
    await actions.saveWithForecastReschedule();
  }

  Future<void> _onLocationChanged(bool value, BuildContext context) async {
    final saved = await actions.saveLocationToggle(
      enabled: value,
      refreshGps: () => ref
          .read(mainWeatherNotifierProvider.notifier)
          .getCurrentLocation(forceLoading: true),
    );
    if (!saved && value) {
      if (!context.mounted) return;
      await showConfirmationDialog(
        context: context,
        title: 'location',
        message: 'no_location',
        icon: IconsaxPlusBold.location,
        confirmText: 'settings',
        onConfirm: () =>
            ref.read(locationServiceProvider).openLocationSettings(),
      );
    }
  }

  Future<void> _onNotificationsChanged(bool value) async {
    await actions.saveNotificationsToggle(
      enabled: value,
      requestPermissions: requestForecastNotificationPermissions,
    );
  }

  Future<void> _onPersistentNotificationChanged(bool value) async {
    await actions.savePersistentNotificationToggle(
      enabled: value,
      requestPermission: requestAndroidNotificationPermission,
    );
  }

  Future<void> _pickNotificationWindowTime({
    required BuildContext context,
    required String? stored,
    required String defaultTime,
    required void Function(String value) apply,
  }) async {
    final picked = await showAppTimePicker(
      context: context,
      ref: ref,
      initialTime: TimeIndexHelper.parseTime(stored ?? defaultTime),
    );
    if (picked == null) return;

    apply(TimeIndexHelper.timeTo24h(picked));
    await actions.saveWithForecastReschedule();
  }

  Future<void> _showTimeStartPicker(BuildContext context) async {
    await _pickNotificationWindowTime(
      context: context,
      stored: settings.timeStart,
      defaultTime: AppConstants.defaultNotificationTimeStart,
      apply: (value) => settings.timeStart = value,
    );
  }

  Future<void> _showTimeEndPicker(BuildContext context) async {
    await _pickNotificationWindowTime(
      context: context,
      stored: settings.timeEnd,
      defaultTime: AppConstants.defaultNotificationTimeEnd,
      apply: (value) => settings.timeEnd = value,
    );
  }
}
