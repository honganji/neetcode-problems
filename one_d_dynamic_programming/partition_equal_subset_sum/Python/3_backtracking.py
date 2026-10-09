from typing import List


class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        total = sum(nums)
        if total % 2:
            return False

        def dfs(i: int, remaining: int) -> bool:
            # Found a subset with the exact target sum.
            if remaining == 0:
                return True
            # Ran out of numbers, or overshot the target.
            if i == len(nums) or remaining < 0:
                return False
            # Try taking nums[i], or skipping it.
            return dfs(i + 1, remaining - nums[i]) or dfs(i + 1, remaining)

        return dfs(0, total // 2)
