fun largestRectangleArea(heights: IntArray): Int {
    var best = 0
    val stack = ArrayDeque<Pair<Int, Int>>()
    for (i in heights.indices) {
        var start = i
        while (stack.isNotEmpty() && stack.last().second > heights[i]) {
            val (index, h) = stack.removeLast()
            best = maxOf(best, h * (i - index))
            start = index
        }
        stack.addLast(Pair(start, heights[i]))
    }
    for ((index, h) in stack) {
        best = maxOf(best, h * (heights.size - index))
    }
    return best
}
