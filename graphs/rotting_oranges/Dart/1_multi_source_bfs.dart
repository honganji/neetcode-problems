import 'dart:collection';

class Solution {
  int orangesRotting(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    final queue = Queue<(int, int)>();
    var fresh = 0;

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] == 2) {
          queue.add((r, c));
        } else if (grid[r][c] == 1) {
          fresh++;
        }
      }
    }

    const dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
    var minutes = 0;

    // Each BFS layer is one minute of spreading.
    while (queue.isNotEmpty && fresh > 0) {
      for (var n = queue.length; n > 0; n--) {
        final (r, c) = queue.removeFirst();
        for (final (dr, dc) in dirs) {
          final nr = r + dr;
          final nc = c + dc;
          if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
          if (grid[nr][nc] != 1) continue;
          grid[nr][nc] = 2;
          fresh--;
          queue.add((nr, nc));
        }
      }
      minutes++;
    }

    return fresh == 0 ? minutes : -1;
  }
}
