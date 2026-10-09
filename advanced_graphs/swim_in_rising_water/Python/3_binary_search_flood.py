from typing import List

DIRS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def swimInWater(grid: List[List[int]]) -> int:
    n = len(grid)

    def reachable(limit: int) -> bool:
        # Flood fill from the top-left, using only cells at or below the limit.
        if grid[0][0] > limit:
            return False
        seen = [[False] * n for _ in range(n)]
        seen[0][0] = True
        stack = [(0, 0)]
        while stack:
            r, c = stack.pop()
            if (r, c) == (n - 1, n - 1):
                return True
            for dr, dc in DIRS:
                nr, nc = r + dr, c + dc
                if 0 <= nr < n and 0 <= nc < n and not seen[nr][nc] and grid[nr][nc] <= limit:
                    seen[nr][nc] = True
                    stack.append((nr, nc))
        return False

    # reachable() only gets easier as the limit grows, so binary search for the first True.
    lo, hi = grid[0][0], n * n - 1
    while lo < hi:
        mid = (lo + hi) // 2
        if reachable(mid):
            hi = mid
        else:
            lo = mid + 1
    return lo
