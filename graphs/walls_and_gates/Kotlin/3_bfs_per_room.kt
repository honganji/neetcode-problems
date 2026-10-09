fun wallsAndGates(rooms: Array<IntArray>) {
    val inf = 2147483647
    if (rooms.isEmpty()) return
    val rows = rooms.size
    val cols = rooms[0].size
    val directions = listOf(Pair(1, 0), Pair(-1, 0), Pair(0, 1), Pair(0, -1))

    // Start a separate search from each empty room and stop at the first gate.
    for (r in 0 until rows) {
        for (c in 0 until cols) {
            if (rooms[r][c] != inf) continue

            val seen = hashSetOf(r * cols + c)
            val queue = ArrayDeque<Triple<Int, Int, Int>>()
            queue.addLast(Triple(r, c, 0))
            while (queue.isNotEmpty()) {
                val (row, col, dist) = queue.removeFirst()
                if (rooms[row][col] == 0) {
                    rooms[r][c] = dist
                    break
                }
                for ((dr, dc) in directions) {
                    val nr = row + dr
                    val nc = col + dc
                    if (nr in 0 until rows && nc in 0 until cols &&
                        rooms[nr][nc] != -1 && seen.add(nr * cols + nc)
                    ) {
                        queue.addLast(Triple(nr, nc, dist + 1))
                    }
                }
            }
        }
    }
}
