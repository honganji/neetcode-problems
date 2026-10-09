List<List<int>> combinationSum(List<int> candidates, int target) {
  final sorted = List<int>.of(candidates)..sort();
  final result = <List<int>>[];
  final path = <int>[];

  void backtrack(int start, int remaining) {
    if (remaining == 0) {
      result.add(List<int>.of(path));
      return;
    }
    for (var i = start; i < sorted.length; i++) {
      final c = sorted[i];
      if (c > remaining) break; // sorted, so every later candidate is too big too
      path.add(c);
      backtrack(i, remaining - c); // i (not i + 1) allows reuse
      path.removeLast();
    }
  }

  backtrack(0, target);
  return result;
}
