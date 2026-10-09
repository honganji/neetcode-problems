from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)
        if n == 1:
            return nums[0]

        best = 0
        # Each bit of mask says whether that house is robbed (2^n possible sets).
        for mask in range(1 << n):
            # Reject the set if two neighbours on the circle are both robbed.
            if any((mask >> i) & 1 and (mask >> ((i + 1) % n)) & 1 for i in range(n)):
                continue
            total = sum(nums[i] for i in range(n) if (mask >> i) & 1)
            best = max(best, total)
        return best
