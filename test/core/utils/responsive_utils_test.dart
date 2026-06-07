import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/responsive_utils.dart';

void main() {
  Future<void> setViewport(WidgetTester tester, double width) async {
    tester.view.physicalSize = Size(width, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  group('ResponsiveUtils breakpoints', () {
    testWidgets('detects mobile, tablet, and desktop widths', (tester) async {
      await setViewport(tester, 400);
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          expect(ResponsiveUtils.isMobile(context), isTrue);
          expect(ResponsiveUtils.isTablet(context), isFalse);
          expect(ResponsiveUtils.isDesktop(context), isFalse);
          return const SizedBox();
        }),
      ));

      await setViewport(tester, 800);
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          expect(ResponsiveUtils.isTablet(context), isTrue);
          return const SizedBox();
        }),
      ));

      await setViewport(tester, 1200);
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          expect(ResponsiveUtils.isDesktop(context), isTrue);
          expect(ResponsiveUtils.getMaxContentWidth(context), 1200);
          return const SizedBox();
        }),
      ));
    });
  });

  group('ResponsiveUtils sizing', () {
    testWidgets('scales padding and grid columns by width', (tester) async {
      await setViewport(tester, 400);
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          expect(ResponsiveUtils.getResponsivePadding(context), 10);
          expect(ResponsiveUtils.getGridCrossAxisCount(context), 1);
          return const SizedBox();
        }),
      ));

      await setViewport(tester, 800);
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          expect(ResponsiveUtils.getResponsivePadding(context), 16);
          expect(ResponsiveUtils.getGridCrossAxisCount(context), 2);
          return const SizedBox();
        }),
      ));

      await setViewport(tester, 1200);
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          expect(ResponsiveUtils.getResponsivePadding(context), 24);
          expect(ResponsiveUtils.getGridCrossAxisCount(context), 3);
          return const SizedBox();
        }),
      ));
    });
  });

  group('ResponsiveLayout', () {
    testWidgets('selects child by width', (tester) async {
      await setViewport(tester, 400);
      await tester.pumpWidget(const MaterialApp(
        home: ResponsiveLayout(
          mobile: Text('mobile'),
          tablet: Text('tablet'),
          desktop: Text('desktop'),
        ),
      ));
      expect(find.text('mobile'), findsOneWidget);

      await setViewport(tester, 800);
      await tester.pumpWidget(const MaterialApp(
        home: ResponsiveLayout(
          mobile: Text('mobile'),
          tablet: Text('tablet'),
          desktop: Text('desktop'),
        ),
      ));
      expect(find.text('tablet'), findsOneWidget);

      await setViewport(tester, 1200);
      await tester.pumpWidget(const MaterialApp(
        home: ResponsiveLayout(
          mobile: Text('mobile'),
          tablet: Text('tablet'),
          desktop: Text('desktop'),
        ),
      ));
      expect(find.text('desktop'), findsOneWidget);
    });
  });

  group('ResponsiveCenter', () {
    testWidgets('centers child on desktop widths', (tester) async {
      await setViewport(tester, 1200);
      await tester.pumpWidget(const MaterialApp(
        home: ResponsiveCenter(child: SizedBox(width: 100, height: 50)),
      ));
      expect(find.byType(ResponsiveCenter), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });
  });
}
