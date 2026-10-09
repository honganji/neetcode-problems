int characterReplacement(String s, int k) {
  final base = 'A'.codeUnitAt(0);
  var best = 0;
  for (var start = 0; start < s.length; start++) {
    final counts = List<int>.filled(26, 0);
    var maxCount = 0;
    for (var end = start; end < s.length; end++) {
      final idx = s.codeUnitAt(end) - base;
      counts[idx]++;
      if (counts[idx] > maxCount) {
        maxCount = counts[idx];
      }
      if (end - start + 1 - maxCount > k) {
        break;
      }
      if (end - start + 1 > best) {
        best = end - start + 1;
      }
    }
  }
  return best;
}
