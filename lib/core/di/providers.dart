/// Barrel export for core Riverpod providers and notifiers.
///
/// Import this from screens and notifiers. Leaf widgets that only need a single
/// provider should import [provider_refs.dart] directly to avoid pulling in
/// notifier exports.
library;

export 'package:rain/core/di/provider_refs.dart';
export 'package:rain/core/services/widget_settings_service.dart'
    show WidgetSettingsService;
export 'package:rain/core/settings/app_settings_notifier.dart';
export 'package:rain/core/theme/theme_mode_notifier.dart';
export 'package:rain/features/cities/application/cities_notifier.dart';
export 'package:rain/features/weather/application/main_weather_notifier.dart';
