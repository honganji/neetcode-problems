def subsets(nums: list[int]) -> list[list[int]]:
    n = len(nums)
    result = []
    # Each number from 0 to 2^n - 1 is a yes/no pattern: bit i set means nums[i] is included.
    for mask in range(1 << n):
        subset = []
        for i in range(n):
            if mask & (1 << i):
                subset.append(nums[i])
        result.append(subset)
    return result
