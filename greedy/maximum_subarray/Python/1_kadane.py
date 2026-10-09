from typing import List


class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        best = nums[0]
        current = 0
        for num in nums:
            # Either extend the running subarray or restart at this number.
            current = max(num, current + num)
            best = max(best, current)
        return best
