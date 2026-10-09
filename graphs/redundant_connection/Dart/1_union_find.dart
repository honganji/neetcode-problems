List<int> findRedundantConnection(List<List<int>> edges) {
  final n = edges.length;
  final parent = List<int>.generate(n + 1, (i) => i);
  final size = List<int>.filled(n + 1, 1);

  int find(int x) {
    while (parent[x] != x) {
      parent[x] = parent[parent[x]]; // path halving
      x = parent[x];
    }
    return x;
  }

  for (final edge in edges) {
    var ra = find(edge[0]);
    var rb = find(edge[1]);
    if (ra == rb) return edge; // already connected, so this edge closes a loop
    if (size[ra] < size[rb]) {
      final tmp = ra;
      ra = rb;
      rb = tmp;
    }
    parent[rb] = ra;
    size[ra] += size[rb];
  }

  return const [];
}
