from collections import deque

INF = 2147483647


def walls_and_gates(rooms: list[list[int]]) -> None:
    if not rooms:
        return
    rows, cols = len(rooms), len(rooms[0])

    # Start a separate search from each empty room and stop at the first gate.
    for r in range(rows):
        for c in range(cols):
            if rooms[r][c] != INF:
                continue
            queue = deque([(r, c, 0)])
            seen = {(r, c)}
            while queue:
                row, col, dist = queue.popleft()
                if rooms[row][col] == 0:
                    rooms[r][c] = dist
                    break
                for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                    nr, nc = row + dr, col + dc
                    if (
                        0 <= nr < rows
                        and 0 <= nc < cols
                        and rooms[nr][nc] != -1
                        and (nr, nc) not in seen
                    ):
                        seen.add((nr, nc))
                        queue.append((nr, nc, dist + 1))
