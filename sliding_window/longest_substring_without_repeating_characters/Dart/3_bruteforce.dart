int lengthOfLongestSubstring(String s) {
  final codes = s.codeUnits;
  var best = 0;
  for (var start = 0; start < codes.length; start++) {
    final seen = <int>{};
    for (var end = start; end < codes.length; end++) {
      if (!seen.add(codes[end])) {
        break;
      }
    }
    if (seen.length > best) {
      best = seen.length;
    }
  }
  return best;
}
