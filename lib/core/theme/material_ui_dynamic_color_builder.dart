import 'package:dynamic_system_colors/dynamic_system_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

/// Loads system dynamic colors as `material_ui` [ColorScheme]s via seed colors.
///
/// Uses [DynamicColorPlugin.getCorePalette] / [DynamicColorPlugin.getAccentColor]
/// and [ColorScheme.fromSeed] so the app never converts Flutter SDK schemes on
/// the theme hot path. Prefer this over `dynamic_system_colors`'s
/// [DynamicColorBuilder], which returns `package:flutter/material.dart`
/// schemes.
class MaterialUiDynamicColorBuilder extends StatefulWidget {
  /// Creates a builder that supplies optional light/dark dynamic schemes.
  const MaterialUiDynamicColorBuilder({super.key, required this.builder});

  /// Builds UI from optional dynamic light and dark color schemes.
  final Widget Function(ColorScheme? lightDynamic, ColorScheme? darkDynamic)
  builder;

  @override
  State<MaterialUiDynamicColorBuilder> createState() =>
      _MaterialUiDynamicColorBuilderState();
}

class _MaterialUiDynamicColorBuilderState
    extends State<MaterialUiDynamicColorBuilder> {
  ColorScheme? _light;
  ColorScheme? _dark;

  @override
  void initState() {
    super.initState();
    _loadDynamicSchemes();
  }

  Future<void> _loadDynamicSchemes() async {
    try {
      final corePalette = await DynamicColorPlugin.getCorePalette();
      if (!mounted) return;
      if (corePalette != null) {
        final seed = Color(corePalette.primary.get(40));
        if (kDebugMode) {
          debugPrint('dynamic_color: Core palette seed applied.');
        }
        setState(() {
          _light = ColorScheme.fromSeed(
            seedColor: seed,
            brightness: Brightness.light,
          );
          _dark = ColorScheme.fromSeed(
            seedColor: seed,
            brightness: Brightness.dark,
          );
        });
        return;
      }
    } on PlatformException {
      if (kDebugMode) {
        debugPrint('dynamic_color: Failed to obtain core palette.');
      }
    }

    try {
      final Color? accentColor = await DynamicColorPlugin.getAccentColor();
      if (!mounted) return;
      if (accentColor != null) {
        if (kDebugMode) {
          debugPrint('dynamic_color: Accent color seed applied.');
        }
        setState(() {
          _light = ColorScheme.fromSeed(
            seedColor: accentColor,
            brightness: Brightness.light,
          );
          _dark = ColorScheme.fromSeed(
            seedColor: accentColor,
            brightness: Brightness.dark,
          );
        });
        return;
      }
    } on PlatformException {
      if (kDebugMode) {
        debugPrint('dynamic_color: Failed to obtain accent color.');
      }
    }

    if (kDebugMode) {
      debugPrint('dynamic_color: Dynamic color not detected on this device.');
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(_light, _dark);
}
