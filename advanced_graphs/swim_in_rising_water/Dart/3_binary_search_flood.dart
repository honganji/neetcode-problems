int swimInWater(List<List<int>> grid) {
  final n = grid.length;
  const dr = [1, -1, 0, 0];
  const dc = [0, 0, 1, -1];

  bool reachable(int limit) {
    // Flood fill from the top-left, using only cells at or below the limit.
    if (grid[0][0] > limit) return false;
    final seen = List<bool>.filled(n * n, false);
    seen[0] = true;
    final stack = <int>[0];
    while (stack.isNotEmpty) {
      final cell = stack.removeLast();
      if (cell == n * n - 1) return true;
      final r = cell ~/ n;
      final c = cell % n;
      for (var k = 0; k < 4; k++) {
        final nr = r + dr[k];
        final nc = c + dc[k];
        if (nr >= 0 && nr < n && nc >= 0 && nc < n) {
          final next = nr * n + nc;
          if (!seen[next] && grid[nr][nc] <= limit) {
            seen[next] = true;
            stack.add(next);
          }
        }
      }
    }
    return false;
  }

  // reachable() only gets easier as the limit grows, so binary search for the first true.
  var lo = grid[0][0];
  var hi = n * n - 1;
  while (lo < hi) {
    final mid = (lo + hi) ~/ 2;
    if (reachable(mid)) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }
  return lo;
}
