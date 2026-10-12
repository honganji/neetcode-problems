void setZeroes(List<List<int>> matrix) {
  final m = matrix.length;
  final n = matrix[0].length;
  final zeroRows = List<bool>.filled(m, false);
  final zeroCols = List<bool>.filled(n, false);

  // Record which rows and columns contain a zero.
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (matrix[i][j] == 0) {
        zeroRows[i] = true;
        zeroCols[j] = true;
      }
    }
  }

  // Clear every cell whose row or column was recorded.
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (zeroRows[i] || zeroCols[j]) {
        matrix[i][j] = 0;
      }
    }
  }
}
