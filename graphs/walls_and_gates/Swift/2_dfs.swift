func wallsAndGates(_ rooms: inout [[Int]]) {
    guard !rooms.isEmpty else { return }
    let rows = rooms.count
    let cols = rooms[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    for r in 0..<rows {
        for c in 0..<cols where rooms[r][c] == 0 {
            // Depth-first search from this gate. A room is only updated
            // when we arrive with a shorter distance than it already has.
            var stack: [(Int, Int, Int)] = [(r, c, 0)]
            while let top = stack.popLast() {
                let (row, col, dist) = top
                if row < 0 || row >= rows || col < 0 || col >= cols {
                    continue
                }
                // Wall, or this room is already closer to a gate.
                if rooms[row][col] < dist {
                    continue
                }
                rooms[row][col] = dist
                for (dr, dc) in directions {
                    stack.append((row + dr, col + dc, dist + 1))
                }
            }
        }
    }
}
