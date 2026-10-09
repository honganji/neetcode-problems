class Solution {
  bool canPartition(List<int> nums) {
    final total = nums.fold<int>(0, (sum, n) => sum + n);
    if (total.isOdd) return false;
    final target = total ~/ 2;

    // dp[s] is true when some subset adds up to exactly s.
    final dp = List<bool>.filled(target + 1, false);
    dp[0] = true;
    for (final num in nums) {
      // Go backwards so each number is used at most once.
      for (var s = target; s >= num; s--) {
        dp[s] = dp[s] || dp[s - num];
      }
    }

    return dp[target];
  }
}
