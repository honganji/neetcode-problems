from collections import deque
from typing import List

DIRS = ((1, 0), (-1, 0), (0, 1), (0, -1))


class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        worst = 0

        # Each fresh orange needs as long as its nearest rotten orange is away.
        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 1:
                    d = self._minutes_to_nearest_rotten(grid, r, c)
                    if d == -1:
                        return -1
                    worst = max(worst, d)

        return worst

    def _minutes_to_nearest_rotten(self, grid: List[List[int]], sr: int, sc: int) -> int:
        rows, cols = len(grid), len(grid[0])
        seen = {(sr, sc)}
        queue = deque([(sr, sc, 0)])

        while queue:
            r, c, d = queue.popleft()
            for dr, dc in DIRS:
                nr, nc = r + dr, c + dc
                if not (0 <= nr < rows and 0 <= nc < cols):
                    continue
                if (nr, nc) in seen or grid[nr][nc] == 0:
                    continue
                if grid[nr][nc] == 2:
                    return d + 1
                seen.add((nr, nc))
                queue.append((nr, nc, d + 1))

        return -1
