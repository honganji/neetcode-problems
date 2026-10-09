def combination_sum(candidates: list[int], target: int) -> list[list[int]]:
    candidates = sorted(candidates)
    result = []
    path = []

    def backtrack(start: int, remaining: int) -> None:
        if remaining == 0:
            result.append(path[:])
            return
        for i in range(start, len(candidates)):
            c = candidates[i]
            if c > remaining:
                # sorted, so every later candidate is too big as well
                break
            path.append(c)
            backtrack(i, remaining - c)  # i (not i + 1) allows reuse
            path.pop()

    backtrack(0, target)
    return result
