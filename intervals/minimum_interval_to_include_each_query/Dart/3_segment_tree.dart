import 'dart:math';

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

int _upperBound(List<int> sorted, int x) {
  var lo = 0, hi = sorted.length;
  while (lo < hi) {
    final mid = (lo + hi) ~/ 2;
    if (sorted[mid] <= x) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }
  return lo;
}

List<int> minInterval(List<List<int>> intervals, List<int> queries) {
  // Each interval "paints" the compressed query positions it covers with its size,
  // keeping the minimum. Painting is a range update; reading a query is a point read.
  final sortedQueries = queries.toSet().toList()..sort();
  final m = sortedQueries.length;
  const inf = 1 << 30;
  final tree = List<int>.filled(2 * m, inf); // bottom-up tree; leaves at m..2m-1

  for (final iv in intervals) {
    final size = iv[1] - iv[0] + 1;
    var lo = _lowerBound(sortedQueries, iv[0]) + m;
    var hi = _upperBound(sortedQueries, iv[1]) + m; // exclusive
    while (lo < hi) {
      if (lo.isOdd) {
        tree[lo] = min(tree[lo], size);
        lo++;
      }
      if (hi.isOdd) {
        hi--;
        tree[hi] = min(tree[hi], size);
      }
      lo >>= 1;
      hi >>= 1;
    }
  }

  final result = List<int>.filled(queries.length, -1);
  for (var i = 0; i < queries.length; i++) {
    // Walk from the leaf up to the root; the best size painted on the path wins.
    var p = _lowerBound(sortedQueries, queries[i]) + m;
    var best = inf;
    while (p >= 1) {
      best = min(best, tree[p]);
      p >>= 1;
    }
    if (best != inf) result[i] = best;
  }
  return result;
}
