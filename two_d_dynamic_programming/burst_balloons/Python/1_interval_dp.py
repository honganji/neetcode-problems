from typing import List


class Solution:
    def maxCoins(self, nums: List[int]) -> int:
        # Pad with 1s so edge balloons have a neighbor on each side.
        arr = [1] + nums + [1]
        n = len(nums)
        # dp[l][r] = max coins from bursting every balloon in arr[l..r],
        # with arr[l-1] and arr[r+1] left alive as the boundaries.
        dp = [[0] * (n + 2) for _ in range(n + 2)]

        for length in range(1, n + 1):
            for l in range(1, n - length + 2):
                r = l + length - 1
                best = 0
                # k is the last balloon burst in [l, r]; its neighbors are the boundaries.
                for k in range(l, r + 1):
                    coins = arr[l - 1] * arr[k] * arr[r + 1]
                    best = max(best, dp[l][k - 1] + coins + dp[k + 1][r])
                dp[l][r] = best

        return dp[1][n]
