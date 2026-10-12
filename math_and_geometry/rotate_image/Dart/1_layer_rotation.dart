class Solution {
  void rotate(List<List<int>> matrix) {
    final n = matrix.length;
    // Work from the outside ring inward.
    for (var first = 0; first < n ~/ 2; first++) {
      final last = n - 1 - first;
      // Each step moves 4 cells in one cycle: top -> right -> bottom -> left -> top.
      for (var i = first; i < last; i++) {
        final offset = i - first;
        final top = matrix[first][i];
        matrix[first][i] = matrix[last - offset][first]; // left -> top
        matrix[last - offset][first] = matrix[last][last - offset]; // bottom -> left
        matrix[last][last - offset] = matrix[i][last]; // right -> bottom
        matrix[i][last] = top; // top -> right
      }
    }
  }
}
