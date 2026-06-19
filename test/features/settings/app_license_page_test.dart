import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/settings/application/package_licenses.dart';

void main() {
  test('licenseParagraphsText extracts paragraph text', () {
    const paragraphs = [
      LicenseParagraph('Apache License 2.0', 0),
      LicenseParagraph('Permission is hereby granted.', 0),
    ];

    expect(
      licenseParagraphsText(paragraphs),
      'Apache License 2.0\n\nPermission is hereby granted.',
    );
  });
}
