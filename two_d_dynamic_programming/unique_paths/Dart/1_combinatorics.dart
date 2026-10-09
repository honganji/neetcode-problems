import 'dart:math';

class Solution {
  int uniquePaths(int m, int n) {
    // Every path is a sequence of (m - 1) downs and (n - 1) rights.
    // The answer is how many ways we can pick which moves are downs: C(m + n - 2, k).
    final total = m + n - 2;
    final k = min(m - 1, n - 1);
    var result = 1;
    for (var i = 1; i <= k; i++) {
      // Each step keeps result an exact integer, so ~/ is safe here.
      result = result * (total - k + i) ~/ i;
    }
    return result;
  }
}
