from typing import List


class Solution:
    def canJump(self, nums: List[int]) -> bool:
        # Farthest index we can reach so far
        farthest = 0
        for i, jump in enumerate(nums):
            # Index i is past every reachable index, so it can never be reached
            if i > farthest:
                return False
            farthest = max(farthest, i + jump)
        return True
