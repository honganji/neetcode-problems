int lengthOfLongestSubstring(String s) {
  final codes = s.codeUnits;
  final lastIndex = <int, int>{};
  var left = 0;
  var best = 0;
  for (var right = 0; right < codes.length; right++) {
    final prev = lastIndex[codes[right]];
    if (prev != null && prev >= left) {
      left = prev + 1;
    }
    lastIndex[codes[right]] = right;
    if (right - left + 1 > best) {
      best = right - left + 1;
    }
  }
  return best;
}
