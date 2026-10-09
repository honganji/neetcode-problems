from typing import List


class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        # 0..n should add up to n(n+1)/2; the gap to the actual sum is the missing number.
        n = len(nums)
        return n * (n + 1) // 2 - sum(nums)
