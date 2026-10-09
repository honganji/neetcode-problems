int characterReplacement(String s, int k) {
  final counts = List<int>.filled(26, 0);
  final base = 'A'.codeUnitAt(0);
  var maxFreq = 0;
  var left = 0;
  var best = 0;
  for (var right = 0; right < s.length; right++) {
    final idx = s.codeUnitAt(right) - base;
    counts[idx]++;
    if (counts[idx] > maxFreq) {
      maxFreq = counts[idx];
    }
    if (right - left + 1 - maxFreq > k) {
      counts[s.codeUnitAt(left) - base]--;
      left++;
    }
    if (right - left + 1 > best) {
      best = right - left + 1;
    }
  }
  return best;
}
