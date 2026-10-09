from typing import List


class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        # XOR every index and every value: matching pairs cancel out,
        # leaving only the missing number.
        missing = len(nums)
        for i, num in enumerate(nums):
            missing ^= i ^ num
        return missing
