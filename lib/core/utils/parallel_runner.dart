class ParallelRunner {
  const ParallelRunner._();

  static Future<List<bool>> mapLimited<T>({
    required List<T> items,
    required Future<bool> Function(T item) run,
    int concurrency = 3,
  }) async {
    if (items.isEmpty) return const [];

    final results = List<bool>.filled(items.length, true);
    for (var start = 0; start < items.length; start += concurrency) {
      final end = start + concurrency > items.length
          ? items.length
          : start + concurrency;
      final batch = items.sublist(start, end);
      final batchResults = await Future.wait(batch.map(run));
      for (var i = 0; i < batchResults.length; i++) {
        results[start + i] = batchResults[i];
      }
    }
    return results;
  }
}
