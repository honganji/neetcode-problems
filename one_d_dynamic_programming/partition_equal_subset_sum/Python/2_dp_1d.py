from typing import List


class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        total = sum(nums)
        if total % 2:
            return False
        target = total // 2

        # dp[s] is True when some subset adds up to exactly s.
        dp = [False] * (target + 1)
        dp[0] = True
        for num in nums:
            # Go backwards so each number is used at most once.
            for s in range(target, num - 1, -1):
                dp[s] = dp[s] or dp[s - num]

        return dp[target]
