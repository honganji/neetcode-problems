def search(nums: list[int], target: int) -> int:
    n = len(nums)
    left, right = 0, n - 1
    while left < right:
        mid = (left + right) // 2
        if nums[mid] > nums[right]:
            left = mid + 1
        else:
            right = mid
    pivot = left

    if pivot == 0 or not (nums[0] <= target <= nums[pivot - 1]):
        left, right = pivot, n - 1
    else:
        left, right = 0, pivot - 1

    while left <= right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        if nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1
