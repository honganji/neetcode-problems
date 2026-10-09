class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    candidates.sort();
    // sums[s] = distinct combinations (sorted) that add up to s
    final sums = List.generate(target + 1, (_) => <List<int>>[]);
    // keys[s] remembers what is already stored, to drop duplicates
    final keys = List.generate(target + 1, (_) => <String>{});
    sums[0].add([]);
    keys[0].add('');

    for (final x in candidates) {
      // Go downward so each candidate is used at most once
      for (var s = target; s >= x; s--) {
        for (final combo in sums[s - x]) {
          final next = [...combo, x];
          if (keys[s].add(next.join(','))) sums[s].add(next);
        }
      }
    }
    return sums[target];
  }
}
