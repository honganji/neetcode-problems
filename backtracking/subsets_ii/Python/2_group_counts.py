from collections import Counter


def subsets_with_dup(nums: list[int]) -> list[list[int]]:
    # For each distinct value, a subset takes 0, 1, ..., count copies of it.
    counts = sorted(Counter(nums).items())
    result: list[list[int]] = [[]]

    for value, count in counts:
        result = [subset + [value] * k for subset in result for k in range(count + 1)]

    return result
