def find_min(nums: list[int]) -> int:
    left, right = 0, len(nums) - 1
    result = nums[0]
    while left <= right:
        if nums[left] <= nums[right]:
            result = min(result, nums[left])
            break
        mid = (left + right) // 2
        result = min(result, nums[mid])
        if nums[mid] >= nums[left]:
            left = mid + 1
        else:
            right = mid - 1
    return result
