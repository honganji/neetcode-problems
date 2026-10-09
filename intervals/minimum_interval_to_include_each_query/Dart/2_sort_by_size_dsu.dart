int _lowerBound(List<int> sorted, int x) {
  var lo = 0, hi = sorted.length;
  while (lo < hi) {
    final mid = (lo + hi) ~/ 2;
    if (sorted[mid] < x) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }
  return lo;
}

List<int> minInterval(List<List<int>> intervals, List<int> queries) {
  // Handle the smallest intervals first. Each query is answered by the first
  // interval that covers it, and a "next unanswered" pointer skips finished queries.
  final sortedQueries = queries.toSet().toList()..sort();
  final m = sortedQueries.length;
  final parent = List<int>.generate(m + 1, (i) => i); // parent[m] is a sentinel

  int find(int x) {
    var v = x;
    while (parent[v] != v) {
      parent[v] = parent[parent[v]]; // path halving
      v = parent[v];
    }
    return v;
  }

  final best = <int, int>{};
  final byShortest = [...intervals]
    ..sort((a, b) => (a[1] - a[0]).compareTo(b[1] - b[0]));
  for (final iv in byShortest) {
    final left = iv[0];
    final right = iv[1];
    final size = right - left + 1;
    var j = find(_lowerBound(sortedQueries, left));
    while (j < m && sortedQueries[j] <= right) {
      best[sortedQueries[j]] = size;
      parent[j] = j + 1; // mark answered; skip it from now on
      j = find(j + 1);
    }
  }
  return [for (final q in queries) best[q] ?? -1];
}
