List<int> spiralOrder(List<List<int>> matrix) {
  final result = <int>[];
  var top = 0, bottom = matrix.length - 1;
  var left = 0, right = matrix[0].length - 1;
  while (top <= bottom && left <= right) {
    // Walk the top edge left to right, then drop the top edge inward.
    for (var col = left; col <= right; col++) {
      result.add(matrix[top][col]);
    }
    top++;
    // Walk the right edge top to bottom.
    for (var row = top; row <= bottom; row++) {
      result.add(matrix[row][right]);
    }
    right--;
    // These two checks stop a single row or column from being walked twice.
    if (top <= bottom) {
      for (var col = right; col >= left; col--) {
        result.add(matrix[bottom][col]);
      }
      bottom--;
    }
    if (left <= right) {
      for (var row = bottom; row >= top; row--) {
        result.add(matrix[row][left]);
      }
      left++;
    }
  }
  return result;
}
