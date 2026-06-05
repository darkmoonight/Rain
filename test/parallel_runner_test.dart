import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/parallel_runner.dart';

void main() {
  test('mapLimited runs all items and preserves order', () async {
    final results = await ParallelRunner.mapLimited(
      items: [1, 2, 3, 4, 5],
      concurrency: 2,
      run: (item) async => item.isEven,
    );

    expect(results, [false, true, false, true, false]);
  });

  test('mapLimited returns empty list for empty input', () async {
    final results = await ParallelRunner.mapLimited(
      items: const <int>[],
      concurrency: 3,
      run: (_) async => true,
    );

    expect(results, isEmpty);
  });
}
