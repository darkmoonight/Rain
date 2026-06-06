import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';

final widgetSettingsServiceProvider = Provider<WidgetSettingsService>(
  (ref) => WidgetSettingsService(ref),
);

/// Persists home-widget appearance settings and refreshes widget data.
class WidgetSettingsService {
  WidgetSettingsService(this._ref);

  final Ref _ref;

  /// Persists settings via [save], then pushes updates to home widgets.
  Future<bool> _saveAndRefresh(Future<void> Function() save) async {
    await save();
    return _ref
        .read(homeWidgetServiceProvider)
        .updateFromIsar(_ref.read(isarProvider));
  }

  /// Saves a custom widget background color and updates widgets.
  Future<bool> updateBackgroundColor(String color) async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetBackgroundColor = color;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }

  /// Clears the custom widget background color and updates widgets.
  Future<bool> resetBackgroundColor() async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetBackgroundColor = null;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }

  /// Saves a custom widget text color and updates widgets.
  Future<bool> updateTextColor(String color) async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetTextColor = color;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }

  /// Clears the custom widget text color and updates widgets.
  Future<bool> resetTextColor() async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetTextColor = null;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }
}
