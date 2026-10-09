class Solution {
  bool isMatch(String s, String p) {
    bool match(int i, int j) {
      if (j == p.length) return i == s.length;
      final firstMatch = i < s.length && (p[j] == s[i] || p[j] == '.');
      if (j + 1 < p.length && p[j + 1] == '*') {
        // try zero matches first, then one match staying on "x*"
        return match(i, j + 2) || (firstMatch && match(i + 1, j));
      }
      return firstMatch && match(i + 1, j + 1);
    }

    return match(0, 0);
  }
}
