String minWindow(String s, String t) {
  if (t.isEmpty || t.length > s.length) return '';
  final count = List<int>.filled(128, 0);
  for (final code in t.codeUnits) {
    count[code]++;
  }
  var missing = t.length;
  var bestStart = 0;
  var bestLen = s.length + 1;
  var left = 0;
  final codes = s.codeUnits;
  for (var right = 0; right < codes.length; right++) {
    final code = codes[right];
    if (count[code] > 0) missing--;
    count[code]--;
    while (missing == 0) {
      if (right - left + 1 < bestLen) {
        bestStart = left;
        bestLen = right - left + 1;
      }
      final out = codes[left];
      count[out]++;
      if (count[out] > 0) missing++;
      left++;
    }
  }
  return bestLen > s.length ? '' : s.substring(bestStart, bestStart + bestLen);
}
