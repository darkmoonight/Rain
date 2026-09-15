/// Thrown when work is skipped because [AsyncQueue.cancel] was called.
class AsyncQueueCancelled implements Exception {
  /// Creates a cancellation signal for skipped queue work.
  const AsyncQueueCancelled();

  @override
  String toString() => 'AsyncQueueCancelled';
}

/// Serializes async work so only one [enqueue] action runs at a time.
class AsyncQueue {
  Future<void> _tail = Future<void>.value();
  bool _cancelled = false;

  /// Whether [cancel] has been called; later [enqueue] actions are skipped.
  bool get isCancelled => _cancelled;

  /// Marks the queue cancelled so later [enqueue] actions are skipped.
  ///
  /// In-flight work should still check [isCancelled] or `ref.mounted` after awaits.
  void cancel() {
    _cancelled = true;
  }

  /// Queues [action] after all prior enqueued work completes.
  ///
  /// Completes with [AsyncQueueCancelled] when the queue was cancelled.
  Future<T> enqueue<T>(Future<T> Function() action) {
    if (_cancelled) {
      return Future<T>.error(const AsyncQueueCancelled(), StackTrace.current);
    }
    final run = _tail.then((_) {
      if (_cancelled) {
        return Future<T>.error(const AsyncQueueCancelled(), StackTrace.current);
      }
      return action();
    });
    _tail = run.then((_) {}, onError: (_) {});
    return run;
  }
}
