import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return 10;
    if (isTablet(context)) return 16;
    return 24;
  }

  static double getResponsiveCardMargin(BuildContext context) {
    if (isMobile(context)) return 10;
    if (isTablet(context)) return 12;
    return 16;
  }

  static double getResponsiveFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    if (isMobile(context)) return baseFontSize;
    if (isTablet(context)) return baseFontSize * 1.1;
    return baseFontSize * 1.2;
  }

  static int getGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }

  static double getMaxContentWidth(BuildContext context) {
    if (isDesktop(context)) return 1200;
    return double.infinity;
  }

  static EdgeInsets getResponsiveEdgeInsets(BuildContext context) {
    final padding = getResponsivePadding(context);
    return EdgeInsets.all(padding);
  }

  static double getCircularSliderSize(BuildContext context) {
    if (isMobile(context)) return 70;
    if (isTablet(context)) return 90;
    return 110;
  }

  static double getTaskCardCircularSliderSize(BuildContext context) {
    if (isMobile(context)) return 60;
    if (isTablet(context)) return 70;
    return 80;
  }
}

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

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({super.key, required this.child});

  final Widget child;

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
