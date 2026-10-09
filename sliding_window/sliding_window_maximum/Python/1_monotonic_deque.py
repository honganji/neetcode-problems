from collections import deque


def max_sliding_window(nums: list[int], k: int) -> list[int]:
    result = []
    window = deque()
    for i, num in enumerate(nums):
        while window and nums[window[-1]] <= num:
            window.pop()
        window.append(i)
        if window[0] <= i - k:
            window.popleft()
        if i >= k - 1:
            result.append(nums[window[0]])
    return result
