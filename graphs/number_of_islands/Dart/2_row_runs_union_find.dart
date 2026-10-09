class Solution {
  int numIslands(List<List<String>> grid) {
    if (grid.isEmpty) return 0;

    // Step 1: split each row into runs of consecutive land, e.g. "11011" -> (0, 1), (3, 4).
    final runStart = <int>[];
    final runEnd = <int>[];
    final rowBegin = <int>[]; // index in runStart where each row's runs start
    for (final row in grid) {
      rowBegin.add(runStart.length);
      var start = -1;
      for (var c = 0; c <= row.length; c++) {
        final isLand = c < row.length && row[c] == '1';
        if (isLand && start < 0) {
          start = c;
        } else if (!isLand && start >= 0) {
          runStart.add(start);
          runEnd.add(c - 1);
          start = -1;
        }
      }
    }
    rowBegin.add(runStart.length);

    // Step 2: each run starts as its own island; runs that touch in adjacent rows merge.
    final n = runStart.length;
    final parent = List<int>.generate(n, (i) => i);
    final size = List<int>.filled(n, 1);
    var islands = n;

    int find(int x) {
      while (parent[x] != x) {
        parent[x] = parent[parent[x]];
        x = parent[x];
      }
      return x;
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

    for (var r = 1; r < grid.length; r++) {
      var i = rowBegin[r - 1];
      final iEnd = rowBegin[r];
      var j = rowBegin[r];
      final jEnd = rowBegin[r + 1];
      while (i < iEnd && j < jEnd) {
        // Columns overlap, so the two runs touch.
        if (runStart[i] <= runEnd[j] && runStart[j] <= runEnd[i]) {
          union(i, j);
        }
        // The run that ends first cannot touch any later run in the other row.
        if (runEnd[i] < runEnd[j]) {
          i++;
        } else {
          j++;
        }
      }
    }
    return islands;
  }
}
