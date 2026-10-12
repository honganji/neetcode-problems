def spiral_order(matrix: list[list[int]]) -> list[int]:
    m, n = len(matrix), len(matrix[0])
    visited = [[False] * n for _ in range(m)]
    # Right, down, left, up.
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    result = []
    row, col, d = 0, 0, 0
    for _ in range(m * n):
        result.append(matrix[row][col])
        visited[row][col] = True
        next_row, next_col = row + directions[d][0], col + directions[d][1]
        # Turn clockwise when the next cell is off the grid or already used.
        if not (0 <= next_row < m and 0 <= next_col < n) or visited[next_row][next_col]:
            d = (d + 1) % 4
            next_row, next_col = row + directions[d][0], col + directions[d][1]
        row, col = next_row, next_col
    return result
