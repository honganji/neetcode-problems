class Solution {
  void rotate(List<List<int>> matrix) {
    final n = matrix.length;
    // Put each value at its rotated position in a new matrix.
    final rotated = List.generate(n, (_) => List<int>.filled(n, 0));
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < n; j++) {
        rotated[j][n - 1 - i] = matrix[i][j];
      }
    }
    // Copy the result back into the original matrix.
    for (var i = 0; i < n; i++) {
      matrix[i].setAll(0, rotated[i]);
    }
  }
}
