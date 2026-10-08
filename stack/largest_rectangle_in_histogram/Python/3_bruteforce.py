def largest_rectangle_area(heights: list[int]) -> int:
    best = 0
    for i in range(len(heights)):
        left = i
        while left > 0 and heights[left - 1] >= heights[i]:
            left -= 1
        right = i
        while right < len(heights) - 1 and heights[right + 1] >= heights[i]:
            right += 1
        best = max(best, heights[i] * (right - left + 1))
    return best
