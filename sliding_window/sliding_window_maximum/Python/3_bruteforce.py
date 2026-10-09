def max_sliding_window(nums: list[int], k: int) -> list[int]:
    result = []
    for i in range(len(nums) - k + 1):
        result.append(max(nums[i:i + k]))
    return result
