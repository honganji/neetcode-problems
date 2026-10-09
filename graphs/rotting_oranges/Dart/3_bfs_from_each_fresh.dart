import 'dart:collection';
import 'dart:math';

class Solution {
  int orangesRotting(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    var worst = 0;

    // Each fresh orange needs as long as its nearest rotten orange is away.
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] != 1) continue;
        final d = _minutesToNearestRotten(grid, r, c);
        if (d == -1) return -1;
        worst = max(worst, d);
      }
    }

    return worst;
  }

  int _minutesToNearestRotten(List<List<int>> grid, int sr, int sc) {
    final rows = grid.length;
    final cols = grid[0].length;
    const dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
    final seen = List.generate(rows, (_) => List.filled(cols, false));
    final queue = Queue<(int, int, int)>();

    seen[sr][sc] = true;
    queue.add((sr, sc, 0));

    while (queue.isNotEmpty) {
      final (r, c, d) = queue.removeFirst();
      for (final (dr, dc) in dirs) {
        final nr = r + dr;
        final nc = c + dc;
        if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
        if (seen[nr][nc] || grid[nr][nc] == 0) continue;
        if (grid[nr][nc] == 2) return d + 1;
        seen[nr][nc] = true;
        queue.add((nr, nc, d + 1));
      }
    }

    return -1;
  }
}
