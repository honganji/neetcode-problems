def min_cost_climbing_stairs(cost: list[int]) -> int:
    # next1: cheapest cost to reach the top from the step after the current one.
    # next2: cheapest cost to reach the top from two steps ahead.
    next1 = 0  # the top
    next2 = 0
    for i in range(len(cost) - 1, -1, -1):
        current = cost[i] + min(next1, next2)
        next2 = next1
        next1 = current
    # We may start on step 0 or step 1.
    return min(next1, next2)
