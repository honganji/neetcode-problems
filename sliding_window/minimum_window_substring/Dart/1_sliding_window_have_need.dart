String minWindow(String s, String t) {
  if (t.isEmpty || t.length > s.length) return '';
  final need = List<int>.filled(128, 0);
  var required = 0;
  for (final code in t.codeUnits) {
    if (need[code] == 0) required++;
    need[code]++;
  }
  final window = List<int>.filled(128, 0);
  var have = 0;
  var bestStart = 0;
  var bestLen = s.length + 1;
  var left = 0;
  final codes = s.codeUnits;
  for (var right = 0; right < codes.length; right++) {
    final code = codes[right];
    window[code]++;
    if (need[code] > 0 && window[code] == need[code]) have++;
    while (have == required) {
      if (right - left + 1 < bestLen) {
        bestStart = left;
        bestLen = right - left + 1;
      }
      final out = codes[left];
      window[out]--;
      if (need[out] > 0 && window[out] < need[out]) have--;
      left++;
    }
  }
  return bestLen > s.length ? '' : s.substring(bestStart, bestStart + bestLen);
}
