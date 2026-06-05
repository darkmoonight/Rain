import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/async_queue.dart';

void main() {
  test('enqueue runs tasks sequentially', () async {
    final queue = AsyncQueue();
    final order = <int>[];

    await Future.wait([
      queue.enqueue(() async {
        await Future<void>.delayed(const Duration(milliseconds: 20));
        order.add(1);
      }),
      queue.enqueue(() async => order.add(2)),
      queue.enqueue(() async => order.add(3)),
    ]);

    expect(order, [1, 2, 3]);
  });
}
