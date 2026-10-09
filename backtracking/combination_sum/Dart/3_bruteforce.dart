List<List<int>> combinationSum(List<int> candidates, int target) {
  final n = candidates.length;
  // how many copies of each candidate we may try: 0 .. target ~/ candidate
  final limits = [for (final c in candidates) target ~/ c];
  final counts = List<int>.filled(n, 0);
  final result = <List<int>>[];

  while (true) {
    var total = 0;
    for (var i = 0; i < n; i++) {
      total += candidates[i] * counts[i];
    }
    if (total == target) {
      final combo = <int>[];
      for (var i = 0; i < n; i++) {
        for (var k = 0; k < counts[i]; k++) {
          combo.add(candidates[i]);
        }
      }
      result.add(combo);
    }

    // advance the counts like an odometer
    var j = 0;
    while (j < n && counts[j] == limits[j]) {
      counts[j] = 0;
      j++;
    }
    if (j == n) break;
    counts[j]++;
  }
  return result;
}
