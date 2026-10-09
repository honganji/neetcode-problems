import sys
from typing import List


class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        # Recursion can go about amount + len(coins) levels deep.
        sys.setrecursionlimit(max(sys.getrecursionlimit(), amount + len(coins) + 100))

        def count(i: int, remaining: int) -> int:
            if remaining < 0:
                return 0
            if remaining == 0:
                return 1
            if i == len(coins):
                return 0
            # Either skip coins[i], or use it once and keep considering it.
            return count(i + 1, remaining) + count(i, remaining - coins[i])

        return count(0, amount)
