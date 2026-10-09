int characterReplacement(String s, int k) {
  final counts = List<int>.filled(26, 0);
  final base = 'A'.codeUnitAt(0);
  var left = 0;
  var best = 0;
  for (var right = 0; right < s.length; right++) {
    counts[s.codeUnitAt(right) - base]++;
    while (right - left + 1 - counts.reduce((a, b) => a > b ? a : b) > k) {
      counts[s.codeUnitAt(left) - base]--;
      left++;
    }
    if (right - left + 1 > best) {
      best = right - left + 1;
    }
  }
  return best;
}
