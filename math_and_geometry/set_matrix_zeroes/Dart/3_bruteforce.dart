void setZeroes(List<List<int>> matrix) {
  final m = matrix.length;
  final n = matrix[0].length;
  // Read zeros from an untouched copy, so the zeros we create don't spread further.
  final original = [for (final row in matrix) List<int>.of(row)];

  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (original[i][j] == 0) {
        for (var c = 0; c < n; c++) {
          matrix[i][c] = 0;
        }
        for (var r = 0; r < m; r++) {
          matrix[r][j] = 0;
        }
      }
    }
  }
}
