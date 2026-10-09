import 'dart:math';

class Solution {
  int maxAreaOfIsland(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    final total = rows * cols;
    final parent = List<int>.generate(total, (i) => i); // each cell starts alone
    final size = List<int>.filled(total, 1); // group size, valid at the root

    int find(int x) {
      while (parent[x] != x) {
        parent[x] = parent[parent[x]]; // path halving: shortcut upwards
        x = parent[x];
      }
      return x;
    }

    void union(int a, int b) {
      var ra = find(a);
      var rb = find(b);
      if (ra == rb) return;
      if (size[ra] < size[rb]) {
        // attach the smaller group under the larger
        final tmp = ra;
        ra = rb;
        rb = tmp;
      }
      parent[rb] = ra;
      size[ra] += size[rb];
    }

    // Join each land cell with its land neighbours below and to the right.
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] == 0) continue;
        final id = r * cols + c;
        if (r + 1 < rows && grid[r + 1][c] == 1) union(id, id + cols);
        if (c + 1 < cols && grid[r][c + 1] == 1) union(id, id + 1);
      }
    }

    var best = 0;
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] == 1) {
          best = max(best, size[find(r * cols + c)]);
        }
      }
    }
    return best;
  }
}
