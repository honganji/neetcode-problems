from typing import List


class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0

        # Step 1: split each row into runs of consecutive land, e.g. "11011" -> (0, 1), (3, 4).
        runs = []  # (start_col, end_col) for every run
        row_begin = []  # index in runs where each row's runs start
        for row in grid:
            row_begin.append(len(runs))
            start = -1
            for c in range(len(row) + 1):
                is_land = c < len(row) and row[c] == "1"
                if is_land and start < 0:
                    start = c
                elif not is_land and start >= 0:
                    runs.append((start, c - 1))
                    start = -1
        row_begin.append(len(runs))

        # Step 2: each run starts as its own island; runs that touch in adjacent rows merge.
        n = len(runs)
        parent = list(range(n))
        size = [1] * n
        islands = n

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        for r in range(1, len(grid)):
            i, i_end = row_begin[r - 1], row_begin[r]
            j, j_end = row_begin[r], row_begin[r + 1]
            while i < i_end and j < j_end:
                a_start, a_end = runs[i]
                b_start, b_end = runs[j]
                if a_start <= b_end and b_start <= a_end:  # columns overlap, so they touch
                    ra, rb = find(i), find(j)
                    if ra != rb:
                        if size[ra] < size[rb]:
                            ra, rb = rb, ra
                        parent[rb] = ra
                        size[ra] += size[rb]
                        islands -= 1
                # The run that ends first cannot touch any later run in the other row.
                if a_end < b_end:
                    i += 1
                else:
                    j += 1
        return islands
