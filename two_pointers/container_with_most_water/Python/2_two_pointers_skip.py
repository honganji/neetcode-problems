def max_area(height: list[int]) -> int:
    left, right = 0, len(height) - 1
    best = 0
    while left < right:
        shorter = min(height[left], height[right])
        area = shorter * (right - left)
        if area > best:
            best = area
        while left < right and height[left] <= shorter:
            left += 1
        while left < right and height[right] <= shorter:
            right -= 1
    return best
