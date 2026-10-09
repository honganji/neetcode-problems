from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        # rob_prev: best total using the houses before the last one
        # rob_last: best total using all houses seen so far
        rob_prev, rob_last = 0, 0
        for money in nums:
            # either skip this house, or rob it and add it to rob_prev
            rob_prev, rob_last = rob_last, max(rob_last, rob_prev + money)
        return rob_last
