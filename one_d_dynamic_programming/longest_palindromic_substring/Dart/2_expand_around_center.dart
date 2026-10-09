class Solution {
  String longestPalindrome(String s) {
    var start = 0, best = 0;
    for (var center = 0; center < s.length; center++) {
      // Odd-length palindromes center on a character, even-length on a gap.
      for (final offset in [0, 1]) {
        var left = center, right = center + offset;
        while (left >= 0 && right < s.length && s[left] == s[right]) {
          left--;
          right++;
        }
        // s[left + 1 .. right - 1] is the palindrome found from this center.
        final length = right - left - 1;
        if (length > best) {
          best = length;
          start = left + 1;
        }
      }
    }
    return s.substring(start, start + best);
  }
}
