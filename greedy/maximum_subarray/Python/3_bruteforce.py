from typing import List


class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        best = nums[0]
        for start in range(len(nums)):
            total = 0
            # Grow the subarray one element at a time from this start point.
            for end in range(start, len(nums)):
                total += nums[end]
                best = max(best, total)
        return best
