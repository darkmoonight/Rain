import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/location_label.dart';

void main() {
  test('formatLocationLabel handles common combinations', () {
    expect(formatLocationLabel('Moscow', ''), 'Moscow');
    expect(formatLocationLabel('', 'District'), 'District');
    expect(formatLocationLabel('Paris', 'Paris'), 'Paris');
    expect(formatLocationLabel('London', 'England'), 'London, England');
    expect(formatLocationLabel(null, null), '');
  });
}
