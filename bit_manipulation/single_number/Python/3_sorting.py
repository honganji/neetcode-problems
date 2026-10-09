from typing import List


class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        nums = sorted(nums)  # sorted copy, equal numbers become neighbors
        i = 0
        while i < len(nums) - 1:
            if nums[i] != nums[i + 1]:
                return nums[i]
            i += 2  # skip the matching pair
        return nums[-1]  # the single number is at the end
