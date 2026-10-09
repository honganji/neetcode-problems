def combination_sum(candidates: list[int], target: int) -> list[list[int]]:
    n = len(candidates)
    # how many copies of each candidate we may try: 0 .. target // candidate
    limits = [target // c for c in candidates]
    counts = [0] * n
    result = []

    while True:
        total = sum(c * k for c, k in zip(candidates, counts))
        if total == target:
            result.append([c for c, k in zip(candidates, counts) for _ in range(k)])

        # advance the counts like an odometer
        j = 0
        while j < n and counts[j] == limits[j]:
            counts[j] = 0
            j += 1
        if j == n:
            break
        counts[j] += 1

    return result
