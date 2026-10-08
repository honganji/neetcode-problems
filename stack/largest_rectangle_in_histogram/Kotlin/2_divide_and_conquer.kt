fun largestRectangleArea(heights: IntArray): Int {
    fun solve(left: Int, right: Int): Int {
        if (left > right) {
            return 0
        }
        var minIndex = left
        for (i in left + 1..right) {
            if (heights[i] < heights[minIndex]) {
                minIndex = i
            }
        }
        return maxOf(
            heights[minIndex] * (right - left + 1),
            solve(left, minIndex - 1),
            solve(minIndex + 1, right)
        )
    }

    return solve(0, heights.size - 1)
}
