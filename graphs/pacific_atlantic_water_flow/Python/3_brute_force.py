DIRECTIONS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def pacific_atlantic(heights: list[list[int]]) -> list[list[int]]:
    m, n = len(heights), len(heights[0])

    def reaches_both(start_r: int, start_c: int) -> bool:
        # Walk downhill from one cell, noting which oceans the walk touches.
        seen = {(start_r, start_c)}
        stack = [(start_r, start_c)]
        pacific = atlantic = False
        while stack:
            r, c = stack.pop()
            pacific = pacific or r == 0 or c == 0
            atlantic = atlantic or r == m - 1 or c == n - 1
            if pacific and atlantic:
                return True
            for dr, dc in DIRECTIONS:
                nr, nc = r + dr, c + dc
                if (0 <= nr < m and 0 <= nc < n and (nr, nc) not in seen
                        and heights[nr][nc] <= heights[r][c]):
                    seen.add((nr, nc))
                    stack.append((nr, nc))
        return False

    return [[r, c] for r in range(m) for c in range(n) if reaches_both(r, c)]
