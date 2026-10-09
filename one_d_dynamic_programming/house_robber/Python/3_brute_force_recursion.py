from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        def try_from(i: int) -> int:
            # best total for houses i onward, recomputed on every call
            if i >= len(nums):
                return 0
            skip = try_from(i + 1)
            take = nums[i] + try_from(i + 2)
            return max(skip, take)

        return try_from(0)
