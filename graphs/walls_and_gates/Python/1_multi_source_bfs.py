from collections import deque

INF = 2147483647


def walls_and_gates(rooms: list[list[int]]) -> None:
    if not rooms:
        return
    rows, cols = len(rooms), len(rooms[0])

    # Start the search from every gate at once.
    queue = deque()
    for r in range(rows):
        for c in range(cols):
            if rooms[r][c] == 0:
                queue.append((r, c))

    # Expand one step at a time, so the first time a room is reached
    # is also the shortest distance to a gate.
    while queue:
        r, c = queue.popleft()
        for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nr, nc = r + dr, c + dc
            if 0 <= nr < rows and 0 <= nc < cols and rooms[nr][nc] == INF:
                rooms[nr][nc] = rooms[r][c] + 1
                queue.append((nr, nc))
