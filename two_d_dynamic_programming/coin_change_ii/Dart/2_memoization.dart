class Solution {
  int change(int amount, List<int> coins) {
    final n = coins.length;
    // memo[i][r] = ways to make r using coins[i:], -1 means not computed yet
    final memo = List.generate(n + 1, (_) => List<int>.filled(amount + 1, -1));

    int ways(int i, int remaining) {
      if (remaining == 0) return 1;
      if (i == n) return 0;
      if (memo[i][remaining] != -1) return memo[i][remaining];

      var total = ways(i + 1, remaining); // skip coins[i]
      if (coins[i] <= remaining) {
        total += ways(i, remaining - coins[i]); // use coins[i] again
      }
      memo[i][remaining] = total;
      return total;
    }

    return ways(0, amount);
  }
}
