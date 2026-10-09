def min_cost_climbing_stairs(cost: list[int]) -> int:
    n = len(cost)
    memo = [-1] * n  # -1 means "not computed yet"

    def best(i: int) -> int:
        # Cheapest cost to get from step i to the top (index n).
        if i >= n:
            return 0
        if memo[i] == -1:
            memo[i] = cost[i] + min(best(i + 2), best(i + 1))
        return memo[i]

    # We may start on step 0 or step 1.
    return min(best(0), best(1))
