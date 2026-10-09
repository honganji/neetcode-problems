class Solution {
  bool validTree(int n, List<List<int>> edges) {
    // A tree on n nodes has exactly n - 1 edges.
    if (edges.length != n - 1) return false;

    final parent = List<int>.generate(n, (i) => i);
    final size = List<int>.filled(n, 1);

    int find(int x) {
      while (parent[x] != x) {
        parent[x] = parent[parent[x]]; // path halving
        x = parent[x];
      }
      return x;
    }

    for (final edge in edges) {
      var rootA = find(edge[0]);
      var rootB = find(edge[1]);
      if (rootA == rootB) return false; // this edge would close a cycle
      if (size[rootA] < size[rootB]) {
        final tmp = rootA;
        rootA = rootB;
        rootB = tmp;
      }
      parent[rootB] = rootA;
      size[rootA] += size[rootB];
    }

    return true;
  }
}
