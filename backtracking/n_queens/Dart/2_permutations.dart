class Solution {
  List<List<String>> solveNQueens(int n) {
    final res = <List<String>>[];
    final perm = List<int>.generate(n, (i) => i); // perm[row] = column

    void swap(int i, int j) {
      final t = perm[i];
      perm[i] = perm[j];
      perm[j] = t;
    }

    void permute(int k) {
      if (k == n) {
        if (_isValid(perm)) {
          res.add([for (final c in perm) _row(c, n)]);
        }
        return;
      }
      for (var i = k; i < n; i++) {
        swap(k, i);
        permute(k + 1);
        swap(k, i);
      }
    }

    permute(0);
    return res;
  }

  // Rows and columns are unique by construction, so only diagonals need checking
  bool _isValid(List<int> perm) {
    final sums = <int>{};
    final diffs = <int>{};
    for (var r = 0; r < perm.length; r++) {
      sums.add(r + perm[r]);
      diffs.add(r - perm[r]);
    }
    return sums.length == perm.length && diffs.length == perm.length;
  }

  String _row(int col, int n) =>
      List.generate(n, (j) => j == col ? 'Q' : '.').join();
}
