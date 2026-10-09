from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        if len(nums) == 1:
            return nums[0]
        # Breaking the circle at either end leaves a straight line of houses.
        # Robbing the first house means skipping the last, and vice versa.
        return max(
            self._rob_range(nums, 0, len(nums) - 2),
            self._rob_range(nums, 1, len(nums) - 1),
        )

    def _rob_range(self, nums: List[int], start: int, end: int) -> int:
        # Classic "House Robber" on a straight line, using two rolling values.
        prev2 = 0  # best total up to two houses back
        prev1 = 0  # best total up to one house back
        for i in range(start, end + 1):
            prev2, prev1 = prev1, max(prev1, prev2 + nums[i])
        return prev1
