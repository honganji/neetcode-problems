from typing import List


class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # dp[i] = length of the longest increasing subsequence ending at nums[i].
        n = len(nums)
        dp = [1] * n
        for i in range(n):
            for j in range(i):
                if nums[j] < nums[i]:
                    dp[i] = max(dp[i], dp[j] + 1)
        return max(dp, default=0)
