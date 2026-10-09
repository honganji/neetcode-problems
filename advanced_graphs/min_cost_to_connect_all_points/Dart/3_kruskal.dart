class Solution {
  int minCostConnectPoints(List<List<int>> points) {
    final n = points.length;

    // Every pair of points is a possible edge: [cost, i, j].
    final edges = <List<int>>[];
    for (var i = 0; i < n; i++) {
      for (var j = i + 1; j < n; j++) {
        edges.add([_manhattan(points[i], points[j]), i, j]);
      }
    }
    edges.sort((a, b) => a[0].compareTo(b[0]));

    final parent = List<int>.generate(n, (i) => i);

    int find(int x) {
      while (parent[x] != x) {
        parent[x] = parent[parent[x]]; // path halving
        x = parent[x];
      }
      return x;
    }

    var total = 0;
    var used = 0;
    // Take the cheapest edges that do not close a loop, until n - 1 are taken.
    for (final edge in edges) {
      if (used == n - 1) break;
      final ri = find(edge[1]);
      final rj = find(edge[2]);
      if (ri != rj) {
        parent[ri] = rj;
        total += edge[0];
        used++;
      }
    }
    return total;
  }

  int _manhattan(List<int> a, List<int> b) {
    return (a[0] - b[0]).abs() + (a[1] - b[1]).abs();
  }
}
