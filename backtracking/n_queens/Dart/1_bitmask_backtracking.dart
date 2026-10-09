class Solution {
  List<List<String>> solveNQueens(int n) {
    final res = <List<String>>[];
    final cols = List<int>.filled(n, 0); // cols[row] = column of that row's queen
    final full = (1 << n) - 1;

    void backtrack(int row, int colMask, int diag1, int diag2) {
      if (row == n) {
        res.add([for (final c in cols) _row(c, n)]);
        return;
      }
      // Columns not attacked by any queen placed so far
      var free = full & ~(colMask | diag1 | diag2);
      while (free != 0) {
        final bit = free & -free; // lowest free column
        free ^= bit;
        cols[row] = bit.bitLength - 1;
        // Attacked diagonals move one column per row
        backtrack(row + 1, colMask | bit, (diag1 | bit) << 1, (diag2 | bit) >> 1);
      }
    }

    backtrack(0, 0, 0, 0);
    return res;
  }

  String _row(int col, int n) =>
      List.generate(n, (j) => j == col ? 'Q' : '.').join();
}
