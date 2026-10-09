from typing import List

DIRS = ((1, 0), (-1, 0), (0, 1), (0, -1))


class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        minutes = 0

        while True:
            # Find fresh oranges next to a rotten one. Rot them after the scan so
            # an orange that rots this minute can't spread again in the same minute.
            to_rot = []
            for r in range(rows):
                for c in range(cols):
                    if grid[r][c] == 1 and any(
                        0 <= r + dr < rows and 0 <= c + dc < cols and grid[r + dr][c + dc] == 2
                        for dr, dc in DIRS
                    ):
                        to_rot.append((r, c))

            if not to_rot:
                break

            for r, c in to_rot:
                grid[r][c] = 2
            minutes += 1

        has_fresh = any(1 in row for row in grid)
        return -1 if has_fresh else minutes
