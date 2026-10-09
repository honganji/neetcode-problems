from typing import List


class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        result = 0
        for n in nums:
            result ^= n  # pairs cancel out: a ^ a == 0
        return result
