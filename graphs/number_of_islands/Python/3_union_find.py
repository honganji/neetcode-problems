from typing import List


class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0

        rows, cols = len(grid), len(grid[0])
        parent = list(range(rows * cols))  # every cell starts as its own group
        size = [1] * (rows * cols)

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        # Every land cell starts as its own island; each successful merge removes one.
        islands = sum(row.count("1") for row in grid)
        for r in range(rows):
            for c in range(cols):
                if grid[r][c] != "1":
                    continue
                # Only check right and down so each pair of neighbors is handled once.
                for nr, nc in ((r, c + 1), (r + 1, c)):
                    if nr < rows and nc < cols and grid[nr][nc] == "1":
                        a = find(r * cols + c)
                        b = find(nr * cols + nc)
                        if a != b:
                            if size[a] < size[b]:
                                a, b = b, a
                            parent[b] = a
                            size[a] += size[b]
                            islands -= 1
        return islands
