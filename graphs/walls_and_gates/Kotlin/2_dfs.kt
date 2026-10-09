fun wallsAndGates(rooms: Array<IntArray>) {
    if (rooms.isEmpty()) return
    val rows = rooms.size
    val cols = rooms[0].size
    val directions = listOf(Pair(1, 0), Pair(-1, 0), Pair(0, 1), Pair(0, -1))

    for (r in 0 until rows) {
        for (c in 0 until cols) {
            if (rooms[r][c] != 0) continue

            // Depth-first search from this gate. A room is only updated
            // when we arrive with a shorter distance than it already has.
            val stack = ArrayDeque<Triple<Int, Int, Int>>()
            stack.addLast(Triple(r, c, 0))
            while (stack.isNotEmpty()) {
                val (row, col, dist) = stack.removeLast()
                if (row < 0 || row >= rows || col < 0 || col >= cols) continue
                // Wall, or this room is already closer to a gate.
                if (rooms[row][col] < dist) continue
                rooms[row][col] = dist
                for ((dr, dc) in directions) {
                    stack.addLast(Triple(row + dr, col + dc, dist + 1))
                }
            }
        }
    }
}
