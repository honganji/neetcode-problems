int swimInWater(List<List<int>> grid) {
  final n = grid.length;
  final total = n * n;
  // Heights are exactly 0..n*n-1, so pos[t] is the cell that becomes usable at time t.
  final pos = List<int>.filled(total, 0);
  for (var r = 0; r < n; r++) {
    for (var c = 0; c < n; c++) {
      pos[grid[r][c]] = r * n + c;
    }
  }

  final parent = List<int>.generate(total, (i) => i);
  final size = List<int>.filled(total, 1);
  final active = List<bool>.filled(total, false);

  int find(int x) {
    while (parent[x] != x) {
      parent[x] = parent[parent[x]]; // path halving
      x = parent[x];
    }
    return x;
  }

  void union(int a, int b) {
    var ra = find(a);
    var rb = find(b);
    if (ra == rb) return;
    if (size[ra] < size[rb]) {
      final tmp = ra;
      ra = rb;
      rb = tmp;
    }
    parent[rb] = ra;
    size[ra] += size[rb];
  }

  const dr = [1, -1, 0, 0];
  const dc = [0, 0, 1, -1];

  // Add cells in order of height. Each newly usable cell joins its usable neighbors.
  // The first time the two corners are connected, that height is the answer.
  for (var t = 0; t < total; t++) {
    final cell = pos[t];
    active[cell] = true;
    final r = cell ~/ n;
    final c = cell % n;
    for (var k = 0; k < 4; k++) {
      final nr = r + dr[k];
      final nc = c + dc[k];
      if (nr >= 0 && nr < n && nc >= 0 && nc < n && active[nr * n + nc]) {
        union(cell, nr * n + nc);
      }
    }
    if (find(0) == find(total - 1)) return t;
  }
  return total - 1;
}
