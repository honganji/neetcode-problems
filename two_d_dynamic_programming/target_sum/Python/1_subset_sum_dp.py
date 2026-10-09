def find_target_sum_ways(nums: list[int], target: int) -> int:
    total = sum(nums)
    # Out of reach, or the parity is wrong: no way to hit the target.
    if abs(target) > total or (total + target) % 2 != 0:
        return 0

    # Numbers given "+" form a group P, the rest get "-":
    # sum(P) - (total - sum(P)) = target, so sum(P) = (total + target) / 2.
    # Counting sign choices is the same as counting subsets with that sum.
    goal = (total + target) // 2
    ways = [0] * (goal + 1)  # ways[s] = number of subsets summing to s
    ways[0] = 1  # the empty subset

    for num in nums:
        # Go downward so each number is used at most once.
        for s in range(goal, num - 1, -1):
            ways[s] += ways[s - num]

    return ways[goal]
