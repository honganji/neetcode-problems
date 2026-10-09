String minWindow(String s, String t) {
  if (t.isEmpty || t.length > s.length) return '';
  final need = List<int>.filled(128, 0);
  for (final code in t.codeUnits) {
    need[code]++;
  }
  final codes = s.codeUnits;
  var bestStart = 0;
  var bestLen = s.length + 1;
  for (var start = 0; start < codes.length; start++) {
    if (codes.length - start < t.length) break;
    final count = List<int>.of(need);
    var missing = t.length;
    for (var end = start; end < codes.length; end++) {
      if (end - start + 1 >= bestLen) break;
      final code = codes[end];
      if (count[code] > 0) missing--;
      count[code]--;
      if (missing == 0) {
        bestStart = start;
        bestLen = end - start + 1;
        break;
      }
    }
  }
  return bestLen > s.length ? '' : s.substring(bestStart, bestStart + bestLen);
}
