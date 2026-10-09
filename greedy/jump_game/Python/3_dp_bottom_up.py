from typing import List


class Solution:
    def canJump(self, nums: List[int]) -> bool:
        n = len(nums)
        # can_reach[i] is True if the last index can be reached from index i
        can_reach = [False] * n
        can_reach[n - 1] = True
        for i in range(n - 2, -1, -1):
            furthest = min(i + nums[i], n - 1)
            for j in range(i + 1, furthest + 1):
                if can_reach[j]:
                    can_reach[i] = True
                    break
        return can_reach[0]
