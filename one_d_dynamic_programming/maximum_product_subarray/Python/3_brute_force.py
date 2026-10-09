from typing import List


class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        # Try every subarray by fixing a start and extending the end.
        best = nums[0]
        for i in range(len(nums)):
            product = 1
            for j in range(i, len(nums)):
                product *= nums[j]
                best = max(best, product)
        return best
