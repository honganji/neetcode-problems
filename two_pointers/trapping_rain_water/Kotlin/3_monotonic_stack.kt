fun trap(height: IntArray): Int {
    val stack = ArrayDeque<Int>()
    var water = 0
    for (i in height.indices) {
        while (stack.isNotEmpty() && height[stack.last()] < height[i]) {
            val bottom = stack.removeLast()
            if (stack.isEmpty()) break
            val left = stack.last()
            val width = i - left - 1
            val bounded = minOf(height[left], height[i]) - height[bottom]
            water += width * bounded
        }
        stack.addLast(i)
    }
    return water
}
