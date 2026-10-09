import 'dart:collection';

List<int> minInterval(List<List<int>> intervals, List<int> queries) {
  // Sweep the queries from smallest to largest. Intervals join an ordered set once
  // their left end is reached; the set is ordered by size (a heap-like priority queue).
  final byLeft = [...intervals]..sort((a, b) => a[0].compareTo(b[0]));
  final order = List<int>.generate(queries.length, (i) => i)
    ..sort((a, b) => queries[a].compareTo(queries[b]));
  final answer = List<int>.filled(queries.length, -1);
  // Entries are [size, right, id]; id keeps equal-size entries distinct.
  final active = SplayTreeSet<List<int>>((a, b) {
    final bySize = a[0].compareTo(b[0]);
    if (bySize != 0) return bySize;
    final byRight = a[1].compareTo(b[1]);
    return byRight != 0 ? byRight : a[2].compareTo(b[2]);
  });
  var next = 0;

  for (final qi in order) {
    final q = queries[qi];
    while (next < byLeft.length && byLeft[next][0] <= q) {
      final left = byLeft[next][0];
      final right = byLeft[next][1];
      active.add([right - left + 1, right, next]);
      next++;
    }
    // Queries only grow, so intervals that ended before q can never help again.
    while (active.isNotEmpty && active.first[1] < q) {
      active.remove(active.first);
    }
    if (active.isNotEmpty) answer[qi] = active.first[0];
  }
  return answer;
}
