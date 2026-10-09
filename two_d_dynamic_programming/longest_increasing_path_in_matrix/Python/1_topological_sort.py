from collections import deque


def longest_increasing_path(matrix: list[list[int]]) -> int:
    rows, cols = len(matrix), len(matrix[0])
    directions = ((1, 0), (-1, 0), (0, 1), (0, -1))

    # indegree[r][c] = how many strictly smaller neighbors can step into this cell.
    indegree = [[0] * cols for _ in range(rows)]
    for r in range(rows):
        for c in range(cols):
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if 0 <= nr < rows and 0 <= nc < cols and matrix[nr][nc] < matrix[r][c]:
                    indegree[r][c] += 1

    # Cells with no smaller neighbor are the starts of paths.
    queue = deque((r, c) for r in range(rows) for c in range(cols) if indegree[r][c] == 0)
    length = 0
    while queue:
        # Each pass over the queue is one more step along the longest paths.
        length += 1
        for _ in range(len(queue)):
            r, c = queue.popleft()
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if 0 <= nr < rows and 0 <= nc < cols and matrix[nr][nc] > matrix[r][c]:
                    indegree[nr][nc] -= 1
                    if indegree[nr][nc] == 0:
                        queue.append((nr, nc))
    return length
