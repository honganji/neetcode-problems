import bisect
from typing import List


class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # tails[k] = smallest value that can end an increasing subsequence of length k + 1.
        # tails is always sorted, so bisect can search it.
        tails: List[int] = []
        for x in nums:
            i = bisect.bisect_left(tails, x)  # first index with tails[i] >= x
            if i == len(tails):
                tails.append(x)  # x extends the longest subsequence so far
            else:
                tails[i] = x  # x makes a smaller tail for this length
        return len(tails)
