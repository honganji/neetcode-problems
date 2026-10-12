List<int> spiralOrder(List<List<int>> matrix) {
  final m = matrix.length;
  final n = matrix[0].length;
  final visited = List.generate(m, (_) => List.filled(n, false));
  // Right, down, left, up.
  const dRow = [0, 1, 0, -1];
  const dCol = [1, 0, -1, 0];
  final result = <int>[];
  var row = 0, col = 0, d = 0;
  for (var step = 0; step < m * n; step++) {
    result.add(matrix[row][col]);
    visited[row][col] = true;
    var nextRow = row + dRow[d];
    var nextCol = col + dCol[d];
    // Turn clockwise when the next cell is off the grid or already used.
    if (nextRow < 0 || nextRow >= m || nextCol < 0 || nextCol >= n ||
        visited[nextRow][nextCol]) {
      d = (d + 1) % 4;
      nextRow = row + dRow[d];
      nextCol = col + dCol[d];
    }
    row = nextRow;
    col = nextCol;
  }
  return result;
}
