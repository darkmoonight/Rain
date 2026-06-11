/// Shared layout, timing, cache, and map constants for the app.
class AppConstants {
  // Animation
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortAnimation = Duration(milliseconds: 150);
  static const Duration longAnimation = Duration(milliseconds: 250);
  static const Duration scrollToCurrentHourDelay = Duration(milliseconds: 30);
  static const Duration scrollToRetryDelay = Duration(milliseconds: 100);
  static const int maxScrollRetries = 10;

  // Size
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 20.0;
  static const double borderRadiusXXLarge = 24.0;
  static const double mapBorderRadius = 20.0;
  static const double mapHeight = 0.3;
  static const double mapInitialCenterLat = 55.7522;
  static const double mapInitialCenterLon = 37.6156;
  static const double mapInitialZoom = 3.0;
  static const double mapSearchZoom = 14.0;
  static const double mapDefaultZoom = 8.0;

  // Elevation
  static const double elevationLow = 1.0;
  static const double elevationMedium = 6.0;
  static const double elevationHigh = 8.0;
  static const double cardElevation = 4.0;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 12.0;
  static const double spacingL = 16.0;
  static const double spacingXL = 20.0;
  static const double spacingXXL = 24.0;

  // Icon sizes
  static const double iconSizeSmall = 18.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeLarge = 24.0;
  static const double iconSizeXLarge = 32.0;

  /// [Image.asset] scale for icons in the 12-day [DailyCard] list.
  static const double dailyExtendedListIconScale = 6.5;

  /// [Image.asset] scale for icons in the home-screen daily preview rows.
  static const double dailyPreviewIconScale = 3.0;

  // Constraints
  static const double maxDialogWidth = 400.0;
  static const double maxDesktopWidth = 1200.0;
  static const double maxModalWidth = 500.0;

  // Opacity
  static const double opacityLight = 0.3;
  static const double opacityMedium = 0.5;
  static const double opacityHeavy = 0.8;

  // Border width
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 1.5;
  static const double borderWidthThick = 2.0;

  // Debounce
  static const debounceDelay = Duration(milliseconds: 150);

  // Cache
  static const Duration cacheExpiry = Duration(hours: 12);

  /// Incremented when forecast cache schema changes; triggers a re-save migration.
  static const int weatherCacheSchemaVersion = 3;

  /// Cutoff before which persisted forecast rows are treated as stale.
  static DateTime weatherCacheExpiryThreshold() =>
      DateTime.now().subtract(cacheExpiry);
  static const Duration mapTileCacheDays = Duration(days: 30);

  // Widget
  static const double buttonHeight = 52.0;
  static const double buttonHeightSmall = 48.0;
  static const double hourlyWidgetHeight = 135.0;
  static const double hourlySeparatorIndent = 40.0;
  static const double dailyCardMarginVertical = 12.0;
  static const double hourlyItemMarginVertical = 5.0;
  static const double hourlyItemPaddingHorizontal = 20.0;
  static const double hourlyItemPaddingVertical = 5.0;
  static const double cardBottomMargin = 15.0;
  static const double cardPaddingHorizontal = 10.0;
  static const double cardPaddingVertical = 5.0;

  /// Desc grid cell width inside [DescContainer].
  static const double descGridItemWidth = 100.0;

  /// Desc grid spacing inside [DescContainer].
  static const double descGridSpacing = 8.0;

  /// Desc grid row height inside [DescContainer].
  static const double descGridRowHeight = 90.0;

  // Text
  static const double fontSizeSmall = 14.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeXLarge = 20.0;

  // Time
  static const Duration scrollDuration = Duration(seconds: 2);
  static const Duration workManagerMinInterval = Duration(minutes: 15);

  // Latitude/Longitude
  static const double minLatitude = -90.0;
  static const double maxLatitude = 90.0;
  static const double minLongitude = -180.0;
  static const double maxLongitude = 180.0;

  // Settings defaults
  static const int defaultNotificationIntervalHours = 1;
  static const String defaultNotificationTimeStart = '08:00';
  static const String defaultNotificationTimeEnd = '20:00';

  // Maps
  static const String mapTileUrlTemplate =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const String openStreetMapCopyrightUrl =
      'https://openstreetmap.org/copyright';
  static const String mapUserAgentPackageName = 'com.yoshi.rain';

  // Map styling
  static const double mapTextFieldElevation = 4.0;
  static const List<double> mapDarkColorFilterMatrix = <double>[
    -0.2,
    -0.7,
    -0.08,
    0,
    255,
    -0.2,
    -0.7,
    -0.08,
    0,
    255,
    -0.2,
    -0.7,
    -0.08,
    0,
    255,
    0,
    0,
    0,
    1,
    0,
  ];
}
