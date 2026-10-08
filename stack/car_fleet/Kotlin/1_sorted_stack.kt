fun carFleet(target: Int, position: IntArray, speed: IntArray): Int {
    val order = position.indices.sortedByDescending { position[it] }
    val stack = ArrayDeque<Double>()
    for (i in order) {
        val time = (target - position[i]).toDouble() / speed[i]
        if (stack.isEmpty() || time > stack.last()) {
            stack.addLast(time)
        }
    }
    return stack.size
}
