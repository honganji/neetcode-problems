const _directions = [
  [1, 0],
  [-1, 0],
  [0, 1],
  [0, -1],
];

List<List<int>> pacificAtlantic(List<List<int>> heights) {
  final m = heights.length;
  final n = heights[0].length;

  // Walk downhill from one cell, noting which oceans the walk touches.
  bool reachesBoth(int startR, int startC) {
    final start = startR * n + startC;
    final seen = <int>{start};
    final stack = <int>[start];
    var pacific = false;
    var atlantic = false;
    while (stack.isNotEmpty) {
      final cell = stack.removeLast();
      final r = cell ~/ n;
      final c = cell % n;
      pacific = pacific || r == 0 || c == 0;
      atlantic = atlantic || r == m - 1 || c == n - 1;
      if (pacific && atlantic) return true;
      for (final d in _directions) {
        final nr = r + d[0];
        final nc = c + d[1];
        if (nr < 0 || nr >= m || nc < 0 || nc >= n) continue;
        final next = nr * n + nc;
        if (!seen.contains(next) && heights[nr][nc] <= heights[r][c]) {
          seen.add(next);
          stack.add(next);
        }
      }
    }
    return false;
  }

  return [
    for (var r = 0; r < m; r++)
      for (var c = 0; c < n; c++)
        if (reachesBoth(r, c)) [r, c],
  ];
}
