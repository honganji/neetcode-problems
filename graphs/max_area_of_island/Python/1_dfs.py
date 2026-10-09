from typing import List


class Solution:
    def maxAreaOfIsland(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        best = 0

        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 0:
                    continue
                # Sink the first land cell we meet so it is never counted again.
                grid[r][c] = 0
                stack = [(r, c)]
                area = 0
                while stack:
                    cr, cc = stack.pop()
                    area += 1
                    for nr, nc in ((cr + 1, cc), (cr - 1, cc), (cr, cc + 1), (cr, cc - 1)):
                        if 0 <= nr < rows and 0 <= nc < cols and grid[nr][nc] == 1:
                            grid[nr][nc] = 0  # mark when pushed so no cell is added twice
                            stack.append((nr, nc))
                best = max(best, area)

        return best
