import sys


def longest_increasing_path(matrix: list[list[int]]) -> int:
    rows, cols = len(matrix), len(matrix[0])
    # A path can snake through every cell, so the recursion may go mn deep.
    sys.setrecursionlimit(max(sys.getrecursionlimit(), rows * cols + 100))
    directions = ((1, 0), (-1, 0), (0, 1), (0, -1))
    # memo[r][c] = longest increasing path that starts at (r, c); 0 means not computed yet.
    memo = [[0] * cols for _ in range(rows)]

    def dfs(r: int, c: int) -> int:
        if memo[r][c]:
            return memo[r][c]
        best = 1
        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if 0 <= nr < rows and 0 <= nc < cols and matrix[nr][nc] > matrix[r][c]:
                best = max(best, 1 + dfs(nr, nc))
        memo[r][c] = best
        return best

    return max(dfs(r, c) for r in range(rows) for c in range(cols))
