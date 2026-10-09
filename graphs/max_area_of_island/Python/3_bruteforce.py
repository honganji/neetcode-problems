from typing import List


class Solution:
    def maxAreaOfIsland(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        best = 0

        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 0:
                    continue
                # Search from this cell with its own visited set. Nothing is shared
                # with other starts, so every island is re-explored from each of its cells.
                visited = {(r, c)}
                stack = [(r, c)]
                area = 0
                while stack:
                    cr, cc = stack.pop()
                    area += 1
                    for nr, nc in ((cr + 1, cc), (cr - 1, cc), (cr, cc + 1), (cr, cc - 1)):
                        if 0 <= nr < rows and 0 <= nc < cols and grid[nr][nc] == 1 and (nr, nc) not in visited:
                            visited.add((nr, nc))
                            stack.append((nr, nc))
                best = max(best, area)

        return best
