def largest_rectangle_area(heights: list[int]) -> int:
    best = 0
    stack = []
    for i, height in enumerate(heights):
        start = i
        while stack and stack[-1][1] > height:
            index, h = stack.pop()
            best = max(best, h * (i - index))
            start = index
        stack.append((start, height))
    for index, h in stack:
        best = max(best, h * (len(heights) - index))
    return best
