def max_profit(prices: list[int]) -> int:
    min_price = prices[0]
    best = 0
    for price in prices:
        if price < min_price:
            min_price = price
        else:
            best = max(best, price - min_price)
    return best
