class Solution {
  void rotate(List<List<int>> matrix) {
    final n = matrix.length;
    // Transpose: swap each cell with its mirror across the main diagonal.
    for (var i = 0; i < n; i++) {
      for (var j = i + 1; j < n; j++) {
        final tmp = matrix[i][j];
        matrix[i][j] = matrix[j][i];
        matrix[j][i] = tmp;
      }
    }
    // Reverse every row to finish the clockwise rotation.
    for (final row in matrix) {
      for (var l = 0, r = n - 1; l < r; l++, r--) {
        final tmp = row[l];
        row[l] = row[r];
        row[r] = tmp;
      }
    }
  }
}
