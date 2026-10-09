class Solution {
  int minCostConnectPoints(List<List<int>> points) {
    final n = points.length;
    const inf = 1 << 62;
    // dist[v] = cheapest known link from point v to the tree built so far
    final dist = List<int>.filled(n, inf);
    final inTree = List<bool>.filled(n, false);
    dist[0] = 0;
    var total = 0;

    for (var step = 0; step < n; step++) {
      // Pick the closest point that is not in the tree yet.
      var u = -1;
      for (var v = 0; v < n; v++) {
        if (!inTree[v] && (u == -1 || dist[v] < dist[u])) u = v;
      }
      inTree[u] = true;
      total += dist[u];

      // The new tree point may offer cheaper links to the rest.
      for (var v = 0; v < n; v++) {
        if (!inTree[v]) {
          final d = _manhattan(points[u], points[v]);
          if (d < dist[v]) dist[v] = d;
        }
      }
    }
    return total;
  }

  int _manhattan(List<int> a, List<int> b) {
    return (a[0] - b[0]).abs() + (a[1] - b[1]).abs();
  }
}
