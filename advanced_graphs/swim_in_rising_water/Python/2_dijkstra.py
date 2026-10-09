import heapq
from typing import List

DIRS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def swimInWater(grid: List[List[int]]) -> int:
    n = len(grid)
    # Lowest time needed to reach each cell so far. n*n is above every height.
    best = [[n * n] * n for _ in range(n)]
    best[0][0] = grid[0][0]
    heap = [(grid[0][0], 0, 0)]  # (time needed to reach the cell, row, col)

    while heap:
        t, r, c = heapq.heappop(heap)
        if t > best[r][c]:
            continue  # stale entry, a better one was already processed
        if (r, c) == (n - 1, n - 1):
            return t
        for dr, dc in DIRS:
            nr, nc = r + dr, c + dc
            if 0 <= nr < n and 0 <= nc < n:
                # Reaching the neighbor takes as long as the larger of our time and its height.
                nt = max(t, grid[nr][nc])
                if nt < best[nr][nc]:
                    best[nr][nc] = nt
                    heapq.heappush(heap, (nt, nr, nc))
    return -1
