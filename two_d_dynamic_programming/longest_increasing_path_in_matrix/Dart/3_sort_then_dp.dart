int longestIncreasingPath(List<List<int>> matrix) {
  final rows = matrix.length;
  final cols = matrix[0].length;
  const dRow = [1, -1, 0, 0];
  const dCol = [0, 0, 1, -1];

  // Visit cells from smallest to largest value.
  final cells = <List<int>>[
    for (var r = 0; r < rows; r++)
      for (var c = 0; c < cols; c++) [r, c],
  ]..sort((a, b) => matrix[a[0]][a[1]].compareTo(matrix[b[0]][b[1]]));

  // dp[r][c] = longest increasing path that ends at (r, c).
  final dp = List.generate(rows, (_) => List.filled(cols, 1));
  for (final cell in cells) {
    final r = cell[0];
    final c = cell[1];
    // Every smaller neighbor was visited earlier, so its dp value is final.
    for (var k = 0; k < 4; k++) {
      final nr = r + dRow[k];
      final nc = c + dCol[k];
      if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] < matrix[r][c]) {
        if (dp[nr][nc] + 1 > dp[r][c]) dp[r][c] = dp[nr][nc] + 1;
      }
    }
  }

  var answer = 0;
  for (final row in dp) {
    for (final value in row) {
      if (value > answer) answer = value;
    }
  }
  return answer;
}
