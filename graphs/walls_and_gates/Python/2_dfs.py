def walls_and_gates(rooms: list[list[int]]) -> None:
    if not rooms:
        return
    rows, cols = len(rooms), len(rooms[0])

    for r in range(rows):
        for c in range(cols):
            if rooms[r][c] != 0:
                continue
            # Depth-first search from this gate. A room is only updated
            # when we arrive with a shorter distance than it already has.
            stack = [(r, c, 0)]
            while stack:
                row, col, dist = stack.pop()
                if not (0 <= row < rows and 0 <= col < cols):
                    continue
                if rooms[row][col] < dist:  # wall, or already closer to a gate
                    continue
                rooms[row][col] = dist
                for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                    stack.append((row + dr, col + dc, dist + 1))
