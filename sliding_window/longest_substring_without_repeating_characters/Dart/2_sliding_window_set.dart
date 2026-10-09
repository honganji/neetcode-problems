int lengthOfLongestSubstring(String s) {
  final codes = s.codeUnits;
  final window = <int>{};
  var left = 0;
  var best = 0;
  for (var right = 0; right < codes.length; right++) {
    while (window.contains(codes[right])) {
      window.remove(codes[left]);
      left++;
    }
    window.add(codes[right]);
    if (right - left + 1 > best) {
      best = right - left + 1;
    }
  }
  return best;
}
