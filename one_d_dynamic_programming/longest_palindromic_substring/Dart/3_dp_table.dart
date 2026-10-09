class Solution {
  String longestPalindrome(String s) {
    final n = s.length;
    // dp[i][j] is true when s[i..j] is a palindrome.
    final dp = List.generate(n, (_) => List<bool>.filled(n, false));
    var start = 0, best = 0;
    // Going i from right to left means dp[i + 1][...] is ready when needed.
    for (var i = n - 1; i >= 0; i--) {
      for (var j = i; j < n; j++) {
        // s[i..j] is a palindrome if its ends match and the inside is one too.
        if (s[i] == s[j] && (j - i < 2 || dp[i + 1][j - 1])) {
          dp[i][j] = true;
          if (j - i + 1 > best) {
            start = i;
            best = j - i + 1;
          }
        }
      }
    }
    return s.substring(start, start + best);
  }
}
