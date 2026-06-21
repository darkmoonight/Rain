import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/notification_weekdays.dart';
import 'package:rain/features/settings/presentation/widgets/notification_weekdays_dialog.dart';
import 'package:rain/i18n/tr.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  tearDown(() async {
    await ctx.dispose();
  });

  testWidgets('notification weekdays dialog saves selected mask', (
    tester,
  ) async {
    NotificationWeekdaysDialogResult? result;

    await pumpRainWidget(
      tester,
      Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () async {
              result = await showNotificationWeekdaysDialog(
                context: context,
                currentMask: null,
                languageCode: 'en',
              );
            },
            child: const Text('open'),
          );
        },
      ),
      bootstrap: ctx.bootstrap,
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('notificationWeekdays'.tr), findsOneWidget);

    final firstWeekday = notificationIsoWeekdays.first;
    final label = notificationWeekdayLabel(firstWeekday, 'en');
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();

    await tester.tap(find.text('save'.tr));
    await tester.pumpAndSettle();

    expect(result, isNotNull);
    expect(result!.mask, isNotNull);
  });
}
