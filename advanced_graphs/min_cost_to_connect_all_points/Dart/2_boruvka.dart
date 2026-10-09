class Solution {
  int minCostConnectPoints(List<List<int>> points) {
    final n = points.length;
    final parent = List<int>.generate(n, (i) => i);

    int find(int x) {
      while (parent[x] != x) {
        parent[x] = parent[parent[x]]; // path halving
        x = parent[x];
      }
      return x;
    }

    var total = 0;
    var components = n;
    while (components > 1) {
      // Each component finds its cheapest edge to another component.
      // An edge is [cost, i, j]; comparing lists in order gives a fixed tie-break.
      final best = List<List<int>?>.filled(n, null);
      for (var i = 0; i < n; i++) {
        final ri = find(i);
        for (var j = i + 1; j < n; j++) {
          final rj = find(j);
          if (ri == rj) continue;
          final edge = [_manhattan(points[i], points[j]), i, j];
          _keepSmaller(best, ri, edge);
          _keepSmaller(best, rj, edge);
        }
      }

      // Add those edges, skipping any that would form a cycle.
      for (final edge in best) {
        if (edge == null) continue;
        final ri = find(edge[1]);
        final rj = find(edge[2]);
        if (ri != rj) {
          parent[ri] = rj;
          total += edge[0];
          components--;
        }
      }
    }
    return total;
  }

  void _keepSmaller(List<List<int>?> best, int root, List<int> edge) {
    final current = best[root];
    if (current == null || _isLess(edge, current)) best[root] = edge;
  }

  bool _isLess(List<int> a, List<int> b) {
    for (var k = 0; k < 3; k++) {
      if (a[k] != b[k]) return a[k] < b[k];
    }
    return false;
  }

  int _manhattan(List<int> a, List<int> b) {
    return (a[0] - b[0]).abs() + (a[1] - b[1]).abs();
  }
}
