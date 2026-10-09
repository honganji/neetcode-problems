def search(nums: list[int], target: int) -> int:
    def helper(low: int, high: int) -> int:
        if low > high:
            return -1
        mid = low + (high - low) // 2
        if nums[mid] == target:
            return mid
        if nums[mid] < target:
            return helper(mid + 1, high)
        return helper(low, mid - 1)

    return helper(0, len(nums) - 1)
