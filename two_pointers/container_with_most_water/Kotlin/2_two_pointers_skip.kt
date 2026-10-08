fun maxArea(height: IntArray): Int {
    var left = 0
    var right = height.size - 1
    var best = 0
    while (left < right) {
        val shorter = minOf(height[left], height[right])
        val area = shorter * (right - left)
        if (area > best) {
            best = area
        }
        while (left < right && height[left] <= shorter) {
            left++
        }
        while (left < right && height[right] <= shorter) {
            right--
        }
    }
    return best
}
