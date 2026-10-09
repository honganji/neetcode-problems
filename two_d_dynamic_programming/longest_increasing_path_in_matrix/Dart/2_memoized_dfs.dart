int longestIncreasingPath(List<List<int>> matrix) {
  final rows = matrix.length;
  final cols = matrix[0].length;
  const dRow = [1, -1, 0, 0];
  const dCol = [0, 0, 1, -1];
  // memo[r][c] = longest increasing path that starts at (r, c); 0 means not computed yet.
  final memo = List.generate(rows, (_) => List.filled(cols, 0));

  int dfs(int r, int c) {
    if (memo[r][c] != 0) return memo[r][c];
    var best = 1;
    for (var k = 0; k < 4; k++) {
      final nr = r + dRow[k];
      final nc = c + dCol[k];
      if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] > matrix[r][c]) {
        final length = 1 + dfs(nr, nc);
        if (length > best) best = length;
      }
    }
    memo[r][c] = best;
    return best;
  }

  var answer = 0;
  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      final length = dfs(r, c);
      if (length > answer) answer = length;
    }
  }
  return answer;
}
