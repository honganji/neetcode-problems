int coinChange(List<int> coins, int amount) {
  // dp[a] = fewest coins that make amount a (inf = not reachable yet)
  final inf = amount + 1;
  final dp = List<int>.filled(amount + 1, inf);
  dp[0] = 0;
  for (var a = 1; a <= amount; a++) {
    for (final c in coins) {
      if (c <= a && dp[a - c] + 1 < dp[a]) dp[a] = dp[a - c] + 1;
    }
  }
  return dp[amount] == inf ? -1 : dp[amount];
}
