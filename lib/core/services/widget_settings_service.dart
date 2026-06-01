import 'package:home_widget/home_widget.dart';
import 'package:rain/core/config/app_config.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final widgetSettingsServiceProvider = Provider<WidgetSettingsService>(
  (ref) => WidgetSettingsService(ref),
);

class WidgetSettingsService {
  WidgetSettingsService(this._ref);

  final Ref _ref;

  Future<bool> updateBackgroundColor(String color) async {
    final settings = _ref.read(settingsProvider);
    settings.widgetBackgroundColor = color;
    await _ref.read(settingsRepositoryProvider).save(settings);
    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData('background_color', color),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }

  Future<bool> resetBackgroundColor() async {
    final settings = _ref.read(settingsProvider);
    settings.widgetBackgroundColor = null;
    await _ref.read(settingsRepositoryProvider).save(settings);
    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData<String>('background_color', null),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }

  Future<bool> updateTextColor(String color) async {
    final settings = _ref.read(settingsProvider);
    settings.widgetTextColor = color;
    await _ref.read(settingsRepositoryProvider).save(settings);
    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData('text_color', color),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }

  Future<bool> resetTextColor() async {
    final settings = _ref.read(settingsProvider);
    settings.widgetTextColor = null;
    await _ref.read(settingsRepositoryProvider).save(settings);
    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData<String>('text_color', null),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }
}
