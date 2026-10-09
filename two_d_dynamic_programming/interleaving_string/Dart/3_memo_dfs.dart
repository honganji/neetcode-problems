bool isInterleave(String s1, String s2, String s3) {
  final m = s1.length;
  final n = s2.length;
  if (m + n != s3.length) return false;

  // memo[i][j] is null until that state has been computed.
  final memo = List.generate(m + 1, (_) => List<bool?>.filled(n + 1, null));

  bool dfs(int i, int j) {
    // Used all of s1 and s2, so s3 is fully matched.
    if (i == m && j == n) return true;
    final cached = memo[i][j];
    if (cached != null) return cached;
    final k = i + j;
    // Try to take the next character from s1, or from s2.
    final result = (i < m && s1[i] == s3[k] && dfs(i + 1, j)) ||
        (j < n && s2[j] == s3[k] && dfs(i, j + 1));
    memo[i][j] = result;
    return result;
  }

  return dfs(0, 0);
}
