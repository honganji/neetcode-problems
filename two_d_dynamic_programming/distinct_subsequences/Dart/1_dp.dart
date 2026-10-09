int numDistinct(String s, String t) {
  final m = t.length;
  // ways[j] = number of ways t[0..j) can be picked out of the part of s read so far.
  final ways = List<int>.filled(m + 1, 0);
  ways[0] = 1; // the empty prefix can always be formed in exactly one way
  for (final ch in s.codeUnits) {
    // Go backwards so one character of s is never used twice in the same step.
    for (var j = m; j >= 1; j--) {
      if (t.codeUnitAt(j - 1) == ch) {
        ways[j] += ways[j - 1];
      }
    }
  }
  return ways[m];
}
