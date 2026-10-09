class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    final n = candidates.length;
    final seen = <String>{};
    final result = <List<int>>[];

    // Each mask is one subset: bit i set means candidates[i] is used
    for (var mask = 1; mask < (1 << n); mask++) {
      final combo = <int>[];
      var total = 0;
      for (var i = 0; i < n; i++) {
        if (((mask >> i) & 1) == 1) {
          combo.add(candidates[i]);
          total += candidates[i];
        }
      }
      if (total != target) continue;
      combo.sort();
      if (seen.add(combo.join(','))) result.add(combo);
    }
    return result;
  }
}
