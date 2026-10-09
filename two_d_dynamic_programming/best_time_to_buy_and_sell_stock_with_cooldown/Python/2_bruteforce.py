from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)

        def explore(day: int, holding: bool, cooling: bool) -> int:
            # Best profit from this day onward, given whether we hold a share and
            # whether yesterday was a sell (which blocks buying today).
            if day == n:
                return 0  # an unsold share at the end is never better than not buying it

            best = explore(day + 1, holding, False)  # do nothing today

            if holding:
                best = max(best, prices[day] + explore(day + 1, False, True))  # sell
            elif not cooling:
                best = max(best, -prices[day] + explore(day + 1, True, False))  # buy

            return best

        return explore(0, False, False)
