fun spiralOrder(matrix: Array<IntArray>): List<Int> {
    val result = mutableListOf<Int>()
    var rows: List<List<Int>> = matrix.map { it.toList() }
    while (rows.isNotEmpty()) {
        result.addAll(rows.first())
        val rest = rows.drop(1)
        // Rotate counterclockwise: the last column becomes the new top row.
        rows = if (rest.isEmpty()) rest
        else rest[0].indices.map { col -> rest.map { it[col] } }.reversed()
    }
    return result
}
