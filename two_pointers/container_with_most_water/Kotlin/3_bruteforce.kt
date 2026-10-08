fun maxArea(height: IntArray): Int {
    var best = 0
    for (i in height.indices) {
        for (j in i + 1 until height.size) {
            val area = minOf(height[i], height[j]) * (j - i)
            if (area > best) {
                best = area
            }
        }
    }
    return best
}
