class Solution {
  int change(int amount, List<int> coins) {
    final dp = List<int>.filled(amount + 1, 0);
    dp[0] = 1; // one way to make 0: use no coins

    for (final coin in coins) {
      // Counting upward lets a coin be reused as many times as needed.
      for (var a = coin; a <= amount; a++) {
        dp[a] += dp[a - coin];
      }
    }
    return dp[amount];
  }
}
