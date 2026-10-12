fun spiralOrder(matrix: Array<IntArray>): List<Int> {
    val m = matrix.size
    val n = matrix[0].size
    val visited = Array(m) { BooleanArray(n) }
    // Right, down, left, up.
    val dRow = intArrayOf(0, 1, 0, -1)
    val dCol = intArrayOf(1, 0, -1, 0)
    val result = mutableListOf<Int>()
    var row = 0
    var col = 0
    var d = 0
    repeat(m * n) {
        result.add(matrix[row][col])
        visited[row][col] = true
        var nextRow = row + dRow[d]
        var nextCol = col + dCol[d]
        // Turn clockwise when the next cell is off the grid or already used.
        if (nextRow !in 0 until m || nextCol !in 0 until n || visited[nextRow][nextCol]) {
            d = (d + 1) % 4
            nextRow = row + dRow[d]
            nextCol = col + dCol[d]
        }
        row = nextRow
        col = nextCol
    }
    return result
}
