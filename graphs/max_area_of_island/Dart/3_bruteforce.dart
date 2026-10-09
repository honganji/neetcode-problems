import 'dart:math';

class Solution {
  int maxAreaOfIsland(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    const directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];
    var best = 0;

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] == 0) continue;
        // Search from this cell with its own visited set. Nothing is shared
        // with other starts, so every island is re-explored from each of its cells.
        final start = r * cols + c;
        final visited = <int>{start};
        final stack = <int>[start];
        var area = 0;
        while (stack.isNotEmpty) {
          final cur = stack.removeLast();
          area++;
          final cr = cur ~/ cols;
          final cc = cur % cols;
          for (final d in directions) {
            final nr = cr + d[0];
            final nc = cc + d[1];
            if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1) {
              final nid = nr * cols + nc;
              if (visited.add(nid)) stack.add(nid);
            }
          }
        }
        best = max(best, area);
      }
    }
    return best;
  }
}
