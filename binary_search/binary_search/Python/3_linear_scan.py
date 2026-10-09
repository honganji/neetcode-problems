def search(nums: list[int], target: int) -> int:
    for i, num in enumerate(nums):
        if num == target:
            return i
        if num > target:
            return -1
    return -1
