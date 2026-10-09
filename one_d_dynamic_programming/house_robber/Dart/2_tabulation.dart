import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    final n = nums.length;
    // dp[i] = best total using the first i houses
    final dp = List<int>.filled(n + 1, 0);
    for (var i = 1; i <= n; i++) {
      final take = nums[i - 1] + (i >= 2 ? dp[i - 2] : 0);
      dp[i] = max(dp[i - 1], take);
    }
    return dp[n];
  }
}
