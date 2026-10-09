class Solution {
  List<List<String>> solveNQueens(int n) {
    final res = <List<String>>[];
    final cols = List<int>.filled(n, 0); // cols[row] = column of that row's queen

    void place(int row) {
      if (row == n) {
        if (_isValid(cols)) {
          res.add([for (final c in cols) _row(c, n)]);
        }
        return;
      }
      // Try every column for this row
      for (var c = 0; c < n; c++) {
        cols[row] = c;
        place(row + 1);
      }
    }

    place(0);
    return res;
  }

  bool _isValid(List<int> cols) {
    for (var i = 0; i < cols.length; i++) {
      for (var j = i + 1; j < cols.length; j++) {
        // Same column, or same diagonal (equal row and column distance)
        if (cols[i] == cols[j] || (cols[i] - cols[j]).abs() == j - i) {
          return false;
        }
      }
    }
    return true;
  }

  String _row(int col, int n) =>
      List.generate(n, (j) => j == col ? 'Q' : '.').join();
}
