class Solution {
  int orangesRotting(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    const dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
    var minutes = 0;

    while (true) {
      // Find fresh oranges next to a rotten one. Rot them after the scan so
      // an orange that rots this minute can't spread again in the same minute.
      final toRot = <(int, int)>[];
      for (var r = 0; r < rows; r++) {
        for (var c = 0; c < cols; c++) {
          if (grid[r][c] != 1) continue;
          final touchesRotten = dirs.any((d) {
            final nr = r + d.$1;
            final nc = c + d.$2;
            return nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 2;
          });
          if (touchesRotten) toRot.add((r, c));
        }
      }

      if (toRot.isEmpty) break;
      for (final (r, c) in toRot) {
        grid[r][c] = 2;
      }
      minutes++;
    }

    final anyFresh = grid.any((row) => row.contains(1));
    return anyFresh ? -1 : minutes;
  }
}
