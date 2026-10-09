def longest_increasing_path(matrix: list[list[int]]) -> int:
    rows, cols = len(matrix), len(matrix[0])
    directions = ((1, 0), (-1, 0), (0, 1), (0, -1))

    # Visit cells from smallest to largest value.
    cells = sorted(
        ((r, c) for r in range(rows) for c in range(cols)),
        key=lambda cell: matrix[cell[0]][cell[1]],
    )
    # dp[r][c] = longest increasing path that ends at (r, c).
    dp = [[1] * cols for _ in range(rows)]
    for r, c in cells:
        # Every smaller neighbor was visited earlier, so its dp value is final.
        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if 0 <= nr < rows and 0 <= nc < cols and matrix[nr][nc] < matrix[r][c]:
                dp[r][c] = max(dp[r][c], dp[nr][nc] + 1)
    return max(max(row) for row in dp)
