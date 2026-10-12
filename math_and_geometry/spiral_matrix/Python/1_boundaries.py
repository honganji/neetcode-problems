def spiral_order(matrix: list[list[int]]) -> list[int]:
    result = []
    top, bottom = 0, len(matrix) - 1
    left, right = 0, len(matrix[0]) - 1
    while top <= bottom and left <= right:
        # Walk the top edge left to right, then drop the top edge inward.
        for col in range(left, right + 1):
            result.append(matrix[top][col])
        top += 1
        # Walk the right edge top to bottom.
        for row in range(top, bottom + 1):
            result.append(matrix[row][right])
        right -= 1
        # These two checks stop a single row or column from being walked twice.
        if top <= bottom:
            for col in range(right, left - 1, -1):
                result.append(matrix[bottom][col])
            bottom -= 1
        if left <= right:
            for row in range(bottom, top - 1, -1):
                result.append(matrix[row][left])
            left += 1
    return result
