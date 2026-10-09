import 'dart:math';

class Solution {
  String longestPalindrome(String s) {
    // Interleave '#' so every palindrome has odd length ("aba" -> "#a#b#a#").
    final t = '#${s.split('').join('#')}#';
    final n = t.length;

    // p[i]: radius of the palindrome centered at t[i] (in t, not in s).
    final p = List<int>.filled(n, 0);
    var center = 0, right = 0; // the palindrome reaching furthest right so far
    var bestCenter = 0;
    for (var i = 0; i < n; i++) {
      if (i < right) {
        // Start from the mirror image's radius, capped at the known box.
        p[i] = min(right - i, p[2 * center - i]);
      }
      while (i - p[i] - 1 >= 0 &&
          i + p[i] + 1 < n &&
          t[i - p[i] - 1] == t[i + p[i] + 1]) {
        p[i]++;
      }
      if (i + p[i] > right) {
        center = i;
        right = i + p[i];
      }
      if (p[i] > p[bestCenter]) bestCenter = i;
    }

    final start = (bestCenter - p[bestCenter]) ~/ 2;
    return s.substring(start, start + p[bestCenter]);
  }
}
