import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/app_time_picker.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  testWidgets('showAppTimePicker opens time picker dialog', (tester) async {
    await pumpRainWidget(
      tester,
      Consumer(
        builder: (context, ref, _) => ElevatedButton(
          onPressed: () => showAppTimePicker(
            context: context,
            ref: ref,
            initialTime: const TimeOfDay(hour: 9, minute: 30),
          ),
          child: const Text('Pick'),
        ),
      ),
      bootstrap: ctx.bootstrap,
    );

    await tester.tap(find.text('Pick'));
    await tester.pumpAndSettle();

    expect(find.byType(TimePickerDialog), findsOneWidget);
  });

  testWidgets('uses 24-hour format when settings prefer it', (tester) async {
    ctx.bootstrap.settings.timeformat = '24';

    await pumpRainWidget(
      tester,
      Consumer(
        builder: (context, ref, _) => ElevatedButton(
          onPressed: () => showAppTimePicker(
            context: context,
            ref: ref,
            initialTime: const TimeOfDay(hour: 14, minute: 0),
          ),
          child: const Text('Pick'),
        ),
      ),
      bootstrap: ctx.bootstrap,
    );

    await tester.tap(find.text('Pick'));
    await tester.pumpAndSettle();

    final mediaQuery = tester.widget<MediaQuery>(
      find
          .descendant(
            of: find.byType(TimePickerDialog),
            matching: find.byType(MediaQuery),
          )
          .first,
    );
    expect(mediaQuery.data.alwaysUse24HourFormat, isTrue);
  });
}
