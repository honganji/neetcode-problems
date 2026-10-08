def two_sum(nums: list[int], target: int) -> list[int]:
    indexed = sorted(range(len(nums)), key=lambda i: nums[i])
    left, right = 0, len(nums) - 1
    while left < right:
        total = nums[indexed[left]] + nums[indexed[right]]
        if total == target:
            return [indexed[left], indexed[right]]
        if total < target:
            left += 1
        else:
            right -= 1
    return []
