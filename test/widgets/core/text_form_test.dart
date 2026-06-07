import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/widgets/text_form.dart';

void main() {
  testWidgets('MyTextForm shows label and accepts input', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    var changed = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyTextForm(
            labelText: 'City',
            type: TextInputType.text,
            icon: const Icon(Icons.search),
            controller: controller,
            margin: EdgeInsets.zero,
            onChanged: (value) => changed = value,
          ),
        ),
      ),
    );

    expect(find.text('City'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Moscow');
    expect(changed, 'Moscow');
  });

  testWidgets('MyTextForm validator shows error', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: MyTextForm(
              labelText: 'Required',
              type: TextInputType.text,
              icon: const Icon(Icons.edit),
              controller: controller,
              margin: EdgeInsets.zero,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Required field' : null,
            ),
          ),
        ),
      ),
    );

    expect(formKey.currentState!.validate(), isFalse);
    await tester.pump();
    expect(find.text('Required field'), findsOneWidget);
  });
}
