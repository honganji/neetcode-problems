int numDistinct(String s, String t) {
  final n = s.length;
  var count = 0;
  // Each number from 0 to 2^n - 1 is one choice of positions: bit i set means keep s[i].
  for (var mask = 0; mask < (1 << n); mask++) {
    final picked = StringBuffer();
    for (var i = 0; i < n; i++) {
      if ((mask & (1 << i)) != 0) picked.write(s[i]);
    }
    if (picked.toString() == t) count++;
  }
  return count;
}
