def max_profit(prices: list[int]) -> int:
    left, right = 0, 1
    best = 0
    while right < len(prices):
        if prices[right] < prices[left]:
            left = right
        else:
            best = max(best, prices[right] - prices[left])
        right += 1
    return best
