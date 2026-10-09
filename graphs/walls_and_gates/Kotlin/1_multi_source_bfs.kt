fun wallsAndGates(rooms: Array<IntArray>) {
    val inf = 2147483647
    if (rooms.isEmpty()) return
    val rows = rooms.size
    val cols = rooms[0].size
    val directions = listOf(Pair(1, 0), Pair(-1, 0), Pair(0, 1), Pair(0, -1))

    // Start the search from every gate at once.
    val queue = ArrayDeque<Pair<Int, Int>>()
    for (r in 0 until rows) {
        for (c in 0 until cols) {
            if (rooms[r][c] == 0) queue.addLast(Pair(r, c))
        }
    }

    // Expand one step at a time, so the first time a room is reached
    // is also the shortest distance to a gate.
    while (queue.isNotEmpty()) {
        val (r, c) = queue.removeFirst()
        for ((dr, dc) in directions) {
            val nr = r + dr
            val nc = c + dc
            if (nr in 0 until rows && nc in 0 until cols && rooms[nr][nc] == inf) {
                rooms[nr][nc] = rooms[r][c] + 1
                queue.addLast(Pair(nr, nc))
            }
        }
    }
}
