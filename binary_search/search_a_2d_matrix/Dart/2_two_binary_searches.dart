bool searchMatrix(List<List<int>> matrix, int target) {
  var top = 0;
  var bottom = matrix.length - 1;
  while (top <= bottom) {
    final mid = (top + bottom) ~/ 2;
    if (target < matrix[mid][0]) {
      bottom = mid - 1;
    } else if (target > matrix[mid].last) {
      top = mid + 1;
    } else {
      break;
    }
  }
  if (top > bottom) {
    return false;
  }
  final row = matrix[(top + bottom) ~/ 2];
  var left = 0;
  var right = row.length - 1;
  while (left <= right) {
    final mid = (left + right) ~/ 2;
    if (row[mid] == target) {
      return true;
    }
    if (row[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return false;
}
