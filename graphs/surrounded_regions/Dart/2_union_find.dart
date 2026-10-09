class Solution {
  void solve(List<List<String>> board) {
    if (board.isEmpty || board[0].isEmpty) return;
    final rows = board.length;
    final cols = board[0].length;
    final border = rows * cols; // virtual node meaning "connected to the border"
    final parent = List<int>.generate(rows * cols + 1, (i) => i);
    final size = List<int>.filled(rows * cols + 1, 1);

    int find(int x) {
      while (parent[x] != x) {
        parent[x] = parent[parent[x]]; // path halving
        x = parent[x];
      }
      return x;
    }

    void union(int a, int b) {
      var ra = find(a);
      var rb = find(b);
      if (ra == rb) return;
      if (size[ra] < size[rb]) {
        final tmp = ra;
        ra = rb;
        rb = tmp;
      }
      parent[rb] = ra;
      size[ra] += size[rb];
    }

    // Group each 'O' with its 'O' neighbours; border 'O's join the border node
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (board[r][c] != 'O') continue;
        final cell = r * cols + c;
        if (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) {
          union(cell, border);
        }
        if (r + 1 < rows && board[r + 1][c] == 'O') union(cell, cell + cols);
        if (c + 1 < cols && board[r][c + 1] == 'O') union(cell, cell + 1);
      }
    }

    // Any 'O' not in the border's group is surrounded
    final safe = find(border);
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (board[r][c] == 'O' && find(r * cols + c) != safe) {
          board[r][c] = 'X';
        }
      }
    }
  }
}
