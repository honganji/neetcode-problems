def subsets(nums: list[int]) -> list[list[int]]:
    result = [[]]
    for num in nums:
        # Each existing subset gets a copy with num added to it.
        result += [subset + [num] for subset in result]
    return result
