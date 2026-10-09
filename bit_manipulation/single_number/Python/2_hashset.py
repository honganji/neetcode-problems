from typing import List


class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        seen = set()
        for n in nums:
            if n in seen:
                seen.remove(n)  # second copy found: the pair is complete
            else:
                seen.add(n)  # first copy: remember it
        return seen.pop()  # only the unpaired number is left
