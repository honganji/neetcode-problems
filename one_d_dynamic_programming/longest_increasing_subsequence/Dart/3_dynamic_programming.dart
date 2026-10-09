class Solution {
  int lengthOfLIS(List<int> nums) {
    final n = nums.length;
    // dp[i] = length of the longest increasing subsequence ending at nums[i].
    final dp = List<int>.filled(n, 1);

    var best = 0;
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < i; j++) {
        if (nums[j] < nums[i] && dp[j] + 1 > dp[i]) {
          dp[i] = dp[j] + 1;
        }
      }
      if (dp[i] > best) best = dp[i];
    }
    return best;
  }
}
