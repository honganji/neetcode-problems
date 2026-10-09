func wallsAndGates(_ rooms: inout [[Int]]) {
    let inf = 2147483647
    guard !rooms.isEmpty else { return }
    let rows = rooms.count
    let cols = rooms[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    // Start a separate search from each empty room and stop at the first gate.
    for r in 0..<rows {
        for c in 0..<cols where rooms[r][c] == inf {
            var seen: Set<Int> = [r * cols + c]
            var queue: [(Int, Int, Int)] = [(r, c, 0)]
            var head = 0
            while head < queue.count {
                let (row, col, dist) = queue[head]
                head += 1
                if rooms[row][col] == 0 {
                    rooms[r][c] = dist
                    break
                }
                for (dr, dc) in directions {
                    let nr = row + dr
                    let nc = col + dc
                    if nr >= 0 && nr < rows && nc >= 0 && nc < cols
                        && rooms[nr][nc] != -1 && !seen.contains(nr * cols + nc) {
                        seen.insert(nr * cols + nc)
                        queue.append((nr, nc, dist + 1))
                    }
                }
            }
        }
    }
}
