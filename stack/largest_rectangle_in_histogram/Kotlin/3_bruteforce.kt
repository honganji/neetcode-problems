fun largestRectangleArea(heights: IntArray): Int {
    var best = 0
    for (i in heights.indices) {
        var left = i
        while (left > 0 && heights[left - 1] >= heights[i]) {
            left--
        }
        var right = i
        while (right < heights.size - 1 && heights[right + 1] >= heights[i]) {
            right++
        }
        best = maxOf(best, heights[i] * (right - left + 1))
    }
    return best
}
