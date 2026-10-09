List<List<int>> combinationSum(List<int> candidates, int target) {
  // dp[s] = every combination that adds up to s, using the candidates seen so far
  final dp = List.generate(target + 1, (_) => <List<int>>[]);
  dp[0].add(<int>[]);
  for (final c in candidates) {
    for (var s = c; s <= target; s++) {
      // going up lets c be reused
      for (final combo in dp[s - c]) {
        dp[s].add([...combo, c]);
      }
    }
  }
  return dp[target];
}
