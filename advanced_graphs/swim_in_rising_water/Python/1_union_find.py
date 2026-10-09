from typing import List

DIRS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def swimInWater(grid: List[List[int]]) -> int:
    n = len(grid)
    total = n * n
    # Heights are exactly 0..n*n-1, so pos[t] is the cell that becomes usable at time t.
    pos = [0] * total
    for r in range(n):
        for c in range(n):
            pos[grid[r][c]] = r * n + c

    parent = list(range(total))
    size = [1] * total
    active = [False] * total

    def find(x: int) -> int:
        while parent[x] != x:
            parent[x] = parent[parent[x]]  # path halving
            x = parent[x]
        return x

    def union(a: int, b: int) -> None:
        ra, rb = find(a), find(b)
        if ra == rb:
            return
        if size[ra] < size[rb]:
            ra, rb = rb, ra
        parent[rb] = ra
        size[ra] += size[rb]

    # Add cells in order of height. Each newly usable cell joins its usable neighbors.
    # The first time the two corners are connected, that height is the answer.
    for t in range(total):
        cell = pos[t]
        active[cell] = True
        r, c = divmod(cell, n)
        for dr, dc in DIRS:
            nr, nc = r + dr, c + dc
            if 0 <= nr < n and 0 <= nc < n and active[nr * n + nc]:
                union(cell, nr * n + nc)
        if find(0) == find(total - 1):
            return t
    return total - 1
