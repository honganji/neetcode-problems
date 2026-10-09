class Solution {
  int uniquePaths(int m, int n) {
    // row[j] = number of paths to the cell at column j of the current row.
    final row = List<int>.filled(n, 1); // the first row: one way to each cell
    for (var r = 1; r < m; r++) {
      for (var j = 1; j < n; j++) {
        // row[j] holds the count from above; row[j - 1] was already updated
        // for this row, so it holds the count from the left.
        row[j] += row[j - 1];
      }
    }
    return row[n - 1];
  }
}
