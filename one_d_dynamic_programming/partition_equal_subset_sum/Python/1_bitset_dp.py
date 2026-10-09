from typing import List


class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        total = sum(nums)
        if total % 2:
            return False
        target = total // 2

        # Bit s is 1 when some subset adds up to sum s.
        # At the start only sum 0 is reachable.
        reachable = 1
        for num in nums:
            # Shifting left by num adds num to every reachable sum at once.
            reachable |= reachable << num

        return bool((reachable >> target) & 1)
