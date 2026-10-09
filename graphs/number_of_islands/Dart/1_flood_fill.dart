class Solution {
  int numIslands(List<List<String>> grid) {
    if (grid.isEmpty) return 0;

    final rows = grid.length;
    final cols = grid[0].length;
    const directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ];
    var islands = 0;

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] != '1') continue;

        // New island found: count it, then sink every land cell connected to it.
        islands++;
        grid[r][c] = '0';
        final stack = <List<int>>[
          [r, c],
        ];
        while (stack.isNotEmpty) {
          final cell = stack.removeLast();
          for (final d in directions) {
            final nr = cell[0] + d[0];
            final nc = cell[1] + d[1];
            if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == '1') {
              grid[nr][nc] = '0'; // mark when pushed so no cell is added twice
              stack.add([nr, nc]);
            }
          }
        }
      }
    }
    return islands;
  }
}
