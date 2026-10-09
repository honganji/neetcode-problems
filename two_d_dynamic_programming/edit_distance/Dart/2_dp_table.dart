import 'dart:math';

class Solution {
  int minDistance(String word1, String word2) {
    final a = word1.codeUnits;
    final b = word2.codeUnits;
    final m = a.length;
    final n = b.length;
    // dp[i][j] = edits needed to turn word1[:i] into word2[:j]
    final dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));
    for (var j = 0; j <= n; j++) {
      dp[0][j] = j;
    }
    for (var i = 0; i <= m; i++) {
      dp[i][0] = i;
    }

    for (var i = 1; i <= m; i++) {
      for (var j = 1; j <= n; j++) {
        if (a[i - 1] == b[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          // replace, delete, or insert
          dp[i][j] = 1 + min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1]));
        }
      }
    }
    return dp[m][n];
  }
}
