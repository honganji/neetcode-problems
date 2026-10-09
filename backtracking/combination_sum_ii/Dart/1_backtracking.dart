class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    candidates.sort();
    final result = <List<int>>[];
    final path = <int>[];

    void backtrack(int start, int remaining) {
      if (remaining == 0) {
        result.add(List.of(path));
        return;
      }
      for (var i = start; i < candidates.length; i++) {
        // Sorted list: once a number is too big, every later one is too
        if (candidates[i] > remaining) break;
        // Same value as the previous one at this depth -> same combinations
        if (i > start && candidates[i] == candidates[i - 1]) continue;
        path.add(candidates[i]);
        backtrack(i + 1, remaining - candidates[i]);
        path.removeLast();
      }
    }

    backtrack(0, target);
    return result;
  }
}
