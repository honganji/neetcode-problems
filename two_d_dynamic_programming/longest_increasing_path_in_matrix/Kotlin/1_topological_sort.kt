fun longestIncreasingPath(matrix: Array<IntArray>): Int {
    val rows = matrix.size
    val cols = matrix[0].size
    val dRow = intArrayOf(1, -1, 0, 0)
    val dCol = intArrayOf(0, 0, 1, -1)

    // indegree[r][c] = how many strictly smaller neighbors can step into this cell.
    val indegree = Array(rows) { IntArray(cols) }
    for (r in 0 until rows) {
        for (c in 0 until cols) {
            for (k in 0 until 4) {
                val nr = r + dRow[k]
                val nc = c + dCol[k]
                if (nr in 0 until rows && nc in 0 until cols && matrix[nr][nc] < matrix[r][c]) {
                    indegree[r][c]++
                }
            }
        }
    }

    // Cells with no smaller neighbor are the starts of paths.
    val queue = ArrayDeque<Pair<Int, Int>>()
    for (r in 0 until rows) {
        for (c in 0 until cols) {
            if (indegree[r][c] == 0) queue.addLast(Pair(r, c))
        }
    }

    var length = 0
    while (queue.isNotEmpty()) {
        // Each pass over the queue is one more step along the longest paths.
        length++
        repeat(queue.size) {
            val (r, c) = queue.removeFirst()
            for (k in 0 until 4) {
                val nr = r + dRow[k]
                val nc = c + dCol[k]
                if (nr in 0 until rows && nc in 0 until cols && matrix[nr][nc] > matrix[r][c]) {
                    indegree[nr][nc]--
                    if (indegree[nr][nc] == 0) queue.addLast(Pair(nr, nc))
                }
            }
        }
    }
    return length
}
