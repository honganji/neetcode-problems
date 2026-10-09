DIRECTIONS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def pacific_atlantic(heights: list[list[int]]) -> list[list[int]]:
    m, n = len(heights), len(heights[0])

    def neighbors(r: int, c: int):
        for dr, dc in DIRECTIONS:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n:
                yield nr, nc

    # Visit cells from lowest to highest, so lower neighbors are decided first.
    order = sorted(((r, c) for r in range(m) for c in range(n)),
                   key=lambda p: heights[p[0]][p[1]])

    def drains(is_edge) -> list[list[bool]]:
        # drains[r][c] is True if water from (r, c) can reach the ocean.
        drains_to = [[False] * n for _ in range(m)]
        i = 0
        while i < len(order):
            h = heights[order[i][0]][order[i][1]]
            j = i
            while j < len(order) and heights[order[j][0]][order[j][1]] == h:
                j += 1
            # Seed cells on the edge, or cells that can flow to a lower drained cell.
            stack = []
            for r, c in order[i:j]:
                if is_edge(r, c) or any(heights[nr][nc] < h and drains_to[nr][nc]
                                        for nr, nc in neighbors(r, c)):
                    drains_to[r][c] = True
                    stack.append((r, c))
            # Equal-height cells can flow into each other, so spread through them.
            while stack:
                r, c = stack.pop()
                for nr, nc in neighbors(r, c):
                    if not drains_to[nr][nc] and heights[nr][nc] == h:
                        drains_to[nr][nc] = True
                        stack.append((nr, nc))
            i = j
        return drains_to

    pacific = drains(lambda r, c: r == 0 or c == 0)
    atlantic = drains(lambda r, c: r == m - 1 or c == n - 1)
    return [[r, c] for r in range(m) for c in range(n) if pacific[r][c] and atlantic[r][c]]
