import 'package:flutter/material.dart';

/// Breakpoint helpers and responsive sizing for adaptive layouts.
class ResponsiveUtils {
  // Breakpoints

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  /// Whether the current width is below the mobile breakpoint.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  /// Whether the current width falls within the tablet range.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  /// Whether the current width is at or above the desktop layout threshold (1024px).
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  /// Returns screen-edge padding scaled to the current form factor.
  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return 10;
    if (isTablet(context)) return 16;
    return 24;
  }

  /// Returns card margin scaled to the current form factor.
  static double getResponsiveCardMargin(BuildContext context) {
    if (isMobile(context)) return 10;
    if (isTablet(context)) return 12;
    return 16;
  }

  /// Scales [baseFontSize] up on larger screens.
  static double getResponsiveFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    if (isMobile(context)) return baseFontSize;
    if (isTablet(context)) return baseFontSize * 1.1;
    return baseFontSize * 1.2;
  }

  /// Returns a grid column count suited to the current width.
  static int getGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }

  /// Caps content width on desktop; otherwise returns unbounded width.
  static double getMaxContentWidth(BuildContext context) {
    if (isDesktop(context)) return 1200;
    return double.infinity;
  }

  /// Returns uniform edge insets based on responsive padding.
  static EdgeInsets getResponsiveEdgeInsets(BuildContext context) {
    final padding = getResponsivePadding(context);
    return EdgeInsets.all(padding);
  }

  /// Returns the circular slider diameter for the current form factor.
  static double getCircularSliderSize(BuildContext context) {
    if (isMobile(context)) return 70;
    if (isTablet(context)) return 90;
    return 110;
  }

  /// Returns a smaller circular control diameter for compact layouts.
  static double getTaskCardCircularSliderSize(BuildContext context) {
    if (isMobile(context)) return 60;
    if (isTablet(context)) return 70;
    return 80;
  }
}

/// Picks among mobile, tablet, and desktop child widgets by width.
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  /// Builds the layout variant matching the current screen width.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ResponsiveUtils.tabletBreakpoint) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= ResponsiveUtils.mobileBreakpoint) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

/// Centers [child] and constrains width on desktop screens.
class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({super.key, required this.child});

  final Widget child;

  /// Builds [child] centered and width-constrained on desktop screens.
  @override
  Widget build(BuildContext context) {
    final maxWidth = ResponsiveUtils.getMaxContentWidth(context);

    if (maxWidth == double.infinity) {
      return child;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
