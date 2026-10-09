class Solution {
  List<List<String>> partition(String s) {
    final n = s.length;
    final result = <List<String>>[];

    // Bit k of mask set means "cut after index k".
    for (var mask = 0; mask < (1 << (n - 1)); mask++) {
      final parts = <String>[];
      var start = 0;
      var valid = true;
      for (var end = 0; end < n; end++) {
        final isCut = end == n - 1 || ((mask >> end) & 1) == 1;
        if (!isCut) continue;
        if (!_isPalindrome(s, start, end)) {
          valid = false;
          break;
        }
        parts.add(s.substring(start, end + 1));
        start = end + 1;
      }
      if (valid) result.add(parts);
    }
    return result;
  }

  bool _isPalindrome(String s, int l, int r) {
    while (l < r) {
      if (s[l] != s[r]) return false;
      l++;
      r--;
    }
    return true;
  }
}
