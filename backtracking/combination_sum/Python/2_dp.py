def combination_sum(candidates: list[int], target: int) -> list[list[int]]:
    # dp[s] = every combination that adds up to s, using the candidates seen so far
    dp = [[] for _ in range(target + 1)]
    dp[0] = [[]]
    for c in candidates:
        for s in range(c, target + 1):  # going up lets c be reused
            for combo in dp[s - c]:
                dp[s].append(combo + [c])
    return dp[target]
