/// Serializes async work so only one [enqueue] action runs at a time.
class AsyncQueue {
  Future<void> _tail = Future<void>.value();

  /// Queues [action] after all prior enqueued work completes.
  Future<T> enqueue<T>(Future<T> Function() action) {
    final run = _tail.then((_) => action());
    _tail = run.then((_) {}, onError: (_) {});
    return run;
  }
}
