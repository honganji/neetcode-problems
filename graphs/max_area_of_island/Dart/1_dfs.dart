import 'dart:math';

class Solution {
  int maxAreaOfIsland(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    var best = 0;

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] == 0) continue;
        // Sink the first land cell we meet so it is never counted again.
        grid[r][c] = 0;
        final stack = <List<int>>[
          [r, c]
        ];
        var area = 0;
        while (stack.isNotEmpty) {
          final cell = stack.removeLast();
          area++;
          final cr = cell[0];
          final cc = cell[1];
          for (final d in const [
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1]
          ]) {
            final nr = cr + d[0];
            final nc = cc + d[1];
            if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1) {
              grid[nr][nc] = 0; // mark when pushed so no cell is added twice
              stack.add([nr, nc]);
            }
          }
        }
        best = max(best, area);
      }
    }
    return best;
  }
}
