import 'dart:math';

class Solution {
  int countSubstrings(String s) {
    final n = s.length;

    // d1[i]: how many odd-length palindromes are centered at s[i].
    final d1 = List<int>.filled(n, 0);
    var l = 0;
    var r = -1; // rightmost palindrome found so far is s[l..r]
    for (var i = 0; i < n; i++) {
      // Reuse the mirror image inside the known palindrome when possible.
      var k = i > r ? 1 : min(d1[l + r - i], r - i + 1);
      while (i - k >= 0 && i + k < n && s[i - k] == s[i + k]) {
        k++;
      }
      d1[i] = k;
      if (i + k - 1 > r) {
        l = i - k + 1;
        r = i + k - 1;
      }
    }

    // d2[i]: how many even-length palindromes sit between s[i-1] and s[i].
    final d2 = List<int>.filled(n, 0);
    l = 0;
    r = -1;
    for (var i = 0; i < n; i++) {
      var k = i > r ? 0 : min(d2[l + r - i + 1], r - i + 1);
      while (i - k - 1 >= 0 && i + k < n && s[i - k - 1] == s[i + k]) {
        k++;
      }
      d2[i] = k;
      if (i + k - 1 > r) {
        l = i - k;
        r = i + k - 1;
      }
    }

    return d1.fold(0, (a, b) => a + b) + d2.fold(0, (a, b) => a + b);
  }
}
