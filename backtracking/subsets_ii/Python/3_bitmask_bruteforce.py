def subsets_with_dup(nums: list[int]) -> list[list[int]]:
    n = len(nums)
    seen: set[tuple[int, ...]] = set()
    result: list[list[int]] = []

    # Every bit pattern is one candidate subset.
    for mask in range(1 << n):
        subset = [nums[i] for i in range(n) if mask & (1 << i)]
        # Sorting makes [1, 2] and [2, 1] the same key.
        key = tuple(sorted(subset))
        if key not in seen:
            seen.add(key)
            result.append(list(key))

    return result
