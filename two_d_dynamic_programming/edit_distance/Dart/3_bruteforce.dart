import 'dart:math';

class Solution {
  int minDistance(String word1, String word2) {
    final a = word1.codeUnits;
    final b = word2.codeUnits;
    final m = a.length;
    final n = b.length;

    // a[i:] and b[j:] are the parts still to match
    int solve(int i, int j) {
      if (i == m) return n - j; // insert the rest of word2
      if (j == n) return m - i; // delete the rest of word1
      if (a[i] == b[j]) return solve(i + 1, j + 1);
      return 1 +
          min(
            solve(i + 1, j + 1), // replace
            min(solve(i + 1, j), // delete
                solve(i, j + 1)), // insert
          );
    }

    return solve(0, 0);
  }
}
