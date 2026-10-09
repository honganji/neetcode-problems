class Solution {
  int countSubstrings(String s) {
    final n = s.length;
    // dp[i][j] is true when s[i..j] is a palindrome.
    final dp = List.generate(n, (_) => List<bool>.filled(n, false));
    var count = 0;
    for (var i = n - 1; i >= 0; i--) {
      for (var j = i; j < n; j++) {
        // Ends must match, and the inside must itself be a palindrome (or empty/one char).
        if (s[i] == s[j] && (j - i < 2 || dp[i + 1][j - 1])) {
          dp[i][j] = true;
          count++;
        }
      }
    }
    return count;
  }
}
