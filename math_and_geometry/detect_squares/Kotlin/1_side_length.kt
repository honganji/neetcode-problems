private const val MAX_COORD = 1000

class DetectSquares {
    private val counts = HashMap<Pair<Int, Int>, Int>()

    fun add(point: IntArray) {
        val key = Pair(point[0], point[1])
        counts[key] = (counts[key] ?: 0) + 1
    }

    fun count(point: IntArray): Int {
        val x = point[0]
        val y = point[1]
        var total = 0
        // The query point is one corner. Try every side length d and every
        // direction (dx, dy) the square can extend in from the query point.
        for (d in 1..MAX_COORD) {
            for (dx in listOf(d, -d)) {
                for (dy in listOf(d, -d)) {
                    // Opposite corner, plus the two corners that touch the query point.
                    val diag = counts[Pair(x + dx, y + dy)] ?: 0
                    if (diag == 0) continue
                    total += diag * (counts[Pair(x + dx, y)] ?: 0) * (counts[Pair(x, y + dy)] ?: 0)
                }
            }
        }
        return total
    }
}
