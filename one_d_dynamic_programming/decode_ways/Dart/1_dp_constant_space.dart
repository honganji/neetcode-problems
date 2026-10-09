class Solution {
  int numDecodings(String s) {
    final n = s.length;
    // ways[i] = number of ways to decode s[i:].
    // Only the two most recent values are needed, so keep just those.
    var after = 1; // ways[i + 1], starts as ways[n] = 1 (empty suffix)
    var afterNext = 0; // ways[i + 2]

    for (var i = n - 1; i >= 0; i--) {
      var ways = 0;
      if (s[i] != '0') {
        // Decode s[i] as a single letter.
        ways = after;
        // Or decode s[i:i+2] as a pair, if it is 10..26.
        if (i + 1 < n) {
          final pair = (s.codeUnitAt(i) - 48) * 10 + (s.codeUnitAt(i + 1) - 48);
          if (pair >= 10 && pair <= 26) {
            ways += afterNext;
          }
        }
      }
      afterNext = after;
      after = ways;
    }

    return after;
  }
}
