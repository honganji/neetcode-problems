from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)
        memo = {}

        def dfs(i: int, prev_robbed: bool, first_robbed: bool) -> int:
            # Best money from house i onward.
            # prev_robbed: was house i-1 robbed? (can't rob two in a row)
            # first_robbed: was house 0 robbed? (house n-1 is its neighbour)
            if i == n:
                return 0
            key = (i, prev_robbed, first_robbed)
            if key in memo:
                return memo[key]

            best = dfs(i + 1, False, first_robbed)  # skip house i
            blocked_by_first = i == n - 1 and first_robbed
            if not prev_robbed and not blocked_by_first:
                best = max(best, nums[i] + dfs(i + 1, True, first_robbed))

            memo[key] = best
            return best

        # Decide house 0 up front, then let the recursion handle the rest.
        return max(dfs(1, False, False), nums[0] + dfs(1, True, True))
