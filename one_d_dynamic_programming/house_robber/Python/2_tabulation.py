from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)
        # dp[i] = best total using the first i houses
        dp = [0] * (n + 1)
        for i in range(1, n + 1):
            skip = dp[i - 1]
            take = nums[i - 1] + (dp[i - 2] if i >= 2 else 0)
            dp[i] = max(skip, take)
        return dp[n]
