from collections import deque

DIRECTIONS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def pacific_atlantic(heights: list[list[int]]) -> list[list[int]]:
    m, n = len(heights), len(heights[0])

    def flood(starts: list[tuple[int, int]]) -> set[tuple[int, int]]:
        # Water flows downhill, so walk uphill from the ocean edge.
        seen = set(starts)
        queue = deque(seen)
        while queue:
            r, c = queue.popleft()
            for dr, dc in DIRECTIONS:
                nr, nc = r + dr, c + dc
                if (0 <= nr < m and 0 <= nc < n and (nr, nc) not in seen
                        and heights[nr][nc] >= heights[r][c]):
                    seen.add((nr, nc))
                    queue.append((nr, nc))
        return seen

    pacific = [(0, c) for c in range(n)] + [(r, 0) for r in range(m)]
    atlantic = [(m - 1, c) for c in range(n)] + [(r, n - 1) for r in range(m)]
    both = flood(pacific) & flood(atlantic)
    return [[r, c] for r, c in both]
