from typing import List


class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        # Scan left-to-right and right-to-left, keeping running products.
        # A zero resets the running product, starting a fresh zero-free block.
        n = len(nums)
        best = nums[0]
        prefix = suffix = 1
        for i in range(n):
            prefix *= nums[i]
            suffix *= nums[n - 1 - i]
            best = max(best, prefix, suffix)
            if prefix == 0:
                prefix = 1
            if suffix == 0:
                suffix = 1
        return best
