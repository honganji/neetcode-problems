def coin_change(coins: list[int], amount: int) -> int:
    def fewest(remaining: int) -> int:
        if remaining == 0:
            return 0
        best = -1
        for c in coins:
            if c <= remaining:
                sub = fewest(remaining - c)
                if sub != -1 and (best == -1 or sub + 1 < best):
                    best = sub + 1
        return best

    return fewest(amount)
