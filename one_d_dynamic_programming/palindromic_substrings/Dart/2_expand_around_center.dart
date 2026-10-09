class Solution {
  int countSubstrings(String s) {
    final n = s.length;
    var count = 0;
    // There are 2n - 1 possible centers: n characters and n - 1 gaps between them.
    for (var center = 0; center < 2 * n - 1; center++) {
      var left = center ~/ 2;
      var right = left + center % 2;
      // Every time the ends still match, the substring between them is a new palindrome.
      while (left >= 0 && right < n && s[left] == s[right]) {
        count++;
        left--;
        right++;
      }
    }
    return count;
  }
}
