import sys
from typing import List


class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        # Recursion can go about amount + len(coins) levels deep.
        sys.setrecursionlimit(max(sys.getrecursionlimit(), amount + len(coins) + 100))

        n = len(coins)
        # memo[i][r] = ways to make r using coins[i:], -1 means not computed yet
        memo = [[-1] * (amount + 1) for _ in range(n + 1)]

        def ways(i: int, remaining: int) -> int:
            if remaining == 0:
                return 1
            if i == n:
                return 0
            if memo[i][remaining] != -1:
                return memo[i][remaining]

            total = ways(i + 1, remaining)  # skip coins[i]
            if coins[i] <= remaining:
                total += ways(i, remaining - coins[i])  # use coins[i] again
            memo[i][remaining] = total
            return total

        return ways(0, amount)
