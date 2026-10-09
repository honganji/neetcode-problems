class Solution {
  static const _directions = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];

  bool exist(List<List<String>> board, String word) {
    final rows = board.length;
    final cols = board[0].length;
    final visited = List.generate(rows, (_) => List.filled(cols, false));

    bool dfs(int r, int c, int i) {
      if (i == word.length) return true;
      if (r < 0 ||
          c < 0 ||
          r >= rows ||
          c >= cols ||
          visited[r][c] ||
          board[r][c] != word[i]) {
        return false;
      }

      // Track the path in a separate grid instead of changing the board.
      visited[r][c] = true;
      final found =
          _directions.any((d) => dfs(r + d[0], c + d[1], i + 1));
      visited[r][c] = false;
      return found;
    }

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (dfs(r, c, 0)) return true;
      }
    }
    return false;
  }
}
