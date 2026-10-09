from typing import List


class Solution:
    def maxAreaOfIsland(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        parent = list(range(rows * cols))  # each cell starts as its own group
        size = [1] * (rows * cols)         # group size, valid at each group's root

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]  # path halving: shortcut upwards
                x = parent[x]
            return x

        def union(a: int, b: int) -> None:
            ra, rb = find(a), find(b)
            if ra == rb:
                return
            if size[ra] < size[rb]:  # attach the smaller group under the larger
                ra, rb = rb, ra
            parent[rb] = ra
            size[ra] += size[rb]

        # Join each land cell with its land neighbours below and to the right.
        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 0:
                    continue
                i = r * cols + c
                if r + 1 < rows and grid[r + 1][c] == 1:
                    union(i, i + cols)
                if c + 1 < cols and grid[r][c + 1] == 1:
                    union(i, i + 1)

        best = 0
        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 1:
                    best = max(best, size[find(r * cols + c)])
        return best
