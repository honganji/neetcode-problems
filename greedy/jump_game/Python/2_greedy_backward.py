from typing import List


class Solution:
    def canJump(self, nums: List[int]) -> bool:
        # Leftmost index known to reach the last index (the last index is the goal)
        last_good = len(nums) - 1
        for i in range(len(nums) - 2, -1, -1):
            # From i we can land on any index up to i + nums[i]
            if i + nums[i] >= last_good:
                last_good = i
        return last_good == 0
