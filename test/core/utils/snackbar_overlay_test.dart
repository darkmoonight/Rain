import '../../helpers/test_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/snackbar_overlay.dart';

void main() {
  setUpAll(initTestEnvironment);

  tearDown(() {
    SnackBarOverlay.instance.hide();
  });

  group('SnackBarOverlay', () {
    test('show updates notifier value', () {
      SnackBarOverlay.instance.show('Saved', isInfo: true);

      final data = SnackBarOverlay.instance.snackBarNotifier.value;
      expect(data, isNotNull);
      expect(data!.message, 'Saved');
      expect(data.isInfo, isTrue);
    });

    test('hide clears notifier value', () {
      SnackBarOverlay.instance.show('Error', isError: true);
      SnackBarOverlay.instance.hide();

      expect(SnackBarOverlay.instance.snackBarNotifier.value, isNull);
    });
  });

  group('SnackBarOverlayWidget', () {
    testWidgets('renders toast message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Stack(children: [SnackBarOverlayWidget()])),
        ),
      );

      SnackBarOverlay.instance.show('Hello toast');
      await tester.pump();

      expect(find.text('Hello toast'), findsOneWidget);

      await tester.pump(const Duration(seconds: 3));
    });
  });
}
