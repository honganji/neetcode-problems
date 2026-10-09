int longestCommonSubsequence(String text1, String text2) {
  // For each letter, the positions where it appears in text2, in order.
  final positions = <String, List<int>>{};
  for (var j = 0; j < text2.length; j++) {
    positions.putIfAbsent(text2[j], () => []).add(j);
  }

  // tails[k] = smallest end position in text2 of a common chain of length k + 1.
  final tails = <int>[];
  for (final c in text1.split('')) {
    final matches = positions[c];
    if (matches == null) continue;
    // Right to left, so one letter of text1 can't be used twice in one chain.
    for (var k = matches.length - 1; k >= 0; k--) {
      final j = matches[k];
      // Binary search for the first tail that is >= j.
      var lo = 0;
      var hi = tails.length;
      while (lo < hi) {
        final mid = (lo + hi) ~/ 2;
        if (tails[mid] < j) {
          lo = mid + 1;
        } else {
          hi = mid;
        }
      }
      if (lo == tails.length) {
        tails.add(j);
      } else {
        tails[lo] = j;
      }
    }
  }
  return tails.length;
}
