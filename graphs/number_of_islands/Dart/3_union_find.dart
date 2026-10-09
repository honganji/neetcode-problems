class Solution {
  int numIslands(List<List<String>> grid) {
    if (grid.isEmpty) return 0;

    final rows = grid.length;
    final cols = grid[0].length;
    final parent = List<int>.generate(rows * cols, (i) => i); // every cell starts alone
    final size = List<int>.filled(rows * cols, 1);

    int find(int x) {
      while (parent[x] != x) {
        parent[x] = parent[parent[x]];
        x = parent[x];
      }
      return x;
    }

    // Every land cell starts as its own island; each successful merge removes one.
    var islands = 0;
    for (final row in grid) {
      for (final cell in row) {
        if (cell == '1') islands++;
      }
    }

    void union(int a, int b) {
      var ra = find(a);
      var rb = find(b);
      if (ra == rb) return;
      if (size[ra] < size[rb]) {
        final t = ra;
        ra = rb;
        rb = t;
      }
      parent[rb] = ra;
      size[ra] += size[rb];
      islands--;
    }

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] != '1') continue;
        // Only check right and down so each pair of neighbors is handled once.
        final id = r * cols + c;
        if (c + 1 < cols && grid[r][c + 1] == '1') union(id, id + 1);
        if (r + 1 < rows && grid[r + 1][c] == '1') union(id, id + cols);
      }
    }
    return islands;
  }
}
