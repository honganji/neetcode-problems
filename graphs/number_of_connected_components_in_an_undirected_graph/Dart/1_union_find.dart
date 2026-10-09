class Solution {
  int countComponents(int n, List<List<int>> edges) {
    final parent = List<int>.generate(n, (i) => i);
    final size = List<int>.filled(n, 1);
    var components = n;

    int find(int x) {
      var node = x;
      // Path halving: point each visited node at its grandparent.
      while (parent[node] != node) {
        parent[node] = parent[parent[node]];
        node = parent[node];
      }
      return node;
    }

    for (final edge in edges) {
      var rootA = find(edge[0]);
      var rootB = find(edge[1]);
      if (rootA == rootB) continue; // already in the same group

      // Attach the smaller group under the bigger one.
      if (size[rootA] < size[rootB]) {
        final tmp = rootA;
        rootA = rootB;
        rootB = tmp;
      }
      parent[rootB] = rootA;
      size[rootA] += size[rootB];
      components--; // two groups became one
    }

    return components;
  }
}
