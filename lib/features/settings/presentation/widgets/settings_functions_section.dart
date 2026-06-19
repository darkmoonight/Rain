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
import 'package:rain/features/settings/presentation/widgets/settings_save_actions.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
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
    extends ConsumerState<SettingsFunctionsSection> {
  late final SettingsSaveActions _actions;

  Settings get settings => ref.watch(settingsProvider);

  AppSettingsState get appSettings => ref.watch(appSettingsProvider);

  @override
  void initState() {
    super.initState();
    _actions = SettingsSaveActions(ref, setState);
  }

  String _safeFormatTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return 'timeUnavailable'.tr;
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
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.map),
          title: 'location',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.location,
              onChanged: (value) => _onLocationChanged(value, context),
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.notification_1),
          title: 'notifications',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.notifications,
              onChanged: _onNotificationsChanged,
            ),
          ),
        ),
        if (Platform.isAndroid)
          SettingsTile(
            leading: const Icon(IconsaxPlusLinear.notification_bing),
            title: 'persistentNotification',
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: settings.persistentNotification,
                onChanged: _onPersistentNotificationChanged,
              ),
            ),
          ),
        if (settings.notifications) ...[
          SettingsTile(
            leading: const Icon(IconsaxPlusLinear.volume_high),
            title: 'notificationSound',
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: settings.notificationSound,
                onChanged: _onNotificationSoundChanged,
              ),
            ),
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
      items: const ['1', '2', '3', '4', '5'],
      currentValue: '${appSettings.timeRange}',
      itemBuilder: (value) => value,
      onSelected: (value) async {
        settings.timeRange = int.parse(value);
        await _actions.saveWithForecastReschedule();
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

    settings.notificationWeekdaysMask = result;
    await _actions.saveWithForecastReschedule();
  }

  Future<void> _onLocationChanged(bool value, BuildContext context) async {
    if (value) {
      final serviceEnabled = await ref
          .read(locationServiceProvider)
          .isServiceEnabled();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        await showConfirmationDialog(
          context: context,
          title: 'location'.tr,
          message: 'no_location'.tr,
          icon: IconsaxPlusBold.location,
          confirmText: 'settings'.tr,
          onConfirm: () =>
              ref.read(locationServiceProvider).openLocationSettings(),
        );
        return;
      }
    }
    settings.location = value;
    await ref.read(settingsRepositoryProvider).save(settings);
    if (value) {
      await ref
          .read(mainWeatherNotifierProvider.notifier)
          .getCurrentLocation(forceLoading: true);
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _onNotificationsChanged(bool value) async {
    if (value && !await requestForecastNotificationPermissions()) return;

    settings.notifications = value;
    await ref.read(settingsRepositoryProvider).save(settings);
    if (!mounted) return;
    setState(() {});

    _actions.runInBackground(
      value
          ? _actions.weather.rescheduleNotificationsIfEnabled
          : ref.read(notificationServiceProvider).cancelForecastNotifications,
    );
  }

  Future<void> _onNotificationSoundChanged(bool value) async {
    settings.notificationSound = value;
    await _actions.saveWithForecastReschedule();
  }

  Future<void> _onPersistentNotificationChanged(bool value) async {
    if (value && !await requestAndroidNotificationPermission()) return;

    settings.persistentNotification = value;
    await ref.read(settingsRepositoryProvider).save(settings);
    if (value) {
      unawaited(
        ref
            .read(mainWeatherNotifierProvider.notifier)
            .refreshPersistentNotification(force: true),
      );
    } else {
      unawaited(
        ref.read(notificationServiceProvider).cancelPersistentNotification(),
      );
    }
    if (!mounted) return;
    setState(() {});
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
    await _actions.saveWithForecastReschedule();
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
