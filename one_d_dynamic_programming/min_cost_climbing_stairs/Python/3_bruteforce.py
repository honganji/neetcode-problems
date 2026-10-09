def min_cost_climbing_stairs(cost: list[int]) -> int:
    n = len(cost)

    def best(i: int) -> int:
        # Cheapest cost to get from step i to the top (index n).
        if i >= n:
            return 0
        return cost[i] + min(best(i + 1), best(i + 2))

    # We may start on step 0 or step 1.
    return min(best(0), best(1))
