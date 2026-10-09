class Solution {
  int maxCoins(List<int> nums) {
    final n = nums.length;
    // Pad with 1s so edge balloons have a neighbor on each side.
    final arr = [1, ...nums, 1];
    // dp[l][r] = max coins from bursting every balloon in arr[l..r],
    // with arr[l-1] and arr[r+1] left alive as the boundaries.
    final dp = List.generate(n + 2, (_) => List<int>.filled(n + 2, 0));

    for (var length = 1; length <= n; length++) {
      for (var l = 1; l + length - 1 <= n; l++) {
        final r = l + length - 1;
        var best = 0;
        // k is the last balloon burst in [l, r]; its neighbors are the boundaries.
        for (var k = l; k <= r; k++) {
          final coins = arr[l - 1] * arr[k] * arr[r + 1];
          final total = dp[l][k - 1] + coins + dp[k + 1][r];
          if (total > best) best = total;
        }
        dp[l][r] = best;
      }
    }

    return dp[1][n];
  }
}
