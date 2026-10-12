import kotlin.math.abs

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
        // Treat each stored point as the corner opposite the query point.
        // It only works if it lies on the same diagonal (equal distance in x and y).
        for ((p, c) in counts) {
            val dx = abs(p.first - x)
            if (dx == 0 || dx != abs(p.second - y)) continue
            total += c * (counts[Pair(x, p.second)] ?: 0) * (counts[Pair(p.first, y)] ?: 0)
        }
        return total
    }
}
