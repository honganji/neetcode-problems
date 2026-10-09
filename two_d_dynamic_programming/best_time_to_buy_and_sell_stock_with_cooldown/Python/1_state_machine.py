from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Each day we are in one of three states, and we track the best profit for each:
        hold = -prices[0]  # holding a share (we paid for it)
        sold = 0           # we sold today, so tomorrow is a cooldown day
        rest = 0           # not holding, and free to buy

        for price in prices[1:]:
            # The right-hand side uses yesterday's values, so all three update together.
            hold, sold, rest = max(hold, rest - price), hold + price, max(rest, sold)

        return max(sold, rest)
