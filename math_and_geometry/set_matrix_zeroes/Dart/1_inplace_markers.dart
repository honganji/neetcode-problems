void setZeroes(List<List<int>> matrix) {
  final m = matrix.length;
  final n = matrix[0].length;
  // Row 0 and column 0 will be reused as markers, so remember their original zeros first.
  final firstRowHasZero = matrix[0].contains(0);
  final firstColHasZero = matrix.any((row) => row[0] == 0);

  // A zero at (i, j) marks row i (in column 0) and column j (in row 0).
  for (var i = 1; i < m; i++) {
    for (var j = 1; j < n; j++) {
      if (matrix[i][j] == 0) {
        matrix[i][0] = 0;
        matrix[0][j] = 0;
      }
    }
  }

  // Zero every inner cell whose row or column is marked.
  for (var i = 1; i < m; i++) {
    for (var j = 1; j < n; j++) {
      if (matrix[i][0] == 0 || matrix[0][j] == 0) {
        matrix[i][j] = 0;
      }
    }
  }

  if (firstRowHasZero) {
    for (var j = 0; j < n; j++) {
      matrix[0][j] = 0;
    }
  }
  if (firstColHasZero) {
    for (var i = 0; i < m; i++) {
      matrix[i][0] = 0;
    }
  }
}
