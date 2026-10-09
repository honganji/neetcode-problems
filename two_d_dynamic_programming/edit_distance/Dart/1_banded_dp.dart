import 'dart:math';

class Solution {
  int minDistance(String word1, String word2) {
    final a = word1.codeUnits;
    final b = word2.codeUnits;
    // Try a band of width k around the diagonal; double k until the answer fits.
    var k = max(1, (a.length - b.length).abs());
    while (true) {
      final result = _banded(a, b, k);
      if (result <= k) return result;
      k *= 2;
    }
  }

  int _banded(List<int> a, List<int> b, int k) {
    final m = a.length;
    final n = b.length;
    final inf = m + n + 1; // larger than any real cost
    var prev = List<int>.generate(n + 1, (j) => j <= k ? j : inf);
    for (var i = 1; i <= m; i++) {
      final cur = List<int>.filled(n + 1, inf);
      if (i <= k) cur[0] = i;
      // Only fill cells within k of the diagonal.
      final lo = max(1, i - k);
      final hi = min(n, i + k);
      for (var j = lo; j <= hi; j++) {
        if (a[i - 1] == b[j - 1]) {
          cur[j] = prev[j - 1];
        } else {
          cur[j] = 1 + min(prev[j - 1], min(prev[j], cur[j - 1]));
        }
      }
      prev = cur;
    }
    return prev[n];
  }
}
