from typing import List


class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        candidates.sort()
        # dp[s] = set of distinct combinations (sorted tuples) that sum to s
        dp = [set() for _ in range(target + 1)]
        dp[0].add(())
        for x in candidates:
            # Go downward so each candidate is used at most once
            for s in range(target, x - 1, -1):
                for combo in dp[s - x]:
                    dp[s].add(combo + (x,))
        return [list(combo) for combo in dp[target]]
