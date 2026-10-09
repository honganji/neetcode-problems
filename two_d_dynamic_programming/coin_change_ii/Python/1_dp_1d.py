from typing import List


class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        dp = [0] * (amount + 1)
        dp[0] = 1  # one way to make 0: use no coins

        for coin in coins:
            # Counting upward lets a coin be reused as many times as needed.
            for a in range(coin, amount + 1):
                dp[a] += dp[a - coin]
        return dp[amount]
