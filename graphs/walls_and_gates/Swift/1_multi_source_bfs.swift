func wallsAndGates(_ rooms: inout [[Int]]) {
    let inf = 2147483647
    guard !rooms.isEmpty else { return }
    let rows = rooms.count
    let cols = rooms[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    // Start the search from every gate at once.
    var queue: [(Int, Int)] = []
    for r in 0..<rows {
        for c in 0..<cols where rooms[r][c] == 0 {
            queue.append((r, c))
        }
    }

    // Expand one step at a time, so the first time a room is reached
    // is also the shortest distance to a gate.
    // Using an index instead of removeFirst() keeps each pop O(1).
    var head = 0
    while head < queue.count {
        let (r, c) = queue[head]
        head += 1
        for (dr, dc) in directions {
            let nr = r + dr
            let nc = c + dc
            if nr >= 0 && nr < rows && nc >= 0 && nc < cols && rooms[nr][nc] == inf {
                rooms[nr][nc] = rooms[r][c] + 1
                queue.append((nr, nc))
            }
        }
    }
}
