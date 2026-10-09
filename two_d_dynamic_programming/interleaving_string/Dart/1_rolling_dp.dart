bool isInterleave(String s1, String s2, String s3) {
  final m = s1.length;
  final n = s2.length;
  if (m + n != s3.length) return false;

  // dp[j] is true when s1[:i] and s2[:j] can interleave into s3[:i + j].
  // One row is reused: dp[j] still holds row i - 1 until it is updated.
  final dp = List<bool>.filled(n + 1, false);
  for (var i = 0; i <= m; i++) {
    for (var j = 0; j <= n; j++) {
      if (i == 0 && j == 0) {
        dp[j] = true;
        continue;
      }
      final fromTop = i > 0 && dp[j] && s1[i - 1] == s3[i + j - 1];
      final fromLeft = j > 0 && dp[j - 1] && s2[j - 1] == s3[i + j - 1];
      dp[j] = fromTop || fromLeft;
    }
  }
  return dp[n];
}
