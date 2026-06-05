import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';

final widgetSettingsServiceProvider = Provider<WidgetSettingsService>(
  (ref) => WidgetSettingsService(ref),
);

class WidgetSettingsService {
  WidgetSettingsService(this._ref);

  final Ref _ref;

  Future<bool> _saveAndRefresh(Future<void> Function() save) async {
    await save();
    return _ref
        .read(homeWidgetServiceProvider)
        .updateFromIsar(_ref.read(isarProvider));
  }

  Future<bool> updateBackgroundColor(String color) async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetBackgroundColor = color;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }

  Future<bool> resetBackgroundColor() async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetBackgroundColor = null;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }

  Future<bool> updateTextColor(String color) async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetTextColor = color;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }

  Future<bool> resetTextColor() async {
    return _saveAndRefresh(() async {
      final settings = _ref.read(settingsProvider);
      settings.widgetTextColor = null;
      await _ref.read(settingsRepositoryProvider).save(settings);
    });
  }
}
