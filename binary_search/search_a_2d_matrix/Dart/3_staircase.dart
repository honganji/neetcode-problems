bool searchMatrix(List<List<int>> matrix, int target) {
  var row = 0;
  var col = matrix[0].length - 1;
  while (row < matrix.length && col >= 0) {
    final value = matrix[row][col];
    if (value == target) {
      return true;
    }
    if (value > target) {
      col--;
    } else {
      row++;
    }
  }
  return false;
}
