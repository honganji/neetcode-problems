def largest_rectangle_area(heights: list[int]) -> int:
    def solve(left: int, right: int) -> int:
        if left > right:
            return 0
        min_index = left
        for i in range(left + 1, right + 1):
            if heights[i] < heights[min_index]:
                min_index = i
        return max(
            heights[min_index] * (right - left + 1),
            solve(left, min_index - 1),
            solve(min_index + 1, right),
        )

    return solve(0, len(heights) - 1)
