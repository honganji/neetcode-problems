import 'dart:math';

int longestCommonSubsequence(String text1, String text2) {
  final m = text1.length;
  final n = text2.length;
  // dp[i][j] = LCS length of text1[i:] and text2[j:]
  final dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));
  for (var i = m - 1; i >= 0; i--) {
    for (var j = n - 1; j >= 0; j--) {
      if (text1[i] == text2[j]) {
        dp[i][j] = 1 + dp[i + 1][j + 1];
      } else {
        dp[i][j] = max(dp[i + 1][j], dp[i][j + 1]);
      }
    }
  }
  return dp[0][0];
}
