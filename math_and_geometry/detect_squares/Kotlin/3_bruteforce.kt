import kotlin.math.abs

class DetectSquares {
    private val points = ArrayList<Pair<Int, Int>>()

    fun add(point: IntArray) {
        points.add(Pair(point[0], point[1]))
    }

    fun count(point: IntArray): Int {
        val x = point[0]
        val y = point[1]
        var total = 0
        // Each stored point is a candidate for the corner opposite the query point.
        // Find the other two corners by scanning the whole list.
        for ((px, py) in points) {
            if (px == x || abs(px - x) != abs(py - y)) continue
            val corner1 = Pair(x, py)
            val corner2 = Pair(px, y)
            total += points.count { it == corner1 } * points.count { it == corner2 }
        }
        return total
    }
}
