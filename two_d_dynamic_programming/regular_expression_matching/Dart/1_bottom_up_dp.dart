class Solution {
  bool isMatch(String s, String p) {
    final m = s.length;
    final n = p.length;
    // nextRow[j] = does s[i+1:] match p[j:]
    var nextRow = List<bool>.filled(n + 1, false);
    for (var i = m; i >= 0; i--) {
      // cur[j] = does s[i:] match p[j:]
      final cur = List<bool>.filled(n + 1, false);
      cur[n] = i == m; // empty text matches an empty pattern suffix
      for (var j = n - 1; j >= 0; j--) {
        final firstMatch = i < m && (p[j] == s[i] || p[j] == '.');
        if (j + 1 < n && p[j + 1] == '*') {
          // skip "x*" entirely, or consume one char and stay on "x*"
          cur[j] = cur[j + 2] || (firstMatch && nextRow[j]);
        } else {
          cur[j] = firstMatch && nextRow[j + 1];
        }
      }
      nextRow = cur;
    }
    return nextRow[0];
  }
}
