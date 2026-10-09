def coin_change(coins: list[int], amount: int) -> int:
    # dp[a] = fewest coins that make amount a (INF = not reachable yet)
    INF = amount + 1
    dp = [0] + [INF] * amount
    for a in range(1, amount + 1):
        for c in coins:
            if c <= a:
                dp[a] = min(dp[a], dp[a - c] + 1)
    return -1 if dp[amount] == INF else dp[amount]
